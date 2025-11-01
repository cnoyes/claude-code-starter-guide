# GitHub Setup and Workflow Guide

Learn how to save your code to GitHub and collaborate with others. This guide assumes no prior experience with Git or GitHub.

## What is GitHub?

**GitHub** is a website where you can:
- Store your code online (backup)
- Track changes over time
- Share projects with others
- Collaborate with teammates
- Showcase your work (like a portfolio)

**Git** is the tool that manages versions of your code locally on your computer.

Think of it like:
- **Git** = A powerful "Save" button with history
- **GitHub** = Google Drive, but specifically for code

## Why Use GitHub?

- **Backup:** Your code is safe even if your computer crashes
- **History:** See every change you've ever made and undo mistakes
- **Collaboration:** Work with others on the same project
- **Portfolio:** Show potential employers or clients what you've built
- **Free:** GitHub is free for personal use

## Step 1: Create a GitHub Account

1. Go to [github.com](https://github.com)
2. Click "Sign up"
3. Enter your email address
4. Create a username (choose wisely - this will be public!)
5. Create a strong password
6. Verify your email address

**Username Tips:**
- Use your real name or professional nickname
- Keep it professional (employers might see it)
- Examples: `john-smith`, `jane-developer`, `yourname-dev`

## Step 2: Configure Git on Your Computer

If you followed the setup guide, Git should already be installed. Let's configure it with your GitHub account details.

```bash
git config --global user.name "Your Name"
git config --global user.email "your-email@example.com"
```

**Important:** Use the **same email** you used for your GitHub account!

**Verify your configuration:**
```bash
git config --global user.name
git config --global user.email
```

## Step 3: Set Up GitHub Authentication

To push code to GitHub, you need to authenticate. There are two methods:

### Method 1: Personal Access Token (Recommended)

This is like a password specifically for code access.

#### Create a Token

1. Go to [github.com](https://github.com) and log in
2. Click your profile picture (top right) → **Settings**
3. Scroll down and click **Developer settings** (left sidebar)
4. Click **Personal access tokens** → **Tokens (classic)**
5. Click **Generate new token** → **Generate new token (classic)**
6. Give it a name (e.g., "My Laptop")
7. Set expiration (90 days is fine, you can regenerate it)
8. Check these permissions:
   - `repo` (all repo permissions)
   - `workflow` (if you plan to use GitHub Actions)
9. Click **Generate token**
10. **IMPORTANT:** Copy the token immediately! You won't see it again!

#### Save Your Token

**macOS/Linux:**
```bash
# Store the token in Git credential helper
git config --global credential.helper osxkeychain  # macOS
git config --global credential.helper store        # Linux
```

**Windows:**
```powershell
git config --global credential.helper wincred
```

The first time you push code, Git will ask for your username and password. Use:
- **Username:** Your GitHub username
- **Password:** Your personal access token (NOT your GitHub password!)

### Method 2: SSH Keys (Advanced)

SSH is more secure but slightly more complex to set up. If you're comfortable, follow [GitHub's SSH guide](https://docs.github.com/en/authentication/connecting-to-github-with-ssh).

## Step 4: Create Your First Repository on GitHub

A **repository** (or "repo") is a project folder that Git tracks.

### Create a New Repository

1. Go to [github.com](https://github.com)
2. Click the **+** icon (top right) → **New repository**
3. Fill in the details:
   - **Repository name:** `my-first-project` (use lowercase and hyphens)
   - **Description:** "My first project using Claude Code" (optional)
   - **Public or Private:** Choose based on your preference
     - **Public:** Anyone can see it (good for portfolio)
     - **Private:** Only you can see it
   - **DON'T** check "Initialize with README" (we'll do this locally)
4. Click **Create repository**

You'll see a page with instructions - we'll use them in the next step!

## Step 5: Connect Your Local Project to GitHub

Now let's take a project you've built and push it to GitHub.

### If You're Starting a New Project

```bash
# Create a new project directory
mkdir my-first-project
cd my-first-project

# Initialize Git
git init

# Create a README file
echo "# My First Project" > README.md

# Add files to Git
git add README.md

# Create your first commit
git commit -m "Initial commit"

# Connect to GitHub (replace YOUR-USERNAME with your actual username!)
git remote add origin https://github.com/YOUR-USERNAME/my-first-project.git

# Push to GitHub
git branch -M main
git push -u origin main
```

### If You Have an Existing Project

```bash
# Navigate to your project
cd ~/my-website  # or wherever your project is

# Initialize Git (if not already done)
git init

# Add all files
git add .

# Create your first commit
git commit -m "Initial commit"

# Connect to GitHub
git remote add origin https://github.com/YOUR-USERNAME/your-repo-name.git

# Push to GitHub
git branch -M main
git push -u origin main
```

**Troubleshooting:**
- If it asks for username/password, use your GitHub username and personal access token
- If you see an error about remote already exists: `git remote remove origin` then try again

## Step 6: Basic Git Workflow

This is the cycle you'll use every time you make changes:

```bash
# 1. Make changes to your files (edit, add, delete)
#    (edit your files using Claude Code or any editor)

# 2. Check what changed
git status

# 3. Add files you want to save
git add .              # Add all files
git add filename.js    # Add specific file

# 4. Commit with a descriptive message
git commit -m "Add login feature"

# 5. Push to GitHub
git push
```

### Commit Message Tips

Good commit messages:
- ✅ "Add user authentication"
- ✅ "Fix bug in checkout process"
- ✅ "Update homepage design"
- ✅ "Remove deprecated code"

Bad commit messages:
- ❌ "stuff"
- ❌ "changes"
- ❌ "asdf"
- ❌ "Fixed it"

## Step 7: Using Git with Claude Code

Claude Code can help you with Git operations! Just ask:

```
You: Can you help me commit these changes to git with an appropriate message?

You: I want to push this to GitHub. What commands do I need?

You: Can you help me create a .gitignore file for this project?

You: Show me the history of changes to this file

You: I made a mistake in the last commit. How do I undo it?
```

### Let Claude Handle Git

```
You: I've made several changes. Can you:
1. Check what files changed
2. Add all the relevant files to git
3. Create an appropriate commit message
4. Push to GitHub
```

Claude will do all the Git commands for you!

## Step 8: Useful Git Commands

### See What Changed
```bash
git status           # Show changed files
git diff             # Show exact changes
git log              # Show commit history
git log --oneline    # Compact history
```

### Undo Changes
```bash
git checkout filename.js    # Discard changes to a file
git reset HEAD~1            # Undo last commit (keeps changes)
git revert HEAD             # Create new commit that undoes last commit
```

### Branches (Advanced)
```bash
git branch feature-name     # Create a new branch
git checkout feature-name   # Switch to that branch
git checkout -b feature     # Create and switch in one command
git merge feature-name      # Merge branch into current branch
```

## Step 9: Viewing Your Project on GitHub

After pushing, you can see your code online:

1. Go to `https://github.com/YOUR-USERNAME/your-repo-name`
2. You'll see:
   - All your files and folders
   - Your commit history
   - README (if you have one)
   - And more!

### Make Your Repository Look Professional

**Create a good README:**
```markdown
# Project Name

Brief description of what this project does.

## Features
- Feature 1
- Feature 2
- Feature 3

## How to Use
Step-by-step instructions...

## Technologies Used
- Claude Code
- HTML/CSS
- JavaScript

## Author
Your Name - [GitHub Profile](https://github.com/yourusername)
```

Ask Claude to help:
```
You: Can you create a professional README.md file for this project?
```

## Step 10: Advanced GitHub Features

### GitHub Pages (Free Website Hosting)

Host your website for free on GitHub!

```
You: Can you help me set up GitHub Pages to host my website?
```

1. Go to your repository on GitHub
2. Click **Settings**
3. Scroll to **Pages** section
4. Under **Source**, select `main` branch
5. Click **Save**
6. Your site will be live at: `https://yourusername.github.io/repo-name`

### Issues and Project Management

- Create **Issues** to track bugs and features
- Use **Projects** to organize tasks
- Add **Labels** to categorize issues

### Collaboration

**Invite collaborators:**
1. Go to your repo → **Settings** → **Collaborators**
2. Add people by username or email

**Accept contributions:**
- Others can **fork** your repo (make their own copy)
- They can submit **pull requests** (proposed changes)
- You can review and merge their changes

## Common Workflows

### Daily Work Routine

```bash
# Start of day - get latest changes
git pull

# Work on your code
# ...make changes...

# End of day - save your work
git add .
git commit -m "Describe what you did today"
git push
```

### Working on a Feature

```bash
# Create a feature branch
git checkout -b new-feature

# Make your changes
# ...code...

# Commit changes
git add .
git commit -m "Add new feature"

# Push feature branch
git push -u origin new-feature

# When ready, merge to main
git checkout main
git merge new-feature
git push
```

### Reviewing History

```bash
# See recent commits
git log --oneline -10

# See what changed in a commit
git show commit-hash

# See who changed what
git blame filename.js
```

## Troubleshooting

### "Permission denied"
- Check your authentication (token or SSH key)
- Make sure you have access to the repository

### "Updates were rejected"
- Someone else pushed changes first
- Run `git pull` first, then push again

### "Merge conflict"
```
You: I have a merge conflict. Can you help me resolve it?
```
Claude can guide you through resolving conflicts!

### Committed Sensitive Information
**DON'T** commit passwords, API keys, or secrets!

If you did:
```
You: I accidentally committed my API key. How do I remove it from git history?
```

**Prevention:** Use a `.gitignore` file:
```
You: Can you create a .gitignore file for this project that excludes common sensitive files?
```

## Best Practices

### Commit Often
- Small, frequent commits are better than large ones
- Each commit should represent one logical change

### Write Clear Messages
- Use present tense: "Add feature" not "Added feature"
- Be descriptive but concise
- Explain WHY if the change isn't obvious

### Use .gitignore
- Don't commit generated files, logs, or dependencies
- Don't commit sensitive information
- Ask Claude: "What should I add to .gitignore for this project?"

### Pull Before Push
- Always `git pull` before starting work
- Prevents conflicts and ensures you have latest code

### Test Before Committing
- Make sure your code works before committing
- Run tests if you have them

## Learning Resources

### GitHub Learning Lab
- Free interactive tutorials
- [lab.github.com](https://lab.github.com)

### Ask Claude Code
```
You: Can you teach me about Git branches?

You: What's the difference between git fetch and git pull?

You: How do I undo a commit that I already pushed?
```

### GitHub Docs
- Comprehensive documentation
- [docs.github.com](https://docs.github.com)

## Next Steps

### Build Your Portfolio
- Make your best projects public
- Write good README files
- Include screenshots and demos
- Pin your best repos to your profile

### Contribute to Open Source
- Find beginner-friendly projects
- Look for "good first issue" labels
- Learn from others' code

### Explore GitHub Actions
```
You: Can you help me set up GitHub Actions to automatically test my code?
```

### Set Up Continuous Deployment
```
You: How can I automatically deploy my website when I push to GitHub?
```

---

**Congratulations!** You now know how to use Git and GitHub to manage your code professionally.

**Need help?** Ask Claude Code, or check the [Troubleshooting Guide](troubleshooting.md).

---

**Ready to build something?** Go back to:
- [Example Projects](examples/)
- [Main README](../README.md)
