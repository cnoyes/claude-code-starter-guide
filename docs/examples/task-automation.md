# Example Project: Task Automation Tool

**Difficulty:** Beginner
**Time:** 20-40 minutes
**What you'll learn:** Scripting, automation, file operations, saving time

## Project Overview

Learn how to use Claude Code to automate repetitive tasks that you do at work or in your personal life. This tutorial will help you build practical automation scripts without needing to learn programming first.

## What You'll Build

We'll create automation scripts for common tasks like:
- Organizing files into folders
- Renaming multiple files at once
- Generating reports from data
- Sending automated emails
- Processing spreadsheets

Pick one that matches your needs, or do them all!

## Prerequisites

- Claude Code installed and configured
- Some files to work with (or we'll create sample data)
- Basic understanding of your file system

## Automation Ideas by Profession

**For Office Workers:**
- Automatically organize downloads by file type
- Generate weekly reports from CSV data
- Batch rename files with proper naming conventions
- Convert multiple documents to PDF

**For Small Business Owners:**
- Generate invoices from a template
- Process customer data from spreadsheets
- Create marketing email templates
- Organize receipts and financial documents

**For Content Creators:**
- Resize images in bulk
- Organize media files by date
- Generate video thumbnail images
- Create content calendars

**For Students:**
- Organize research papers and notes
- Generate study guides from text files
- Create citation lists
- Merge multiple documents

## Step-by-Step Guide

### Step 1: Create Your Project

```bash
mkdir ~/automation-project
cd ~/automation-project
```

### Step 2: Start Claude Code

```bash
claude
```

### Step 3: Describe Your Task

The key to good automation is being specific about what you want. Here's a template:

```
You: I want to automate [task description].

Here's what I need:
1. [Step 1 of the process]
2. [Step 2 of the process]
3. [Step 3 of the process]

The input will be: [describe your input]
The output should be: [describe desired output]

Can you help me create a script for this?
```

## Example 1: File Organizer

**Your request to Claude:**

```
You: I want to organize my messy Downloads folder. Can you create a script that:
1. Looks at all files in a folder
2. Creates subfolders for different file types (Documents, Images, Videos, Spreadsheets, Archives)
3. Moves each file to the appropriate folder
4. Prints a summary of what was organized

I want to be able to run this script on any folder by providing the folder path.
```

**What Claude will do:**
- Create a Python or Node.js script
- Add error handling
- Include helpful output messages
- Make it easy to use

**How to use it:**
```bash
# Claude will tell you how to run it, something like:
python organize_files.py /path/to/folder
```

### Testing Safely

Before running on real files, test with sample data:

```
You: Can you create a test folder with some sample files so I can test this safely?
```

Claude will create test files for you!

## Example 2: Batch File Renamer

**Your request to Claude:**

```
You: I have 50 photos named IMG_0001.jpg, IMG_0002.jpg, etc.
I want to rename them to "Vacation-Mexico-001.jpg", "Vacation-Mexico-002.jpg", etc.

Can you create a script that:
1. Takes a folder path as input
2. Takes a new prefix as input (like "Vacation-Mexico")
3. Renames all files in that folder with the new prefix
4. Keeps the numbers in sequence
5. Keeps the original file extension
6. Shows me a preview before making changes
```

**What you'll get:**
- A safe script that previews changes
- Easy-to-use command-line interface
- Protection against accidents

## Example 3: Report Generator

**Your request to Claude:**

```
You: I have a CSV file with sales data that looks like this:

Date,Product,Quantity,Price
2024-01-15,Widget A,5,29.99
2024-01-16,Widget B,3,49.99
...

Can you create a script that:
1. Reads the CSV file
2. Calculates total sales per product
3. Calculates total revenue
4. Finds the best-selling product
5. Creates a nice HTML report with charts
6. Saves the report with today's date in the filename
```

**What Claude will build:**
- A data processing script
- HTML report with formatting
- Charts and visualizations (if requested)
- Automatic date stamping

## Example 4: Email Template Generator

**Your request to Claude:**

```
You: I send similar emails to clients every week but need to customize each one.

Can you create a tool that:
1. Takes a CSV with client names and project details
2. Uses an email template
3. Generates personalized emails for each client
4. Saves each email as a separate text file
5. Includes merge fields for: {ClientName}, {ProjectName}, {DueDate}

Here's my email template:
"Dear {ClientName},
Hope you're doing well! Just checking in on the {ProjectName} project...
"
```

**What you'll get:**
- Template processing tool
- Batch email generation
- Professional formatting
- Easy to modify

## Tips for Creating Automations

### Be Specific About Requirements

Good:
```
"Create a script that renames all .txt files in a folder to include today's date at the beginning, like '2024-01-15-filename.txt'"
```

Too vague:
```
"Make a file renaming script"
```

### Test with Sample Data First

Always ask Claude:
```
You: Can you create some test data so I can try this safely?
```

### Ask for Safety Features

```
You: Before making any changes, can the script show me a preview and ask for confirmation?
```

### Request Documentation

```
You: Can you add comments explaining how this works? I want to learn from it.
```

### Make It Reusable

```
You: Can you make this script configurable so I can easily change the settings without editing the code?
```

## Advanced Ideas

Once you're comfortable, try these:

### Schedule Automation
```
You: How can I set this up to run automatically every day at 9am?
```

### Chain Multiple Tasks
```
You: Can you create a script that:
1. Downloads files from an email
2. Processes them
3. Generates a report
4. Sends the report via email
```

### Add a User Interface
```
You: Instead of command-line, can you create a simple web interface for this?
```

## Real-World Use Cases

### For Business
**Invoice Generator:**
```
You: Create a script that generates invoices from a template, using data from a spreadsheet, and saves them as PDFs with sequential invoice numbers.
```

**Client Report Automation:**
```
You: Build a tool that takes project tracking data and generates weekly client status reports in professional format.
```

### For Personal Use
**Photo Organizer:**
```
You: Create a script that organizes photos by year and month based on their creation date, like 2024/01/, 2024/02/, etc.
```

**Backup Script:**
```
You: Make a script that copies important files from my Documents folder to a backup drive and keeps a log of what was backed up.
```

## Troubleshooting

**Script doesn't run:**
```
You: I got this error: [paste error]. How do I fix it?
```

**Need to modify behavior:**
```
You: The script works but I want to also [new requirement]. Can you update it?
```

**Want to understand the code:**
```
You: Can you explain how this part works? [paste code section]
```

## What You've Learned

By completing this project, you've:
- ✓ Automated a real-world task
- ✓ Saved time on repetitive work
- ✓ Learned to communicate automation requirements
- ✓ Created reusable tools
- ✓ Understood the power of scripting

## Next Steps

### Save Your Automations
```
You: Can you help me set up a git repository for all my automation scripts?
```

### Share with Others
- Push to GitHub (see [GitHub Setup Guide](../github-setup.md))
- Add a README explaining what each script does
- Share with colleagues who might benefit

### Build More Tools
- Combine multiple automations
- Create a personal automation library
- Explore more complex workflows

## Time Saved Calculator

Think about how much time you'll save:
- Task takes: **5 minutes** manually
- Frequency: **3 times per week**
- Automation runs in: **10 seconds**

**Time saved per year:** ~13 hours!

And that's just one task. Imagine automating 5-10 repetitive tasks!

---

**Ready for another project?** Try:
- [Simple Website Builder](website-builder.md) - Create a personal website
- [Data Organizer](data-organizer.md) - Process and organize files
