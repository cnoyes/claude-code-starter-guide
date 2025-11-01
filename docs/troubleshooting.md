# Troubleshooting Guide

Common issues and solutions when setting up and using Claude Code. Use this guide to solve problems quickly and get back to building!

## Table of Contents

- [Installation Issues](#installation-issues)
- [API Key Problems](#api-key-problems)
- [Terminal Issues](#terminal-issues)
- [Git and GitHub Problems](#git-and-github-problems)
- [Claude Code Runtime Issues](#claude-code-runtime-issues)
- [Platform-Specific Issues](#platform-specific-issues)
- [Getting Help](#getting-help)

---

## Installation Issues

### "command not found" After Installation

**Problem:** After installing Claude Code, you get "command not found" when running `claude`.

**Solutions:**

**1. Restart your terminal**
- Close and reopen your terminal window
- This refreshes the PATH environment variable

**2. Check if npm global bin is in PATH**

**macOS/Linux:**
```bash
npm config get prefix
# Should show something like /usr/local or ~/.npm-global

# Add to PATH if needed (replace path with your actual path):
echo 'export PATH="$HOME/.npm-global/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

**Windows:**
```powershell
npm config get prefix
# Make sure this path is in your System PATH environment variable
```

**3. Reinstall Claude Code**
```bash
npm uninstall -g @anthropic-ai/claude-code
npm install -g @anthropic-ai/claude-code
```

**4. Check Node.js installation**
```bash
node --version
npm --version
```
If these don't work, Node.js isn't properly installed. Revisit the setup guide.

### Permission Errors During Installation

**Problem:** "EACCES: permission denied" when installing Claude Code

**Solutions:**

**macOS/Linux:**
```bash
# Option 1: Use sudo (not recommended but quick)
sudo npm install -g @anthropic-ai/claude-code

# Option 2: Fix npm permissions (recommended)
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
echo 'export PATH="$HOME/.npm-global/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
npm install -g @anthropic-ai/claude-code
```

**Windows:**
- Right-click PowerShell
- Select "Run as Administrator"
- Try installation again

### npm or Node Not Found

**Problem:** "npm: command not found" or "node: command not found"

**Solution:**
- Node.js isn't installed or not in PATH
- Go back to the setup guide and reinstall Node.js
- On Windows, make sure to check "Add to PATH" during installation
- After installing, **restart your terminal** or computer

---

## API Key Problems

### "API key not found" or "Authentication failed"

**Problem:** Claude Code can't find your API key or says it's invalid.

**Check if key is set:**

**macOS/Linux:**
```bash
echo $ANTHROPIC_API_KEY
```

**Windows:**
```powershell
$env:ANTHROPIC_API_KEY
```

**If empty, set it:**

**macOS (zsh):**
```bash
echo 'export ANTHROPIC_API_KEY="your-key-here"' >> ~/.zshrc
source ~/.zshrc
```

**macOS (bash):**
```bash
echo 'export ANTHROPIC_API_KEY="your-key-here"' >> ~/.bash_profile
source ~/.bash_profile
```

**Windows:**
```powershell
[System.Environment]::SetEnvironmentVariable('ANTHROPIC_API_KEY', 'your-key-here', 'User')
# Then restart PowerShell
```

**Verify it worked:**
```bash
claude --version
# Should not show API key errors
```

### "Invalid API key" Error

**Problem:** API key is set but Claude says it's invalid.

**Solutions:**

1. **Check for extra spaces or quotes:**
   - Make sure there are no spaces before/after the key
   - Don't include quotes in the actual key value

2. **Regenerate your API key:**
   - Go to [console.anthropic.com](https://console.anthropic.com)
   - Create a new API key
   - Update your environment variable with the new key

3. **Check key permissions:**
   - Make sure the API key has the necessary permissions
   - Some features require specific scopes

### API Key Not Persisting

**Problem:** API key works in current terminal but not in new terminals.

**Solution:**
- The key is only set for the current session
- Follow the "set it permanently" instructions in the setup guide
- Make sure you're editing the correct shell config file
- After editing, run `source ~/.zshrc` (or appropriate config file)

---

## Terminal Issues

### Can't Find Terminal

**macOS:**
- Press `Cmd + Space`
- Type "Terminal"
- Press Enter

Or look in: Applications → Utilities → Terminal

**Windows:**
- Press `Windows Key + X`
- Select "Windows PowerShell" or "Terminal"

Or: Press `Windows Key`, type "PowerShell", press Enter

### Terminal Commands Don't Work

**Problem:** Commands from this guide don't work in your terminal.

**Solutions:**

**Windows users:** Make sure you're using PowerShell, not Command Prompt
- PowerShell: Blue window, says "PS" in prompt
- Command Prompt: Black window, says "C:\" in prompt
- Use PowerShell!

**macOS/Linux users:** Different shells have different syntax
- Check your shell: `echo $SHELL`
- This guide assumes bash or zsh
- If using fish or another shell, commands may differ

### Can't Copy/Paste in Terminal

**macOS:**
- Copy: `Cmd + C`
- Paste: `Cmd + V`

**Windows:**
- Copy: `Ctrl + C` or `Ctrl + Shift + C`
- Paste: `Ctrl + V` or `Ctrl + Shift + V` or Right-click

**Linux:**
- Copy: `Ctrl + Shift + C`
- Paste: `Ctrl + Shift + V` or Right-click

### Terminal Frozen or Stuck

**Problem:** Terminal isn't responding.

**Solutions:**
- Press `Ctrl + C` to stop current command
- If completely frozen, close terminal and open new one
- Check if a long-running process is executing

---

## Git and GitHub Problems

### "Git: command not found"

**Problem:** Git isn't installed or not in PATH.

**Solutions:**

**macOS:**
```bash
brew install git
# Or download from git-scm.com
```

**Windows:**
- Download from [git-scm.com/download/win](https://git-scm.com/download/win)
- Run installer with default options
- **Restart terminal** after installation

**Linux:**
```bash
sudo apt-get install git  # Ubuntu/Debian
sudo yum install git      # CentOS/RedHat
```

### "Permission denied" When Pushing to GitHub

**Problem:** Can't push to GitHub - permission denied.

**Solutions:**

1. **Check authentication:**
   ```bash
   git remote -v
   # Should show HTTPS or SSH URL
   ```

2. **If using HTTPS:**
   - Make sure you're using a Personal Access Token, not your password
   - Password authentication is deprecated
   - Create a token at: github.com → Settings → Developer settings → Personal access tokens

3. **If using SSH:**
   - Make sure SSH key is added to GitHub
   - Test: `ssh -T git@github.com`
   - Should see: "Hi username! You've successfully authenticated"

4. **Check repository access:**
   - Make sure you own the repository or have push access
   - Double-check the repository URL

### "Updates were rejected" Error

**Problem:** Push rejected because remote has changes you don't have locally.

**Solution:**
```bash
# Pull the latest changes first
git pull origin main

# If there are conflicts, resolve them
# Then push again
git push origin main
```

### Merge Conflicts

**Problem:** Git says you have merge conflicts.

**Solution:**

**Option 1: Ask Claude Code for help**
```
You: I have a merge conflict in [filename]. Can you help me resolve it?
```

**Option 2: Manual resolution**
```bash
# 1. Open the conflicted file
# 2. Look for conflict markers:
#    <<<<<<< HEAD
#    your changes
#    =======
#    their changes
#    >>>>>>> branch-name

# 3. Edit the file to keep what you want
# 4. Remove the conflict markers
# 5. Save the file

# 6. Mark as resolved
git add filename
git commit -m "Resolve merge conflict"
```

### Committed Sensitive Information

**Problem:** Accidentally committed passwords, API keys, or secrets.

**URGENT - Follow these steps:**

1. **Immediately rotate/regenerate the exposed secret**
   - Change passwords
   - Regenerate API keys
   - The exposed secret should be considered compromised

2. **Remove from current version:**
   ```bash
   # Remove the file
   rm sensitive-file.txt
   git add sensitive-file.txt
   git commit -m "Remove sensitive information"
   git push
   ```

3. **Remove from history (advanced):**
   ```bash
   # This rewrites history - use carefully!
   git filter-branch --force --index-filter \
     "git rm --cached --ignore-unmatch sensitive-file.txt" \
     --prune-empty --tag-name-filter cat -- --all

   # Force push (WARNING: This affects others)
   git push origin --force --all
   ```

4. **Or use BFG Repo-Cleaner (easier):**
   - Download from: [rtyley.github.io/bfg-repo-cleaner](https://rtyley.github.io/bfg-repo-cleaner/)
   - Follow instructions to remove sensitive data

**Prevention:**
- Use `.gitignore` to exclude sensitive files
- Store secrets in environment variables
- Never hardcode passwords or API keys
- Use tools like `git-secrets` to prevent commits of secrets

---

## Claude Code Runtime Issues

### Claude Code Crashes or Freezes

**Problem:** Claude Code stops responding or crashes.

**Solutions:**

1. **Try Ctrl+C to stop**
   - Press `Ctrl + C` twice

2. **Restart Claude Code**
   ```bash
   claude
   ```

3. **Check for updates**
   ```bash
   npm update -g @anthropic-ai/claude-code
   ```

4. **Clear cache (if issues persist)**
   ```bash
   # macOS/Linux
   rm -rf ~/.claude-code/cache

   # Windows
   Remove-Item -Recurse -Force $env:USERPROFILE\.claude-code\cache
   ```

### "Rate limit exceeded" Error

**Problem:** Too many requests to the API.

**Solutions:**
- Wait a few minutes before trying again
- Check your API usage at [console.anthropic.com](https://console.anthropic.com)
- Consider upgrading your plan if you need higher limits

### Claude Code Gives Unexpected Results

**Problem:** Claude isn't doing what you asked.

**Solutions:**

1. **Be more specific in your request:**
   - Bad: "Make a website"
   - Good: "Create a one-page website with a blue header, navigation menu, and contact form"

2. **Break down complex requests:**
   - Instead of asking for everything at once
   - Ask for features one at a time

3. **Provide examples:**
   - Show Claude what you want
   - Share example code or describe similar projects

4. **Ask Claude to explain:**
   ```
   You: Can you explain why you did it this way?
   You: What does this code do?
   ```

### Files Not Being Created

**Problem:** Claude says it created files but you don't see them.

**Solutions:**

1. **Check current directory:**
   ```bash
   pwd     # Show current directory
   ls      # List files
   ```

2. **Look for hidden files:**
   ```bash
   ls -la  # Show all files including hidden
   ```

3. **Ask Claude where files were created:**
   ```
   You: Where did you create those files? Can you show me the full path?
   ```

---

## Platform-Specific Issues

### macOS Issues

**"Cannot be opened because the developer cannot be verified"**
- Right-click the application
- Select "Open"
- Click "Open" in the dialog

**Homebrew installation fails**
- Make sure Xcode Command Line Tools are installed:
  ```bash
  xcode-select --install
  ```

**Permission issues with /usr/local**
```bash
sudo chown -R $(whoami) /usr/local
```

### Windows Issues

**"Execution of scripts is disabled"**
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

**PowerShell can't find installed programs**
- Close and reopen PowerShell
- Or restart your computer
- Check Environment Variables are set correctly

**Git Bash vs PowerShell confusion**
- Use PowerShell for this guide
- Git Bash uses Linux-style commands
- Commands in this guide are for PowerShell

**Windows Defender blocks installation**
- Temporarily disable real-time protection
- Add exception for npm folder
- Re-enable after installation

### Linux Issues

**Package manager issues**
```bash
# Update package list
sudo apt-get update

# Fix broken packages
sudo apt-get install -f
```

**Missing dependencies**
- Make sure build tools are installed:
  ```bash
  sudo apt-get install build-essential
  ```

**nvm recommended for Node.js**
```bash
# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# Install Node.js
nvm install --lts
nvm use --lts
```

---

## Getting Help

### Before Asking for Help

1. **Check this troubleshooting guide**
2. **Search Google** for the exact error message
3. **Check Claude Code documentation** at [docs.claude.com](https://docs.claude.com)
4. **Try the solution on Stack Overflow** (if you found one)

### How to Ask for Help Effectively

When posting questions, include:

1. **What you're trying to do**
2. **What you expected to happen**
3. **What actually happened**
4. **Full error message** (copy/paste, don't screenshot code)
5. **Your environment:**
   - Operating System (macOS, Windows, Linux)
   - Node.js version (`node --version`)
   - npm version (`npm --version`)
   - Claude Code version (`claude --version`)

**Good question template:**
```
I'm trying to [goal].

I ran this command:
[command]

I expected [expected result].

But instead I got this error:
[full error message]

Environment:
- OS: macOS 13.2
- Node: v18.12.0
- npm: 8.19.2
- Claude Code: 1.0.0
```

### Where to Get Help

1. **Ask Claude Code directly:**
   ```
   You: I'm getting this error: [error message]. How do I fix it?
   ```

2. **Claude Code GitHub Issues:**
   - Check existing issues
   - Create a new issue if needed
   - Be specific and include details

3. **Stack Overflow:**
   - Tag: `claude-code`, `anthropic`, `nodejs`
   - Search first - your question may be answered

4. **Anthropic Community:**
   - Forums and Discord (check anthropic.com)

5. **Twitter/X:**
   - @AnthropicAI
   - #ClaudeCode hashtag

### Ask Claude Code to Debug

Don't forget - Claude Code can help troubleshoot itself!

```
You: I'm getting an error when I try to [action]. Here's the error message: [error]. Can you help me debug this?

You: My [thing] isn't working. Can you check if there's an issue with [file/configuration]?

You: Can you explain why this error is happening and how to fix it?
```

---

## Quick Fixes Checklist

When something goes wrong, try these in order:

- [ ] Restart your terminal
- [ ] Check if commands are installed (`node --version`, `git --version`, `claude --version`)
- [ ] Verify API key is set (`echo $ANTHROPIC_API_KEY` or `$env:ANTHROPIC_API_KEY`)
- [ ] Update Claude Code (`npm update -g @anthropic-ai/claude-code`)
- [ ] Clear cache and restart
- [ ] Check this troubleshooting guide
- [ ] Search for error message online
- [ ] Ask Claude Code for help
- [ ] Restart your computer (seriously, it helps sometimes!)

---

## Still Stuck?

If you've tried everything and still can't resolve the issue:

1. **Document everything:**
   - What you tried
   - Error messages
   - Environment details

2. **Ask for help** (see "Where to Get Help" above)

3. **Consider a fresh start:**
   - Sometimes it's faster to reinstall
   - Follow the setup guide carefully

Remember: **Everyone encounters issues!** Don't get discouraged. Troubleshooting is a valuable skill, and you'll get better at it with practice.

---

**Found a solution not listed here?** Consider contributing it back to help others!

**Back to:** [Main README](../README.md) | [Setup Guides](setup/)
