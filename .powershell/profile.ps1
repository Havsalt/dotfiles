
function Prompt
{
    $location = (Get-Location).Path
    $splitLocation = $location -split "\\"
    $drive = @($splitLocation[0][0])
    $mappedMiddle =
        ($splitLocation[1..($splitLocation.Length - 2)]
            | ForEach-Object { $_[0] })
    $lastSegment = $splitLocation[-1]

    Write-Host "Knutern" -NoNewLine -ForegroundColor Yellow
    Write-Host " @ " -NoNewLine -ForegroundColor Magenta
    Write-Host "$drive] " -NoNewLine -ForegroundColor Green
    Write-Host $($mappedMiddle -join "\") -NoNewLine -ForegroundColor Cyan
    Write-Host "\" -NoNewLine -ForegroundColor Cyan
    Write-Host $lastSegment -NoNewLine -ForegroundColor Red
    Write-Host ">" -NoNewLine -ForegroundColor Cyan
    return " "
}

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
# Aliases
. $PSScriptRoot/aliases.ps1
# Completions
Get-ChildItem $PSScriptroot/completions | ForEach-Object {
    # '$_' represents the current file or directory in the iteration
    Write-Host "Loading completions from: $($_.Name)"
    . $_.FullName
}
