
def 'fmt python' [] {
    let cmd = [uv run ruff format] | str join ' '
    print $"fmt: ($cmd)"
    nu -c $cmd
}

def 'fmt rust' [] {
    let cmd = [cargo fmt] | str join ' '
    print $"fmt: ($cmd)"
    nu -c $cmd
}

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
