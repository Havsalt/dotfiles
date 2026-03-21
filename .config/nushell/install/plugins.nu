
# Nushell pliugin names (just the name, *not* "nu_plugin_" prefix)
const PLUGIN_NAMES = [
    vec
    units
    gstat
    tree
    clipboard
    emoji
    highlight
    inc
    semver
    audio
    audio_hook
    file
    formats
    plot
    plotters
    ws
    terminal_qr
]
const GITHUB = 'https://github.com'
const PLUGIN_GIT_REPOS = [
    FMotalleb/nu_plugin_image
    Kissaki/nu_plugin_bson
]

def main [
    --upgrade (-u)  # Attempt to upgrade all packages
] {
    # Apply final string transformations
    let locked_packages = [
        ...($PLUGIN_NAMES | each { |name| $"nu_plugin_($name)" })
        ...($PLUGIN_GIT_REPOS | each { |repo| $"--git ($GITHUB)/($repo)" })
    ]
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
