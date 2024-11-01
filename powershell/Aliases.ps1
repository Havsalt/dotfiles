# Key: Literal
# Value: String | ScriptBlock
$aliases  = @{
    lvim  = 'C:\Users\knuto\.local\bin\lvim.ps1'
    hr    = 'here'
    cdf   = { "$(fzf)\.." | cd }
    codef = { code (Resolve-Path "$(fzf)\.." | Select-Object -ExpandProperty Path) }
    fcode = 'codef'
}

# Display alias count
Write-Host "Loading " -NoNewLine
Write-Host $aliases.Count -NoNewLine -ForegroundColor Blue
Write-Host " aliases" -NoNewLine -ForegroundColor Blue
Write-Host ": " -NoNewline
Write-Host "..." -NoNewLine -ForegroundColor Yellow
# Load each alias
foreach ($alias in $aliases.Keys) {
    if ($aliases[$alias] -is [string]) {
        Set-Alias -Name $alias -Value $aliases[$alias]
    } else { # `$aliases[$alias]` is `[scriptblock]`
        New-Item -Path "Function:$alias" -Value $aliases[$alias] -ItemType Function -Force | Out-Null
    }
}
# Update loading status to "Done"
Write-Host "`e[4D Done" -ForegroundColor Green
