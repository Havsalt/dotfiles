
# Display loading info
Write-Host "Loading " -NoNewLine
Write-Host "completions" -NoNewLine -ForegroundColor Blue
Write-Host ":"
# Load completions
Get-ChildItem $PSScriptroot/completions | ForEach-Object {
    Write-Host "- " -NoNewLine
    Write-Host $_.Name -ForegroundColor Green
    . $_.FullName
}
