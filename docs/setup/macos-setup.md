# macOS Setup Guide

This guide will walk you through setting up Claude Code on your Mac, step by step.

## Prerequisites

- A Mac running macOS (any recent version)
- An internet connection
- An Anthropic API key (we'll help you get one)

## Step 1: Open the Terminal

The Terminal is a text-based way to interact with your computer. Don't worry - we'll guide you through everything!

1. Press `Cmd + Space` to open Spotlight Search
2. Type "Terminal" and press Enter
3. A window with white or black background will open - this is your Terminal!

**Tip:** Keep this guide open while you work in Terminal so you can copy and paste commands.

## Step 2: Install Homebrew (Package Manager)

Homebrew makes it easy to install software on macOS. Let's check if you already have it.

**Check if Homebrew is installed:**
```bash
brew --version
```

If you see a version number, **skip to Step 3**. If you see an error, continue below.

**Install Homebrew:**
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

- Press Enter when prompted
- Enter your Mac password when asked (you won't see it as you type - this is normal!)
- Wait for the installation to complete (it may take a few minutes)

**Important:** After installation, Homebrew may show you some commands to run. Copy and paste them into Terminal to finish setup.

## Step 3: Install Node.js

Claude Code requires Node.js to run.

**Install Node.js:**
```bash
brew install node
```

**Verify installation:**
```bash
node --version
npm --version
```

You should see version numbers for both commands.

## Step 4: Install Claude Code

Now we'll install Claude Code itself!

```bash
npm install -g @anthropic-ai/claude-code
```

This command installs Claude Code globally (`-g`) so you can use it from anywhere.

**Verify installation:**
```bash
claude --version
```

You should see the Claude Code version number.

## Step 5: Get Your Anthropic API Key

To use Claude Code, you need an API key from Anthropic.

1. Go to [console.anthropic.com](https://console.anthropic.com)
2. Sign up or log in to your account
3. Navigate to "API Keys" in the menu
4. Click "Create Key"
5. Give it a name (e.g., "Claude Code")
6. Copy the key - you'll only see it once!

**Set up your API key:**
```bash
export ANTHROPIC_API_KEY="your-api-key-here"
```

Replace `your-api-key-here` with your actual API key.

**Make it permanent (so you don't have to do this every time):**

If you use the default Terminal (bash):
```bash
echo 'export ANTHROPIC_API_KEY="your-api-key-here"' >> ~/.bash_profile
source ~/.bash_profile
```

If you use zsh (newer Macs):
```bash
echo 'export ANTHROPIC_API_KEY="your-api-key-here"' >> ~/.zshrc
source ~/.zshrc
```

**Not sure which shell you're using?** Run:
```bash
echo $SHELL
```
- If it says `/bin/zsh`, use the zsh commands
- If it says `/bin/bash`, use the bash commands

## Step 6: Test Claude Code

Let's make sure everything works!

**Create a test directory:**
```bash
mkdir ~/claude-test
cd ~/claude-test
```

**Start Claude Code:**
```bash
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

**Check if Git is installed:**
```bash
git --version
```

If you see a version number, you're good! If not:

```bash
brew install git
```

**Configure Git:**
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

Replace with your actual name and email.

## Next Steps

Now that you're set up, you can:

1. **[Set up GitHub](../github-setup.md)** - Create an account and learn to push code
2. **[Try Example Projects](../examples/)** - Build something real
3. **Start your own project** - Use Claude Code to solve a problem

## Quick Reference

### Opening Terminal
- Press `Cmd + Space`, type "Terminal", press Enter

### Starting Claude Code
```bash
claude
```

### Navigating Directories
```bash
pwd              # Show current directory
ls               # List files in current directory
cd foldername    # Move into a folder
cd ..            # Move up one folder
cd ~             # Go to your home directory
```

### Creating Directories
```bash
mkdir my-project  # Create a new folder
cd my-project     # Move into it
```

## Troubleshooting

**"command not found" errors:**
- Make sure you completed all installation steps
- Try closing and reopening Terminal
- Check that the API key is set: `echo $ANTHROPIC_API_KEY`

**Permission errors:**
- You may need to use `sudo` before a command (it will ask for your password)
- Be careful with `sudo` - only use it when instructed

**Need more help?**
- Check the [main Troubleshooting Guide](../troubleshooting.md)
- Visit [docs.claude.com](https://docs.claude.com)

---

**Ready to move forward?** Continue to the [GitHub Setup Guide](../github-setup.md)!
