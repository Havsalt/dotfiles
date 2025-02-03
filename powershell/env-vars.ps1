# Key: Literal
# Value: String Path
$RootRelativeEnvironmentPaths = @{  # Relative to ".dotfiles" project folder
    # NOTE: These have to be exported from env vars menu
    XDG_CONFIG_HOME = ".config"
    CARGO_HOME = ".cargo"
    RUSTUP_HOME = ".rustup"
    RYE_HOME = ".rye"
}
$EnvironmentVariables = @{
    RUST_BACKTRACE = 1
}

# Calculate total count of environment variables
$totalCount = (
    $RootRelativeEnvironmentPaths.Count `
    + $EnvironmentVariables.Count
)
# Display environment variables count and indicate loading of them
Write-Host "Loading " -NoNewLine
Write-Host $totalCount -NoNewLine -ForegroundColor Blue
Write-Host " environment variables" -NoNewLine -ForegroundColor Blue
Write-Host ": " -NoNewline
Write-Host "..." -NoNewLine -ForegroundColor Yellow
# Load each relative environment path variable
foreach ($relEnvVar in $RootRelativeEnvironmentPaths.Keys) {
    $joined = "$PSScriptRoot\..\$($RootRelativeEnvironmentPaths[$relEnvVar])"
    $normalized = [System.IO.Path]::GetFullPath($joined)
    Set-Variable -Name $relEnvVar -Value $normalized
}
# Load generic environment variables
foreach ($EnvVar in $EnvironmentVariables.Keys) {
    Set-Variable -Name $EnvVar -Value $EnvironmentVariables[$EnvVar]
}
# Update loading status to "Done"
Write-Host "`e[4D Done" -ForegroundColor Green
