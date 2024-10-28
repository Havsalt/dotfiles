
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
Write-Host "-=< " -NoNewLine
Write-Host "profile.ps1" -NoNewLine -ForegroundColor Red
Write-Host " >=-"

# == (Load other scripts )==
# Load custom prompt
. $PSScriptRoot/prompt.ps1
# Aliases
. $PSScriptRoot/aliases.ps1
# Completions
. $PSScriptRoot/load_completions.ps1
