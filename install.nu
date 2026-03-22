
const _INSTALL_ORDER = [
    'build_essentials'
    'rust'
    'uv'
]

# Order of prioritized files to load
def main [] {
    let install_folder = $nu.default-config-dir | path join install
    let count = $install_folder
    | ls $in
    | length
    print $"[*] Running ($count) install scripts, starting with prioritized ones:"
    # Install prioritized first - The rest might depend on these
    # TODO: Check if commands like `cargo` is available in the same install session
    $_INSTALL_ORDER
    | each { |stem| $install_folder | path join $"($stem).nu" }
    | each { |filepath|
        print $"> ($filepath)"
        # nu $filepath
    }
    # Dynamically run each `main` *remaining* function,
    # for each file in the install folder
    $install_folder
    | ls $in
    | where ($it.name | path parse).stem not-in $_INSTALL_ORDER
    | get name
    | each { |filepath|
        print $"> ($filepath)"
        # nu $filepath
    }
    return $"`-> Ran ($count) install scripts"
}
