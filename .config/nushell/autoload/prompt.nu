
const USERNAME = 'Knutern'
const FOLDERS_TO_HIGHLIGHT = [
    'Python'
    'Rust'
    'Lua'
    'Svelte'
    'Mixed'
]

$env.PROMPT_COMMAND = {
    let segments = $env.PWD | path split
    let drive = $segments | first | split chars | first  # Single char
    let last = $segments | last
    
    let middle = $segments
    # Skip drive and last segment
    | skip
    | reverse
    | skip
    | reverse

    let colored_middle = $middle
    | each { |segment|  # Apply color and truncation
        if ($segment in $FOLDERS_TO_HIGHLIGHT) {
            $"(ansi blue)($segment | split chars | first)(ansi cyan)"
        } else if ($segment | str starts-with '.') {
            $"(ansi magenta)($segment | split chars | take 2 | str join)(ansi cyan)"
        } else {
            $"(ansi cyan)($segment | split chars | first)"
        }
    }
    | append ''  # For the final path delimiter, to the left of the last segment
    | path join

    $"(ansi yellow)($USERNAME) (ansi green)($drive)] ($colored_middle)(ansi red)($last)"
}

$env.PROMPT_COMMAND_RIGHT = {
    let count = gstat | get ahead
    match $count {
        -1 => return
        0 => $"(ansi magenta)::: (gstat | get branch) :::"
        1 => $"(ansi magenta)::: (gstat | get branch): +1 commit :::"
        $x => $"(ansi magenta)::: (gstat | get branch): +($x) commits :::"
    }
}
