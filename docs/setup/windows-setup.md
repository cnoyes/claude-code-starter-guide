# Windows Setup Guide

This guide will walk you through setting up Claude Code on Windows, step by step.

## Prerequisites

- Windows 10 or Windows 11
- An internet connection
- Administrator access to your computer
- An Anthropic API key (we'll help you get one)

## Step 1: Open PowerShell

PowerShell is a modern command-line tool for Windows. We'll use it to set up Claude Code.

1. Press `Windows Key + X`
2. Select "Windows PowerShell" or "Terminal" from the menu
   - **Important:** If you see "PowerShell (Admin)" or "Terminal (Admin)", choose that option
3. A blue window will open - this is PowerShell!

**Alternative method:**
- Press `Windows Key`, type "PowerShell", right-click it, and select "Run as Administrator"

**Tip:** Keep this guide open while you work in PowerShell so you can copy and paste commands.

## Step 2: Install Node.js

Claude Code requires Node.js to run.

### Download and Install Node.js

1. Go to [nodejs.org](https://nodejs.org)
2. Download the **LTS** (Long Term Support) version
3. Run the installer
   - Click "Next" through the installation wizard
   - **Important:** Make sure "Add to PATH" is checked (it usually is by default)
4. Click "Install" and wait for it to complete
5. Restart PowerShell (close and reopen it)

### Verify Installation

In PowerShell, run:
```powershell
node --version
npm --version
```

You should see version numbers for both commands. If you see an error, you may need to restart your computer.

## Step 3: Install Claude Code

Now we'll install Claude Code!

```powershell
npm install -g @anthropic-ai/claude-code
```

This command installs Claude Code globally (`-g`) so you can use it from anywhere.

**Verify installation:**
```powershell
claude --version
```

You should see the Claude Code version number.

**Troubleshooting:** If you get a permissions error, make sure you're running PowerShell as Administrator (see Step 1).

## Step 4: Get Your Anthropic API Key

To use Claude Code, you need an API key from Anthropic.

1. Go to [console.anthropic.com](https://console.anthropic.com)
2. Sign up or log in to your account
3. Navigate to "API Keys" in the menu
4. Click "Create Key"
5. Give it a name (e.g., "Claude Code")
6. Copy the key - you'll only see it once!

## Step 5: Set Up Your API Key

We need to tell Windows about your API key so Claude Code can use it.

### Set Environment Variable (Permanent)

**Method 1: Using PowerShell (Recommended)**

Run this command in PowerShell (as Administrator):
```powershell
[System.Environment]::SetEnvironmentVariable('ANTHROPIC_API_KEY', 'your-api-key-here', 'User')
```

Replace `your-api-key-here` with your actual API key.

**Method 2: Using Windows Settings (GUI)**

1. Press `Windows Key` and type "environment variables"
2. Click "Edit the system environment variables"
3. Click "Environment Variables..." button
4. Under "User variables", click "New..."
5. Variable name: `ANTHROPIC_API_KEY`
6. Variable value: your API key
7. Click "OK" on all windows

**After setting the variable:**
- **Close and reopen PowerShell** for the change to take effect

**Verify it worked:**
```powershell
$env:ANTHROPIC_API_KEY
```

You should see your API key printed out.

## Step 6: Test Claude Code

Let's make sure everything works!

**Create a test directory:**
```powershell
mkdir ~/claude-test
cd ~/claude-test
```

**Start Claude Code:**
```powershell
claude
```

You should see Claude Code start up! Try asking it something simple like:
```
Create a simple hello.txt file that says "Hello from Claude Code!"
```

If Claude creates the file, congratulations - you're all set up!

**Exit Claude Code:**
Type `exit` or press `Ctrl + C` twice.

## Step 7: Install Git (for GitHub)

Git is how we'll save and share code.

### Download and Install Git

1. Go to [git-scm.com/download/win](https://git-scm.com/download/win)
2. Download the installer
3. Run the installer
   - Use all default options (just keep clicking "Next")
   - **Important:** Make sure "Git from the command line and also from 3rd-party software" is selected
4. Click "Install" and wait for it to complete
5. Restart PowerShell (close and reopen it)

### Verify Installation

```powershell
git --version
```

You should see a version number.

### Configure Git

```powershell
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

Replace with your actual name and email (use the same email you'll use for GitHub).

## Step 8: (Optional) Install Windows Terminal

Windows Terminal is a modern, powerful terminal app that makes working with PowerShell much nicer.

1. Open the Microsoft Store
2. Search for "Windows Terminal"
3. Click "Install"
4. Once installed, you can use Windows Terminal instead of PowerShell

**Why use Windows Terminal?**
- Tabs support (multiple terminals in one window)
- Better copy/paste
- Customizable appearance
- Supports PowerShell, Command Prompt, and more

## Next Steps

Now that you're set up, you can:

1. **[Set up GitHub](../github-setup.md)** - Create an account and learn to push code
2. **[Try Example Projects](../examples/)** - Build something real
3. **Start your own project** - Use Claude Code to solve a problem

## Quick Reference

### Opening PowerShell
- Press `Windows Key + X`, select "PowerShell" or "Terminal"
- Or press `Windows Key`, type "PowerShell", press Enter

### Starting Claude Code
```powershell
claude
```

### Navigating Directories
```powershell
pwd              # Show current directory (or just type cd with no arguments)
ls               # List files in current directory
cd foldername    # Move into a folder
cd ..            # Move up one folder
cd ~             # Go to your home directory
```

### Creating Directories
```powershell
mkdir my-project  # Create a new folder
cd my-project     # Move into it
```

### PowerShell vs Command Prompt
- Use **PowerShell** (blue window) - it's more modern and powerful
- Avoid Command Prompt (black window with "cmd" in the title)

## Troubleshooting

**"command not found" or "not recognized" errors:**
- Make sure you completed all installation steps
- Try closing and reopening PowerShell
- If you just installed something, you may need to restart your computer
- Check that the API key is set: `$env:ANTHROPIC_API_KEY`

**Permission errors:**
- Make sure you're running PowerShell as Administrator
- Right-click PowerShell and select "Run as Administrator"

**Execution policy errors:**
If you see an error about execution policies, run:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

**PATH issues:**
If commands aren't found after installation:
1. Press `Windows Key` and type "environment variables"
2. Check that these are in your PATH:
   - `C:\Program Files\nodejs\`
   - `C:\Program Files\Git\cmd\`
3. Restart PowerShell or your computer

**Need more help?**
- Check the [main Troubleshooting Guide](../troubleshooting.md)
- Visit [docs.claude.com](https://docs.claude.com)

---

**Ready to move forward?** Continue to the [GitHub Setup Guide](../github-setup.md)!
