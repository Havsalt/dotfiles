# Key: Literal
# Value: String | ScriptBlock
$Aliases  = @{
    ls    = 'eza'  # Override default ls
    hr    = 'here'
    grep  = 'rg'
    cdf   = { if ( $filePath = fzf ) { cd "$filePath\.." } }
    codef = {
        $filePath = Resolve-Path "$(fzf)\.." | Select-Object -ExpandProperty Path
        if ( $filePath.Length -gt 3 ) { code "$filePath\.." }  # Longer than "C:\"
    }
    fcode = 'codef'
    cfmt  = {
        Write-Host 'Running `cargo fmt`'
        cargo fmt
    }
    rr    = {
        Clear-Host         # Clear screen
        Invoke-History -2  # Re-run command
    }
    ww    = {
        Write-Host 'Running: `rye run main`'
        rye run main
    }
    dd    = {
        Write-Host 'Running: `rye fmt`'
        rye fmt
    }
}

function deep {
    eza.exe -DTL 2  # Help: Read flags as "Directory Tree Levels = 2"
}

# Display alias count and indicate loading of them
Write-Host "Loading " -NoNewLine
Write-Host ($Aliases.Count + 1) -NoNewLine -ForegroundColor Blue  # NOTE: Static +1, because of function `deep`
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
