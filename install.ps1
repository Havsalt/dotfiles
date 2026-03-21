# Constants
$nuId = "Nushell.Nushell"
$nuName = "nushell"
$wingetName = "winget"

# Temporary environment variable
$env:NU_CONFIG_DIR = ( `
    Join-Path `
    $PSScriptRoot `
    ".config" `
    "nushell" `
    "config.nu" `
)

# Install latest version of Winget
Write-Host "[*] Installing latest version of $wingetName" -ForegroundColor Blue
$wingetDownloadUrl = "https://github.com/microsoft/winget-cli/releases/latest/download/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
$wingetTempFile = Join-Path -Path $env:TEMP -ChildPath "winget.msixbundle"
Invoke-WebRequest $wingetDownloadUrl -OutFile $wingetTempFile
Add-AppxPackage -Path $wingetTempFile
Write-Host "`-> Done" -ForegroundColor Blue

# Install Nushell
Write-Host "[*] Installing $nuName using $wingetName" -ForegroundColor Blue
winget install $nuId --scope user --force
# Get default installation path
$nuLocation = (winget list --details $nuId | Select-String -Pattern "Installed Location:\s(.+)").Matches.Groups[1].Value
Write-Host "`-> $nuName is installed under: $nuLocation" -ForegroundColor Blue

# Add Nushell to PATH, if not already there
Write-Host "[*] Ensuring $nuName executable is available from PATH" -ForegroundColor Blue
$nuBinFolder = Join-Path -Path $nuLocation -ChildPath "bin"
$currentPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($currentPath -split ';' -notcontains $nuBinFolder) {
    [Environment]::SetEnvironmentVariable("Path", "$currentPath;$nuBinFolder", "User")
    Write-Host "`-> Added $nuName bin to PATH: $nuBinFolder" -ForegroundColor Green
} else {
    Write-Host "`-> $nuName bin already in PATH: $nuBinFolder" -ForegroundColor Yellow
}

# Use full path to nushell EXE, as the current shell session does not have access to the "nu" command
Write-Host "[*] Finding path to $nuName executable" -ForegroundColor Blue
$nuExe = Join-Path -Path $nuBinFolder -ChildPath "nu.exe"
Write-Host "`-> Found $nuName executable: $nuExe" -ForegroundColor Blue

Write-Host "[*] Running $nuName installer: install.nu" -ForegroundColor Blue
& $nuExe install.nu
Write-Host "`-> Done" -ForegroundColor Blue

Write-Host "[] Starting $nuName session" -ForegroundColor Blue
& $nuExe
