
$FolderNamesToHighlight = @(
    "Python",
    "Rust",
    "Lua",
    "Svelte",
    "Mixed"
)

# Custom prompt text
function Prompt {
    $location = (Get-Location).Path
    $splitLocation = $location -split "\\"
    $drive = $splitLocation[0][0]
    $middleSegments = $splitLocation[1..($splitLocation.Length - 2)]
    $lastSegment = $splitLocation[-1]
    # Write to screen
    Write-Host "Knutern" -NoNewLine -ForegroundColor Yellow
    Write-Host " @ " -NoNewLine -ForegroundColor Magenta
    Write-Host "$drive] " -NoNewLine -ForegroundColor Green
    # Write segments, and color if special
    foreach ($segment in $middleSegments) {
        if ($FolderNamesToHighlight -contains $segment) {
            Write-Host $segment[0] -NoNewLine -ForegroundColor Blue            
        } elseif ($segment[0] -eq ".") {
            Write-Host ".$($segment[1])" -NoNewLine -ForegroundColor Magenta            
        }
        else {
            Write-Host $segment[0] -NoNewLine -ForegroundColor Cyan
        }
        Write-Host "\" -NoNewLine -ForegroundColor Cyan
    }
    # Write last segment
    Write-Host $lastSegment -NoNewLine -ForegroundColor Red
    Write-Host ">" -NoNewLine -ForegroundColor Cyan
    return " "
}
