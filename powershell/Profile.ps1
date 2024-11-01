
# == (Display startup message) ==

# Start with newline
Write-Host

# Display profile info
Write-Host "--< " -NoNewLine
Write-Host "Profile.ps1" -NoNewLine -ForegroundColor Red
Write-Host " >--"

# == (Load other scripts )==
# Load custom prompt
. $PSScriptRoot/Prompt.ps1
# Aliases
. $PSScriptRoot/Aliases.ps1
# Completions
. $PSScriptRoot/Load-Completions.ps1

# End with newline
Write-Host
