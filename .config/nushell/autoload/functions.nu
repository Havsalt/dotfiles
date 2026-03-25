
# Format python project.
def 'fmt python' [] {
    let cmd = [uv run ruff format] | str join ' '
    print $"fmt: ($cmd)"
    nu -c $cmd
}

# Format rust project.
def 'fmt rust' [] {
    let cmd = [cargo fmt] | str join ' '
    print $"fmt: ($cmd)"
    nu -c $cmd
}

# Automatically format a project using the proper formatter(s).
def fmt [] {
    mut $times_formatted = 0
    if ('pyproject.toml' | path exists) {
        job spawn { fmt python }
        $times_formatted += 1
    }
    if ('Cargo.toml' | path exists) {
        job spawn { fmt rust }
        $times_formatted += 1
    }
    if $times_formatted == 0 {
        error make 'fmt: No proper formatter found'
    }
}

# Checkout a branch using `fzf` to select from git branches.
def 'git select' [] {
    ^git branch
    | lines
    | str trim --char '*'
    | str trim
    | to text
    | ^fzf --header='::: Select git branch to checkout :::'
    | ^git checkout $in
}
alias oo = git select