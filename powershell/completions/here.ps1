
using namespace System.Management.Automation
using namespace System.Management.Automation.Language

Register-ArgumentCompleter -Native -CommandName 'here' -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)

    $commandElements = $commandAst.CommandElements
    $command = @(
        'here'
        for ($i = 1; $i -lt $commandElements.Count; $i++) {
            $element = $commandElements[$i]
            if ($element -isnot [StringConstantExpressionAst] -or
                $element.StringConstantType -ne [StringConstantType]::BareWord -or
                $element.Value.StartsWith('-') -or
                $element.Value -eq $wordToComplete) {
                break
        }
        $element.Value
    }) -join ';'

    $completions = @(switch ($command) {
        'here' {
            [CompletionResult]::new('--completion', '--completion', [CompletionResultType]::ParameterName, 'Generate completion script for given shell')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'Get folder component of result')
            [CompletionResult]::new('--folder', '--folder', [CompletionResultType]::ParameterName, 'Get folder component of result')
            [CompletionResult]::new('-w', '-w', [CompletionResultType]::ParameterName, 'Use `where` command to search')
            [CompletionResult]::new('--from-where', '--from-where', [CompletionResultType]::ParameterName, 'Use `where` command to search')
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'Set current working directory to result')
            [CompletionResult]::new('--change-directory', '--change-directory', [CompletionResultType]::ParameterName, 'Set current working directory to result')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'Escape backslashes')
            [CompletionResult]::new('--escape-backslash', '--escape-backslash', [CompletionResultType]::ParameterName, 'Escape backslashes')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Wrap result in double quotes')
            [CompletionResult]::new('--wrap-quote', '--wrap-quote', [CompletionResultType]::ParameterName, 'Wrap result in double quotes')
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Resolve symlink path')
            [CompletionResult]::new('--resolve-symlink', '--resolve-symlink', [CompletionResultType]::ParameterName, 'Resolve symlink path')
            [CompletionResult]::new('-n', '-n', [CompletionResultType]::ParameterName, 'Prevent copy to clipboard')
            [CompletionResult]::new('--no-copy', '--no-copy', [CompletionResultType]::ParameterName, 'Prevent copy to clipboard')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'Suppress color')
            [CompletionResult]::new('--no-color', '--no-color', [CompletionResultType]::ParameterName, 'Suppress color')
            [CompletionResult]::new('--posix', '--posix', [CompletionResultType]::ParameterName, 'Force posix style path')
            [CompletionResult]::new('--no-posix', '--no-posix', [CompletionResultType]::ParameterName, 'Prevent posix style path')
            [CompletionResult]::new('--select-first', '--select-first', [CompletionResultType]::ParameterName, 'Select first option if multiresult')
            [CompletionResult]::new('--markdown', '--markdown', [CompletionResultType]::ParameterName, 'Generate markdown help page')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
    })

    $completions.Where{ $_.CompletionText -like "$wordToComplete*" } |
        Sort-Object -Property ListItemText
}


Register-ArgumentCompleter -Native -CommandName 'hr' -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)

    $commandElements = $commandAst.CommandElements
    $command = @(
        'hr'
        for ($i = 1; $i -lt $commandElements.Count; $i++) {
            $element = $commandElements[$i]
            if ($element -isnot [StringConstantExpressionAst] -or
                $element.StringConstantType -ne [StringConstantType]::BareWord -or
                $element.Value.StartsWith('-') -or
                $element.Value -eq $wordToComplete) {
                break
        }
        $element.Value
    }) -join ';'

    $completions = @(switch ($command) {
        'hr' {
            [CompletionResult]::new('--completion', '--completion', [CompletionResultType]::ParameterName, 'Generate completion script for given shell')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'Get folder component of result')
            [CompletionResult]::new('--folder', '--folder', [CompletionResultType]::ParameterName, 'Get folder component of result')
            [CompletionResult]::new('-w', '-w', [CompletionResultType]::ParameterName, 'Use `where` command to search')
            [CompletionResult]::new('--from-where', '--from-where', [CompletionResultType]::ParameterName, 'Use `where` command to search')
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'Set current working directory to result')
            [CompletionResult]::new('--change-directory', '--change-directory', [CompletionResultType]::ParameterName, 'Set current working directory to result')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'Escape backslashes')
            [CompletionResult]::new('--escape-backslash', '--escape-backslash', [CompletionResultType]::ParameterName, 'Escape backslashes')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Wrap result in double quotes')
            [CompletionResult]::new('--wrap-quote', '--wrap-quote', [CompletionResultType]::ParameterName, 'Wrap result in double quotes')
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Resolve symlink path')
            [CompletionResult]::new('--resolve-symlink', '--resolve-symlink', [CompletionResultType]::ParameterName, 'Resolve symlink path')
            [CompletionResult]::new('-n', '-n', [CompletionResultType]::ParameterName, 'Prevent copy to clipboard')
            [CompletionResult]::new('--no-copy', '--no-copy', [CompletionResultType]::ParameterName, 'Prevent copy to clipboard')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'Suppress color')
            [CompletionResult]::new('--no-color', '--no-color', [CompletionResultType]::ParameterName, 'Suppress color')
            [CompletionResult]::new('--posix', '--posix', [CompletionResultType]::ParameterName, 'Force posix style path')
            [CompletionResult]::new('--no-posix', '--no-posix', [CompletionResultType]::ParameterName, 'Prevent posix style path')
            [CompletionResult]::new('--select-first', '--select-first', [CompletionResultType]::ParameterName, 'Select first option if multiresult')
            [CompletionResult]::new('--markdown', '--markdown', [CompletionResultType]::ParameterName, 'Generate markdown help page')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
    })

    $completions.Where{ $_.CompletionText -like "$wordToComplete*" } |
        Sort-Object -Property ListItemText
}
