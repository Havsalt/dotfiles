
# function Set-Location {
#     param (
#         [Parameter(ValueFromRemainingArguments)]$segments # Collect all segments
#     )
#     $fullPath = $segments -join ' ' # Join arguments with spaces
#     # $quotedPath = "`"$fullPath`"" # Wrap path in quotes
#     & Microsoft.PowerShell.Management\Set-Location $fullPath
#     # Write-Host (Get-Location) -ForegroundColor Red
# }

# == (Display startup message)
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
