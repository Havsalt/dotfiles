
def main [] {
    print 'Downloading tool: uv'
    if $nu.os-info.name == 'windows' {
        print 'Detected Windows. Running shell installer...'
        # Fetch, then run windows installer
        powershell -ExecutionPolicy ByPass -c 'irm https://astral.sh/uv/install.ps1 | iex'
    } else {
        print 'Detected Unix-like system (Linux/macOS). Running shell installer...'
        # Use curl to fetch, then run the official sh script
        bash -c 'curl -LsSf https://astral.sh/uv/install.sh | sh'
    }
    # Add `uv` to PATH
    let uv_bin = ($env.CARGO_HOME | path join 'bin')
    if ($uv_bin | path exists) {
        $env.PATH = ($env.PATH | split row (char esep) | append $uv_bin | uniq)
    }
}
