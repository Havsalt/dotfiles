
# Nushell pliugin names (just the name, *not* "nu_plugin_" prefix)
const PLUGIN_NAMES = [
    vec
    units
    gstat
    tree
    clipboard
    emoji
    highlight
    image
    inc
    semver
    audio
    audio_hook
    bson
    file
    formats
    plot
    plotters
    term_plot
    pnet
    ws
    terminal_qr
]

def main [
    --upgrade (-u)  # Attempt to upgrade all packages
] {
    # Apply final string transformations
    let locked_packages = $PLUGIN_NAMES
    | each { |name| $"nu_plugin_($name)" }
    | each { |package| $"($package) --locked" }
    
    let count = $locked_packages | length
    print $"[*] Ensuring ($count) nu plugin(if $count > 1 { 's are' } else { ' is' }) installed:"
    $locked_packages | each {|pkg|
        let cmd = $"cargo install ($pkg) (if $upgrade { '--upgrade' } else { '' })"
        print $"> ($cmd)"
        nu -c $cmd
    }
    return (
        '`-> Ensured '
        + ($count | into string)
        + $" nu plugin(if $count > 1 { 's were' } else { ' was' }) installed"
    )
}
