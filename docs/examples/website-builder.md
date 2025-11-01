# Example Project: Simple Website Builder

**Difficulty:** Beginner
**Time:** 15-30 minutes
**What you'll learn:** Creating HTML/CSS files, previewing in browser, basic web development

## Project Overview

In this tutorial, you'll use Claude Code to create a simple personal website. No coding experience required - Claude Code will help you build everything step by step!

## What You'll Build

A personal website with:
- A homepage with your introduction
- An about section
- A contact form
- Nice styling and colors
- Responsive design (works on mobile and desktop)

## Prerequisites

- Claude Code installed and configured
- A text editor (VS Code recommended, but any will work)
- A web browser

## Step-by-Step Guide

### Step 1: Create Your Project

Open your terminal and create a new project directory:

**macOS/Linux:**
```bash
mkdir ~/my-website
cd ~/my-website
```

**Windows:**
```powershell
mkdir ~/my-website
cd ~/my-website
```

### Step 2: Start Claude Code

```bash
claude
```

### Step 3: Ask Claude to Build Your Website

Now comes the fun part! You can describe what you want, and Claude Code will build it for you.

**Example conversation with Claude Code:**

```
You: Hi! I want to create a simple personal website. Can you help me build:
- A homepage with my name and a brief introduction
- A section about my skills and interests
- A contact section with my email
- Make it look professional with nice colors and styling
- Make sure it works on mobile phones too

My name is [Your Name]
My profession is [Your Profession]
My interests include [Your Interests]
```

Claude Code will create the HTML and CSS files for you!

### Step 4: Preview Your Website

Once Claude creates the files, you can open them in your browser.

**macOS:**
```bash
open index.html
```

**Windows:**
```powershell
start index.html
```

**Linux:**
```bash
xdg-open index.html
```

Or simply drag the `index.html` file into your web browser.

### Step 5: Make Changes

Don't like something? Just ask Claude to change it!

**Example requests:**

```
You: Can you make the background color blue instead of gray?

You: Can you add a photo of me? Use a placeholder image for now

You: The font is too small, can you make it bigger?

You: Can you add a section for my work experience?

You: The layout looks cramped on my phone, can you fix that?
```

Claude Code will update the files based on your requests.

### Step 6: Add More Features

Want to make your website more interesting? Try asking for:

- **Image gallery:** "Add a gallery section with placeholder images"
- **Social media links:** "Add icons linking to Twitter, LinkedIn, and GitHub"
- **Dark mode:** "Add a dark mode toggle button"
- **Animation:** "Add some subtle animations when scrolling"
- **Blog section:** "Add a simple blog section with a few example posts"

### Step 7: Understand the Code

Even though Claude built it, you can learn from it! Ask Claude to explain:

```
You: Can you explain how the responsive design works?

You: What does the CSS in styles.css do?

You: How does the contact form work?
```

## Tips for Success

1. **Be specific:** The more details you provide, the better Claude can help
2. **Iterate:** Start simple, then add features one at a time
3. **Ask questions:** If you don't understand something, ask Claude to explain
4. **Experiment:** Try different colors, layouts, and features
5. **Save often:** Ask Claude to help you commit changes to git

## Next Steps

### Deploy Your Website

Want to put your website online? Ask Claude:

```
You: How can I deploy this website so others can see it? Can you help me set it up on GitHub Pages?
```

### Learn More

- Ask Claude to teach you HTML and CSS basics
- Try adding JavaScript for interactive features
- Create additional pages (blog, portfolio, etc.)

### Connect to GitHub

Follow the [GitHub Setup Guide](../github-setup.md) to save your website to GitHub and enable version control.

## Common Issues

**Website looks different in browser:**
- Make sure you saved all files
- Try refreshing the browser (Cmd+R or Ctrl+R)
- Check that the CSS file is in the same directory as index.html

**Changes not showing up:**
- Did you save the files?
- Try a hard refresh (Cmd+Shift+R or Ctrl+Shift+R)

**Want to undo changes:**
- Ask Claude: "Can you revert the last change?"
- Or use git to go back to a previous version

## Example Customizations

Here are some fun things to try:

### Add Your Real Content
```
You: Replace the placeholder text with this information:
- Name: [Your Name]
- Title: [Your Title]
- Bio: [Your Bio]
- Email: [Your Email]
```

### Change the Theme
```
You: Change the color scheme to a warm, earthy theme with browns and oranges

You: Make it look more modern and minimalist with lots of white space

You: Give it a dark theme with neon accents
```

### Add Interactive Elements
```
You: Add a button that shows more information when clicked

You: Add a form that validates the email address before submitting

You: Add smooth scrolling between sections
```

## What You've Learned

By completing this project, you've:
- ✓ Created a working website from scratch
- ✓ Learned how to communicate with Claude Code effectively
- ✓ Understood basic web development concepts
- ✓ Made iterative improvements based on feedback
- ✓ Gained confidence in using AI to build real projects

## Share Your Creation

Once you're happy with your website:
1. Take a screenshot
2. Push it to GitHub (see [GitHub Setup Guide](../github-setup.md))
3. Deploy it online with GitHub Pages
4. Share the link with friends and family!

---

**Ready for another project?** Try:
- [Task Automation Tool](task-automation.md) - Automate repetitive tasks
- [Data Organizer](data-organizer.md) - Process and organize files
