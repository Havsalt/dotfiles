
def main [] {
    print '[*] Downloading tools: rustup, cargo'
    if $nu.os-info.name == 'windows' {
        print 'Detected Windows. Downloading rustup-init.exe...'
        let tmp_file = 'rustup-init.exe'
        # Download the Windows installer
        http get https://static.rust-lang.org
        | save -f $tmp_file
        # Run the installer with the -y (yes) flag for unattended install
        ^./($tmp_file) -y
        # Clean up
        rm $tmp_file
    } else {
        print 'Detected Unix-like system (Linux/macOS). Running shell installer...'
        # Use curl to fetch and run the official sh script
        bash -c 'curl --proto "=https" --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y'
    }
    # Add `Cargo` to PATH
    let cargo_bin = ($env.CARGO_HOME | path join 'bin')
    if ($cargo_bin | path exists) {
        $env.PATH = ($env.PATH | split row (char esep) | append $cargo_bin | uniq)
    }
    return '`-> Installed: rustup, cargo'
}
