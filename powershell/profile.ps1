
# == (Display startup message) ==

# Start with newline
Write-Host

# Display profile info
Write-Host "--< " -NoNewLine
Write-Host "Profile.ps1" -NoNewLine -ForegroundColor Red
Write-Host " >--"

# == (Load other scripts )==
# Load custom prompt
. $PSScriptRoot/prompt.ps1
# Aliases
. $PSScriptRoot/aliases.ps1
# Completions
. $PSScriptRoot/load-completions.ps1

# End with newline
Write-Host
