
$paths = Get-ChildItem "$PSScriptroot/completions"
# Display loading info
Write-Host "Loading " -NoNewLine
Write-Host $paths.Count -NoNewLine -ForegroundColor Blue
Write-Host " completions" -NoNewLine -ForegroundColor Blue
Write-Host ":" -NoNewLine
Write-Host "..." -NoNewLine -ForegroundColor Yellow
# Load completions
$paths | ForEach-Object {
    # # Uncomment to show which completions that are loaded
    # Write-Host "- " -NoNewLine
    # Write-Host $_.Name -ForegroundColor Green
    . $_.FullName
}
# Update loading status to "Done"
Write-Host "`e[3D Done" -ForegroundColor Green
