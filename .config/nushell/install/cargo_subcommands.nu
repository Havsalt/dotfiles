
# Cargo subcommands (just the name, *not* "cargo-" prefix)
let SUBCOMMANDS = [
    info
    edit
]

def main [
    --upgrade (-u)  # Attempt to upgrade all packages
] {
    # Apply final string transformations
    let locked_packages = $SUBCOMMANDS
    | each { |package| $"($package) --locked" }
    
    let count = $locked_packages | length
    print $"[*] Ensuring ($count) cargo subcommand(if $count > 1 { 's are' } else { ' is' }) installed:"
    $locked_packages | each {|pkg|
        let cmd = $"cargo install ($pkg) (if $upgrade { '--upgrade' } else { '' })"
        print $"> ($cmd)"
        nu -c $cmd
    }
    return (
        '`-> Ensured '
        + ($count | into string)
        + $" cargo subcommand(if $count > 1 { 's were' } else { ' was' }) installed"
    )
}
