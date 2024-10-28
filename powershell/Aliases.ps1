
$aliases = @{
    'lvim' = 'C:\Users\knuto\.local\bin\lvim.ps1'
    'hr'   = 'here'
}

# Display alias count
Write-Host "Loading " -NoNewLine
Write-Host $aliases.count -NoNewLine -ForegroundColor Blue
Write-Host " aliases" -NoNewLine -ForegroundColor Blue
Write-Host ": " -NoNewline
Write-Host "..." -NoNewLine -ForegroundColor Yellow
# Load each alias
$aliases.GetEnumerator() | ForEach-Object {
    Set-Alias -Name $_.key -Value $_.value
}
# Update loading status to "Done"
Write-Host "`e[4D Done" -ForegroundColor Green
