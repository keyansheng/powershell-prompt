# Prompt

```
~\Doc\Win\Mod\powershell-prompt main* ⇡1 ⇣1 Artist - Song 500ms
#❯
```

- always visible (blue)
  - `~\Doc\Win\Mod\powershell-prompt`: short path name for `C:\Users\You\Documents\WindowsPowerShell\Modules\powershell-prompt`
  - `❯`: prompt character
- visible in a git repo (cyan)
  - `main`: current git branch
  - `*`: git tree/index is dirty
  - `⇡1 ⇣1`: 1 commit ahead, 1 commit behind relative to remote
- visible when a song is playing in the spotify app (green)
  - `Artist - Song`: window title of the spotify app
- visible when the last command took ≥500ms (magenta)
  - `500ms`: execution time of the last command
- visible when powershell is run as admin (blue)
  - `#`: admin indicator (only appears)

# Window title

```
#~\Documents\WindowsPowerShell\Modules\powershell-prompt (main* ⇡1 ⇣1)
```

# Install/Update (Git)

```powershell
# Install
git clone https://github.com/keyansheng/powershell-prompt $HOME\Documents\WindowsPowerShell\Modules\powershell-prompt

# Update
git -C $HOME\Documents\WindowsPowerShell\Modules\powershell-prompt pull
```

# Install/Update ([Scoop](https://scoop.sh/))

```powershell
# Install
scoop install https://raw.githubusercontent.com/keyansheng/powershell-prompt/main/powershell-prompt.json

# Update
scoop update powershell-prompt
```

# Run

```powershell
# Use it in the current powershell session
Import-Module powershell-prompt

# Run it every time you open powershell
'Import-Module powershell-prompt' >> $PROFILE
```

# Customise

Edit `powershell-prompt.psm1`. Possible customisations include:

- switch to full path
- change git status icons
- add support for your preferred music player
- adjust execution time threshold and format
- change colour for each section
- add additional sections
- basically anything you can do with powershell
