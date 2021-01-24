if (
    ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::
    GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
) { $Admin = '#' }

function prompt {
    $Path = (Get-Location).ProviderPath.Replace($HOME, '~')
    $ShortPath = $Path -replace '([^\\]{1,3})[^\\]*\\', '$1\'

    $GitBranch = git rev-parse --abbrev-ref HEAD
    if ($GitBranch) {
        if ($GitBranch -eq 'HEAD') {
            $GitBranch = git rev-parse --short HEAD
        } else {
            $GitAheadBehind =
            ((git status --porcelain --branch) -split '\n')[0] -replace
            '^## .*?(\[([^,]*)(, )?([^,]*)\])?$', '$2$3' -replace
            'ahead ', ' ⇡' -replace
            'behind ', ' ⇣'
        }
        if (git status --porcelain) { $GitDirty = '*' }
        $Git = " $GitBranch$GitDirty$GitAheadBehind"
        $GitTitle = " -$Git"
    }

    $Spotify = (
        Get-Process Spotify | Where-Object MainWindowTitle -Match ' - '
    ).MainWindowTitle

    $LastCommand = Get-History -Count 1
    $ExecutionTime = $LastCommand.EndExecutionTime - $LastCommand.StartExecutionTime
    $ExecutionTime = if ($ExecutionTime -ge 10000000) {
        " $($ExecutionTime.TotalSeconds)s"
    } elseif ($ExecutionTime -ge 5000000) {
        " $($ExecutionTime.TotalMilliseconds)ms"
    }

    $Host.UI.RawUI.WindowTitle = "$Admin$Path$GitTitle"

    Write-Host $ShortPath -ForegroundColor Blue -NoNewline
    Write-Host $Git -ForegroundColor Cyan -NoNewline
    Write-Host $Spotify -ForegroundColor Green -NoNewline
    Write-Host $ExecutionTime -ForegroundColor Magenta
    Write-Host $Admin❯ -ForegroundColor Blue -NoNewline
    return ' '
}
