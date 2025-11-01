# Example Project: Data Organizer

**Difficulty:** Beginner to Intermediate
**Time:** 20-45 minutes
**What you'll learn:** Data processing, CSV handling, text manipulation, data analysis

## Project Overview

Learn how to use Claude Code to work with data - whether it's spreadsheets, text files, or other formats. This tutorial shows you how to clean, organize, analyze, and transform data without complex software.

## What You'll Build

Tools to help you:
- Clean up messy data
- Combine multiple spreadsheets
- Extract specific information from large files
- Convert between different formats (CSV, JSON, Excel)
- Generate summaries and insights
- Remove duplicates and fix formatting

## Prerequisites

- Claude Code installed and configured
- Some data to work with (we can create sample data if needed)
- Understanding of what problem you want to solve

## Common Data Problems This Solves

**For Small Business:**
- Merge customer lists from different sources
- Clean up contact information
- Analyze sales trends
- Process inventory data
- Track expenses and generate summaries

**For Professionals:**
- Combine reports from multiple departments
- Clean up exported data from various systems
- Extract specific records matching criteria
- Convert data formats for different tools
- Generate pivot tables and summaries

**For Researchers/Students:**
- Clean survey responses
- Combine data from multiple studies
- Calculate statistics and summaries
- Remove duplicates and inconsistencies
- Format data for analysis tools

## Step-by-Step Guide

### Step 1: Create Your Project

```bash
mkdir ~/data-organizer
cd ~/data-organizer
```

### Step 2: Start Claude Code

```bash
claude
```

### Step 3: Describe Your Data Problem

Be specific about what your data looks like and what you need to do with it.

**Template:**
```
You: I have data that looks like this:
[Paste a sample or describe the format]

I need to:
1. [First task]
2. [Second task]
3. [Third task]

The output should be: [describe desired result]
```

## Example 1: Combining Multiple Spreadsheets

**Your request to Claude:**

```
You: I have 12 CSV files (one for each month) with sales data. They all have the same columns:

Date,Customer,Product,Quantity,Price

I need to:
1. Combine all 12 files into one master file
2. Sort by date
3. Add a column for total (Quantity * Price)
4. Add a column for month name
5. Remove any duplicate entries
6. Save as a new CSV file called "sales-2024-combined.csv"

Can you create a script to do this?
```

**What Claude will create:**
- A script that reads all CSV files
- Combines them intelligently
- Adds calculated columns
- Handles errors gracefully
- Produces a clean output file

**How to use it:**
```bash
# Claude will show you how to run it
python combine_sales.py
```

## Example 2: Data Cleaning Tool

**Your request to Claude:**

```
You: I exported customer data from my CRM and it's messy. The CSV has these issues:
- Phone numbers in different formats (123-456-7890, (123) 456-7890, 1234567890)
- Email addresses with extra spaces
- Names in ALL CAPS
- Some duplicate entries
- Empty rows

Can you create a script that:
1. Standardizes phone numbers to format: (123) 456-7890
2. Trims spaces from email addresses
3. Converts names to proper case (First Last)
4. Removes duplicates based on email address
5. Removes empty rows
6. Saves the cleaned data to a new file

Input file: messy_customers.csv
Output file: cleaned_customers.csv
```

**What you'll get:**
- Comprehensive data cleaning
- Before/after comparison
- Summary of changes made
- Safe processing (keeps original file)

## Example 3: Data Extraction and Filtering

**Your request to Claude:**

```
You: I have a large CSV file with 10,000 customer orders. I need to extract specific information:

1. Filter for orders from Q4 2024 (Oct-Dec)
2. Only include orders over $100
3. Group by product category
4. Calculate total sales per category
5. Find top 10 customers by total spending
6. Create a summary report in both CSV and readable text format

Can you help me build this?
```

**What Claude will build:**
- Data filtering logic
- Aggregation and grouping
- Sorting and ranking
- Multiple output formats
- Summary statistics

## Example 4: Format Converter

**Your request to Claude:**

```
You: I need to convert data between different formats.

Can you create a tool that can:
1. Convert CSV to JSON
2. Convert JSON to CSV
3. Convert Excel (.xlsx) to CSV
4. Convert CSV to formatted HTML table

I should be able to specify:
- Input file
- Output file
- Desired format

Example: python convert.py input.csv output.json --format json
```

**What you'll get:**
- Multi-format converter
- Command-line interface
- Error handling
- Preview of output

## Example 5: Data Analysis Dashboard

**Your request to Claude:**

```
You: I have monthly sales data in a CSV file. Can you create a tool that:

1. Reads the CSV file
2. Calculates these metrics:
   - Total revenue
   - Average order value
   - Number of orders
   - Revenue by product category
   - Top 5 selling products
   - Month-over-month growth rate
3. Generates a simple HTML dashboard with:
   - Summary cards for key metrics
   - Tables showing breakdowns
   - Basic charts if possible
4. Updates automatically when I run it with new data

The CSV has: Date, Product, Category, Quantity, Price
```

**What Claude will create:**
- Data analysis engine
- Metrics calculations
- Visualization dashboard
- Reusable template

## Tips for Data Organization Projects

### Provide Sample Data

Make it easy for Claude to understand:
```
You: Here's what my data looks like:

Name,Email,Phone
JOHN DOE,john@email.com  ,123-456-7890
Jane Smith, jane@email.com,(555) 123 4567
...

Can you create a cleaning script for this format?
```

### Be Specific About Edge Cases

```
You: Some phone numbers might be missing. If a phone number is empty, just leave it empty rather than adding a placeholder.
```

### Ask for Verification Steps

```
You: After processing, can the script show me:
- How many rows were processed
- How many duplicates were found
- Any errors that occurred
```

### Request Before/After Comparison

```
You: Can you show me a sample of the data before and after processing so I can verify it's correct?
```

### Make It Reusable

```
You: I'll need to run this every month. Can you make it easy to update the input/output filenames?
```

## Real-World Use Cases

### Customer Data Management

**Merge Multiple Sources:**
```
You: I have customer lists from our website (CSV), our email provider (Excel), and our sales system (JSON). Can you create a script that:
1. Reads all three formats
2. Merges them based on email address
3. Keeps the most recent information when there are conflicts
4. Removes duplicates
5. Outputs a master customer list
```

### Sales Reporting

**Generate Weekly Reports:**
```
You: Every Monday I need to create a sales report from last week's data. Can you build a script that:
1. Takes the date range (last Monday to Sunday)
2. Calculates total sales, number of orders, average order value
3. Shows top 10 products
4. Compares to previous week
5. Generates a formatted report I can email to my team
```

### Expense Tracking

**Organize Receipts and Expenses:**
```
You: I download transaction data from my bank as CSV. Can you create a tool that:
1. Categorizes expenses based on description
2. Calculates total per category
3. Flags unusually high expenses
4. Generates a monthly summary
5. Exports to a format I can use in Excel
```

### Inventory Management

**Stock Level Analysis:**
```
You: I have inventory data that's updated daily. Can you build a script that:
1. Identifies products below reorder point
2. Calculates days of supply remaining
3. Suggests reorder quantities
4. Generates a purchase order list
5. Sends an alert if critical items are low
```

## Advanced Techniques

### Scheduled Processing

```
You: Can you show me how to set this up to run automatically every night at midnight?
```

### Email Integration

```
You: After processing the data, can the script email me the summary report?
```

### Error Handling

```
You: What happens if the input file is missing or has unexpected columns? Can you add error handling for that?
```

### Data Validation

```
You: Before processing, can the script validate that:
- All required columns are present
- Dates are in the correct format
- No critical fields are empty
```

## Working with Large Files

### Processing Big Data

```
You: My CSV file has 100,000 rows. Will this script handle that? If not, can you optimize it?
```

### Batch Processing

```
You: I have 50 files to process. Can you modify the script to process all files in a folder automatically?
```

### Progress Indicators

```
You: For large files, can you show a progress bar so I know it's working?
```

## Data Quality Checks

### Before Processing

Ask Claude to add validation:
```
You: Before starting, can the script check:
- File exists and is readable
- Has the expected columns
- Has at least one data row
- Dates are in valid format
```

### After Processing

Get verification:
```
You: After processing, show me:
- Number of records processed successfully
- Number of records skipped (with reasons)
- Any data quality issues found
- Summary statistics
```

## Troubleshooting

**Data not loading correctly:**
```
You: The CSV isn't loading correctly. The file uses semicolons (;) instead of commas. Can you update the script?
```

**Unexpected results:**
```
You: The totals don't look right. Can you add debug output showing the calculation for a few sample rows?
```

**Performance issues:**
```
You: The script is very slow with large files. Can you optimize it?
```

## What You've Learned

By completing this project, you've:
- ✓ Cleaned and organized real data
- ✓ Combined multiple data sources
- ✓ Performed data analysis
- ✓ Created reusable data tools
- ✓ Saved hours of manual work

## Time & Money Saved

Consider the impact:
- **Manual data cleaning:** 2 hours per week
- **Automated:** 2 minutes per week
- **Time saved:** ~100 hours per year
- **Value:** If your time is worth $50/hour, that's $5,000/year!

## Next Steps

### Build a Data Processing Pipeline

```
You: Can you help me create a workflow where:
1. Data arrives via email attachment
2. Gets automatically saved to a folder
3. Cleaned and processed
4. Results uploaded to cloud storage
5. Summary emailed to my team
```

### Create a Data Dashboard

```
You: Instead of reports, can we create an interactive web dashboard that updates automatically?
```

### Share Your Tools

- Document your data tools
- Push to GitHub (see [GitHub Setup Guide](../github-setup.md))
- Share with colleagues
- Build a library of reusable scripts

## Additional Resources

### Learn SQL

```
You: This data would work better in a database. Can you teach me basic SQL and help me set up a simple database?
```

### Explore Data Visualization

```
You: Can you show me how to create charts and graphs from this data using Python or JavaScript?
```

### Set Up Automated Workflows

```
You: How can I set up these scripts to run automatically when new data arrives?
```

---

**Ready for another project?** Try:
- [Simple Website Builder](website-builder.md) - Create a personal website
- [Task Automation Tool](task-automation.md) - Automate repetitive tasks

---

**Questions?** Check the [Troubleshooting Guide](../troubleshooting.md) or ask Claude Code for help!
