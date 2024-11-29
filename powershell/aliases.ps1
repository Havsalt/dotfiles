# Key: Literal
# Value: String | ScriptBlock
$Aliases  = @{
    lvim  = "$HOME\.local\bin\lvim.ps1"
    hr    = 'here'
    cfmt  = {
        Write-Host 'Running `cargo fmt`'
        cargo fmt
    }
    cdf   = { if ( $filePath = fzf ) { cd "$filePath\.." } }
    codef = {
        $filePath = Resolve-Path "$(fzf)\.." | Select-Object -ExpandProperty Path
        if ( $filePath.Length -gt 3 ) { code "$filePath\.." }  # Longer than "C:\"
    }
    fcode = 'codef'
}

# Display alias count and indicate loading of them
Write-Host "Loading " -NoNewLine
Write-Host $Aliases.Count -NoNewLine -ForegroundColor Blue
Write-Host " aliases" -NoNewLine -ForegroundColor Blue
Write-Host ": " -NoNewline
Write-Host "..." -NoNewLine -ForegroundColor Yellow
# Load each alias
foreach ($alias in $Aliases.Keys) {
    if ($Aliases[$alias] -is [string]) {
        Set-Alias -Name $alias -Value $Aliases[$alias]
    } else { # `$Aliases[$alias]` is `[scriptblock]`
        New-Item -Path "Function:$alias" -Value $Aliases[$alias] -ItemType Function -Force | Out-Null
    }
}
# Update loading status to "Done"
Write-Host "`e[4D Done" -ForegroundColor Green
