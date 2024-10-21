
# function Set-Location {
#     param (
#         [Parameter(ValueFromRemainingArguments)]$segments # Collect all segments
#     )
#     $fullPath = $segments -join ' ' # Join arguments with spaces
#     # $quotedPath = "`"$fullPath`"" # Wrap path in quotes
#     & Microsoft.PowerShell.Management\Set-Location $fullPath
#     # Write-Host (Get-Location) -ForegroundColor Red
# }

# == (Load other scripts )==
# Load custom prompt
. $PSScriptRoot/prompt.ps1
# Aliases
. $PSScriptRoot/aliases.ps1
# Completions
Get-ChildItem $PSScriptroot/completions | ForEach-Object {
    # '$_' represents the current file or directory in the iteration
    Write-Host "Loading completions from: $($_.Name)"
    . $_.FullName
}
