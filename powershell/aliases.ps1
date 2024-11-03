# Key: Literal
# Value: String | ScriptBlock
$aliases  = @{
    lvim  = "$HOME\.local\bin\lvim.ps1"
    hr    = 'here'
    cdf   = { if ( $filePath = fzf ) { cd "$filePath\.." } }
    codef = {
        $filePath = Resolve-Path "$(fzf)\.." | Select-Object -ExpandProperty Path
        if ( $filePath.Length -gt 3 ) { code "$filePath\.." }  # Longer than "C:\"
    }
    fcode = 'codef'
}

# Display alias count and indicate loading of them
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
