
# 3rd party tools
let TOOLS = [
    'zoxide --version 0.9.9'  # Works with Nushell v0.111.0
    bat
    ripgrep
    mdcat
    havsalt-here
]

def main [
    --upgrade (-u)  # Attempt to upgrade all packages
] {
    # Apply final string transformations
    let locked_packages = $TOOLS
    | each { |package| $"($package) --locked" }
    
    let count = $locked_packages | length
    print $"[*] Ensuring ($count) cargo tool(if $count > 1 { 's are' } else { ' is' }) installed:"
    $locked_packages | each {|pkg|
        let cmd = $"cargo install ($pkg) (if $upgrade { '--upgrade' } else { '' })"
        print $"> ($cmd)"
        nu -c $cmd
    }
    return (
        '`-> Ensured '
        + ($count | into string)
        + $" cargo tool(if $count > 1 { 's were' } else { ' was' }) installed"
    )
}
