
const PACKAGES = [
    # Tools
    ruff
    maturin
    pydoc-markdown
    poethepoet
    strox
    git-filter-repo
    # Games
    havsalt-termnautica
    havsalt-little-termite
    havsalt-far-science
]
 
def main [
    --upgrade (-u)  # Attempt to upgrade all packages
] {
    let count = $PACKAGES | length
    print $"[*] Ensuring ($count) uv tool(if $count > 1 { 's are' } else { ' is' }) installed:"
    $PACKAGES | each {|pkg|
        let cmd = $"uv tool install ($pkg) (if $upgrade { '--upgrade' } else { '' })"
        print $"> ($cmd)"
        nu -c $cmd
    }
    return (
        '`-> Ensured '
        + ($count | into string)
        + $" uv tool(if $count > 1 { 's were' } else { ' was' }) installed"
    )
}
