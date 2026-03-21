
def main [] {
    let tmp_file = 'vs_buildtools.exe'
    # Download the installer
    http get https://aka.ms/vs/17/release/vs_buildtools.exe
    | save $tmp_file
    # Run the installer as unattended install
    ^./($tmp_file) -y
    # Clean up
    rm $tmp_file
}
