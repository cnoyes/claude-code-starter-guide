# Territory & Account Planning Tool

**Difficulty:** Intermediate
**Time:** 45-90 minutes
**Industry:** B2B Sales, Regional Sales Management
**What you'll learn:** Territory optimization, account prioritization, strategic planning, data visualization

## Project Overview

Build a comprehensive territory planning and account management system that helps you maximize coverage, prioritize high-value opportunities, and systematically grow your region. Essential for any sales manager covering a large geographic area.

## Business Impact

**For a Regional Sales Manager:**
- 🗺️ **Visualize your territory** - See account distribution and coverage gaps
- 🎯 **Prioritize intelligently** - Focus on highest-value opportunities
- ✈️ **Optimize travel** - Plan efficient routes, reduce road time
- 📈 **Identify white space** - Find underserved markets and industries
- 💰 **Maximize revenue** - Systematically grow each account and region

**ROI Example:**
- Increase territory coverage by 30-40%
- Reduce travel time by 20-25%
- Identify $500K+ in previously hidden opportunities
- Improve account prioritization accuracy
- Grow territory revenue 15-20% faster

## Real-World Context: Intermountain West Territory

**Territory:** Utah, Idaho, Montana, Wyoming, Colorado
**Challenge:**
- 5 states, 500,000+ square miles
- 50-100+ accounts
- Diverse industries (mining, oil & gas, manufacturing, food processing)
- Long travel distances between accounts
- Limited time for in-person visits

**Problem:** Without systematic planning, you end up:
- Missing high-value opportunities
- Spending too much time on low-potential accounts
- Inefficient travel (zigzagging across states)
- Neglecting accounts that seem "fine" but are at risk
- Reactive rather than strategic

**Solution:** This tool gives you complete visibility and a systematic approach.

## What You'll Build

A comprehensive planning tool that creates:

1. **Territory Overview Dashboard**
   - Account distribution map
   - Revenue by state, city, industry
   - Coverage analysis (where are the gaps?)
   - Growth trends by region

2. **Account Prioritization Matrix**
   - Score all accounts on multiple dimensions
   - Identify A/B/C/D tier accounts
   - Recommended contact frequency per tier
   - Strategic vs. transactional accounts

3. **Travel Planning Optimizer**
   - Efficient route planning
   - Multi-day trip recommendations
   - Account clustering (visit multiple accounts per trip)
   - Travel time and cost estimates

4. **White Space Analysis**
   - Underserved geographic areas
   - Industries with low penetration
   - Competitive vulnerabilities
   - Expansion opportunities

5. **Strategic Account Plans**
   - Top 10 account deep dives
   - Growth strategies per account
   - Relationship maps
   - Quarterly objectives

## Step-by-Step Guide

### Step 1: Set Up Your Project

```bash
mkdir ~/territory-planner
cd ~/territory-planner
claude
```

### Step 2: Prepare Your Data

**What you'll need:**
1. **Account list** (CSV from CRM):
   - Company name
   - City, State, ZIP
   - Industry
   - Annual revenue (what they buy from you)
   - Last contact date
   - Account owner
   - Potential value

2. **Purchase history** (optional but helpful):
   - Historical purchases
   - Growth trends

3. **Target list** (optional):
   - Prospective accounts
   - Geographic or industry expansion targets

### Step 3: Build Your Territory Planner

**Your request to Claude:**

```
You: I'm a sales manager covering the Intermountain West region (Utah, Idaho, Montana, Wyoming, Colorado). I need a territory planning and account prioritization tool.

MY DATA:
I have a CSV with these columns:
- Company Name
- Address, City, State, ZIP
- Industry (Oil & Gas, Mining, Manufacturing, Food Processing, etc.)
- Annual Revenue (what they spend with us)
- Total Potential (estimated max opportunity)
- Last Contact Date
- Number of Contacts This Year
- Products Purchased (categories)
- Account Status (Active, At Risk, Growth, New)

I NEED THE TOOL TO:

1. ACCOUNT PRIORITIZATION:
   Create a scoring system (0-100) based on:
   - Current revenue vs. potential (penetration %)
   - Growth trajectory (are they growing with us?)
   - Strategic importance (industry, size, influence)
   - Relationship health (contact frequency, engagement)
   - Geographic efficiency (clustered with other accounts?)

   Then categorize accounts:
   - Tier A (Strategic): High value, high potential, need quarterly visits
   - Tier B (Growth): Medium value, high potential, need 2-3x/year
   - Tier C (Maintain): Solid value, lower potential, annual visits
   - Tier D (Harvest): Low value/potential, phone contact only

2. TERRITORY VISUALIZATION:
   - Create a map showing account locations (can use simple lat/long plot)
   - Color code by tier (A/B/C/D)
   - Size bubbles by revenue
   - Show state boundaries for my 5-state region

3. COVERAGE ANALYSIS:
   - Revenue and account count by state
   - Revenue and account count by industry
   - Identify geographic clusters vs. isolated accounts
   - Flag underserved areas (cities/regions with low coverage)

4. TRAVEL PLANNING:
   For each state, suggest efficient multi-day trips:
   - Group accounts by proximity
   - Suggest visit sequences
   - Estimate drive times between accounts
   - Recommend quarterly/semi-annual visit schedules

5. WHITE SPACE OPPORTUNITIES:
   - Industries where we're underrepresented
   - Cities/regions with growth potential but low presence
   - Accounts with low penetration (<30% of potential)
   - Cross-sell opportunities (accounts buying only 1-2 product categories)

6. OUTPUT FORMATS:
   - HTML dashboard (main overview)
   - Printable one-page territory summary (PDF or HTML)
   - Excel/CSV exports for filtering and analysis
   - Individual account scorecards for top 20 accounts

Can you help me build this system?
```

### Step 4: What Claude Will Create

**Project structure:**
```
territory-planner/
├── data/
│   ├── accounts.csv
│   └── purchase_history.csv (optional)
├── output/
│   ├── dashboard.html
│   ├── territory_map.html
│   ├── account_scores.csv
│   ├── travel_plans/
│   │   ├── utah_q1.html
│   │   ├── idaho_q1.html
│   │   └── ...
│   └── account_cards/
│       ├── tier_a_accounts.pdf
│       └── ...
├── planner.py (or .js)
└── README.md
```

### Step 5: Run Your Analysis

```bash
python planner.py
```

**The tool will:**
1. Load and analyze your account data
2. Calculate priority scores
3. Generate visualizations
4. Create travel plans
5. Identify opportunities
6. Produce reports and dashboards

### Step 6: Review Your Dashboard

```bash
open output/dashboard.html
```

## Example Insights You'll Get

### Account Prioritization Results

**Tier A - Strategic Accounts (Top 10-15):**
```
Acme Mining Corp (Elko, NV) - Score: 95
├── Current Revenue: $450K/year
├── Potential: $1.2M/year (38% penetration)
├── Status: Growth (15% YoY)
├── Strategy: Quarterly visits, expand from valves to full fluid systems
└── Next Action: Q1 strategic planning session

Mountain Oil & Gas (Casper, WY) - Score: 92
├── Current Revenue: $380K/year
├── Potential: $800K/year (48% penetration)
├── Status: Active but competitive pressure
├── Strategy: Lock in with service agreement, introduce new product line
└── Next Action: Executive meeting + facility tour
```

**Tier B - Growth Accounts (15-25):**
High potential but underdeveloped relationships

**Tier C - Maintain (20-30):**
Solid performers, limited growth potential

**Tier D - Harvest (remaining):**
Low value, service via phone/email

### Territory Coverage Analysis

**By State:**
```
Utah: 32 accounts, $2.1M revenue (42% of territory)
├── Salt Lake City area: Strong coverage
├── Ogden: Moderate coverage
└── Southern Utah: OPPORTUNITY - only 2 accounts, growing manufacturing

Colorado: 28 accounts, $1.8M revenue (36%)
├── Denver metro: Strong coverage
├── Western Slope: OPPORTUNITY - oil & gas expansion
└── Fort Collins/Greeley: Good coverage

Idaho: 15 accounts, $650K revenue (13%)
└── OPPORTUNITY: Food processing industry underpenetrated

Wyoming: 12 accounts, $380K revenue (8%)
├── Casper: Solid energy coverage
└── OPPORTUNITY: Mining sector in Gillette area

Montana: 8 accounts, $220K revenue (4%)
└── MAJOR OPPORTUNITY: Minimal presence, mining & energy potential
```

**By Industry:**
```
Oil & Gas: $1.8M (35%) - Mature
Mining: $1.4M (28%) - Growth opportunity
Manufacturing: $1.1M (22%) - Competitive
Food Processing: $520K (10%) - UNDERDEVELOPED
Other: $250K (5%)
```

### Travel Plan Example: Utah Q1 Trip

**3-Day Northern Utah Loop:**
```
Day 1 (Monday):
├── 9:00 AM - Acme Manufacturing (Salt Lake City) [Tier A]
├── 1:00 PM - Western Valve Co (SLC) [Tier B]
└── 4:00 PM - Summit Industries (SLC) [Tier C]

Day 2 (Tuesday):
├── 8:00 AM - Drive to Ogden (45 min)
├── 9:30 AM - Mountain Systems (Ogden) [Tier A]
├── 1:00 PM - Northern Processing (Ogden) [Tier B]
└── 3:30 PM - Drive to Logan (1 hr)

Day 3 (Wednesday):
├── 9:00 AM - Cache Valley Industries (Logan) [Tier A]
├── 12:00 PM - Drive to SLC (2 hr)
└── Evening: Return

Total: 7 accounts, 3 Tier A, 3 Tier B, 1 Tier C
Estimated value: $2.4M in annual revenue covered
```

### White Space Opportunities

```
🎯 HIGH PRIORITY OPPORTUNITIES:

1. Montana Mining Expansion
   - Current: 8 accounts, $220K
   - Potential: 25+ prospects identified, $1M+ opportunity
   - Action: Partner with Swagelok Montana, targeted campaign

2. Idaho Food Processing
   - Current: 5 accounts, $180K
   - Potential: 15+ major processors, $600K+ opportunity
   - Action: Industry-specific solutions campaign

3. Southern Utah Manufacturing Growth
   - Current: 2 accounts, $85K
   - Potential: Region is growing, 10+ prospects
   - Action: Quarterly trips to St. George area

4. Cross-sell: Tubing → Full Systems
   - 18 accounts buying only tubing
   - Opportunity: $400K+ if they adopt complete solutions
   - Action: Educational campaign on total cost of ownership
```

## Advanced Features

### 1. Predictive Account Health

```
You: Can you add predictive analytics that flags accounts likely to:
- Churn (based on declining engagement, reduced orders, competitive signals)
- Grow (based on industry trends, company growth, buying patterns)
- Require attention (relationship health declining)

Add a "Watch List" section with early warning signals.
```

### 2. Competitive Territory Mapping

```
You: I want to track where competitors are strong vs. weak. Add:
- Competitive presence by account (who we're up against)
- Win/loss tracking by competitor and product
- Market share estimates by region and industry
- Vulnerability analysis (accounts at risk from specific competitors)

This helps me develop region-specific competitive strategies.
```

### 3. Goal Tracking and Forecasting

```
You: I have annual and quarterly revenue goals. Can you:
- Track progress against goals (territory, state, industry, account tier)
- Forecast end-of-year revenue based on current trends
- Identify gaps between forecast and goal
- Suggest which accounts/industries to focus on to close gaps
- Show required growth rates by account tier

Create a "Goal Dashboard" showing real-time progress.
```

### 4. Relationship Network Mapping

```
You: For Tier A accounts, I want to map:
- Key stakeholders (decision makers, influencers, gatekeepers)
- Relationship strength (strong, moderate, weak, no relationship)
- Last contact date per stakeholder
- Coverage gaps (important people we haven't met)
- Organizational influence (who influences whom)

Create a "Relationship Map" for each strategic account.
```

### 5. Industry Trend Integration

```
You: Integrate industry and market data:
- Which industries are growing in my territory?
- Economic indicators by state (GDP, unemployment, construction spending)
- Major projects announced (new facilities, expansions)
- Industry-specific news affecting my customers

Add a "Market Trends" dashboard to inform strategy.
```

## Integration with Your Workflow

### Quarterly Planning Routine

**Week before Quarter:**
```bash
# Run fresh analysis
python planner.py

# Review dashboard
open output/dashboard.html

# Plan:
1. Review Tier A account strategies - are they on track?
2. Identify 3-5 Tier B accounts to elevate to Tier A
3. Flag any Tier A accounts at risk
4. Select white space opportunity to focus on this quarter
5. Plan travel schedule - get trips on calendar
6. Set quarterly goals by state/industry
```

### Monthly Check-in

```bash
# Update with latest data (monthly CRM export)
python planner.py

# Quick review:
- Am I on track for quarterly goals?
- Any accounts needing immediate attention?
- Travel plans still optimal or need adjustment?
- New opportunities emerged?
```

### Weekly Prep

**Before each trip:**
- Review account scorecards for accounts you're visiting
- Check relationship maps - who should you ask to meet?
- Review recent news about companies you're visiting
- Confirm account-specific objectives

## Strategic Account Planning

For your top 10 Tier A accounts, Claude can help you create detailed strategic plans:

```
You: For each Tier A account, create a one-page strategic account plan template with:

ACCOUNT OVERVIEW:
- Company background and business model
- Our current relationship and revenue
- Penetration analysis (what we sell vs. what we could sell)
- Key contacts and relationship strength

STRATEGIC OBJECTIVES:
- 1-year revenue goal
- 3-year vision for the account
- Product expansion opportunities
- Relationship strengthening goals

ACTION PLAN:
- Quarterly initiatives
- Key meetings and events
- Resources needed (technical support, executive involvement)
- Success metrics

RISKS & MITIGATION:
- Competitive threats
- Relationship vulnerabilities
- Business risks (customer's challenges)
- Our mitigation strategies

Generate these as printable one-pagers I can share with my leadership.
```

## Career Impact: 10-Year Growth Plan

**How this tool accelerates your career:**

**Years 1-2: Territory Mastery**
- Demonstrate systematic, data-driven approach
- Achieve 15-20% territory growth (vs. 8-10% average)
- Become recognized expert on your region
- **Result:** Top performer status

**Years 3-4: Regional Leadership**
- Share your system with peers
- Mentor other sales managers
- Exceed growth targets consistently
- **Result:** Promotion to Senior Sales Manager or Regional Manager

**Years 5-7: Multi-Region Responsibility**
- Apply your methodology to larger regions
- Build and lead team of sales managers
- Drive strategic initiatives
- **Result:** Regional Sales Director

**Years 8-10: Executive Leadership**
- National sales leadership role
- Strategic planning for company growth
- Known for data-driven decision making
- **Result:** VP of Sales or equivalent

**Key differentiator:** While others "work hard," you work smart with systematic planning and data-driven prioritization.

## Measuring Success

### Track These Metrics

**Territory Health:**
- Total territory revenue (goal: 15-20% annual growth)
- Revenue per account (goal: increase)
- Account penetration rate (goal: >50% average)
- Tier A account count (goal: expand from 10 to 15+)

**Efficiency:**
- Accounts visited per trip (goal: maximize)
- Travel costs as % of revenue (goal: minimize)
- Time in front of customers vs. travel time (goal: optimize)

**Strategic Progress:**
- White space opportunities converted (goal: 3-5/year)
- Accounts elevated from Tier B to Tier A (goal: 3-5/year)
- Account churn rate (goal: <5%)
- Market share by industry (goal: grow in underpenetrated segments)

## Real-World Success Story

**Scenario: Montana Expansion**

**Before Territory Planner:**
- Montana: 8 accounts, $220K revenue
- "Montana is too far, not worth the travel"
- Reactive approach - only visit when customers call

**After White Space Analysis:**
- Tool identifies 25+ mining and energy prospects
- Clustered in 3 key cities (Butte, Billings, Gillette WY)
- Estimated $1M+ opportunity
- Can cover efficiently with quarterly 2-day trips

**Action Taken:**
- Quarter 1: Research trip, meet 10 prospects
- Quarter 2: Technical presentations, 3 new customers
- Quarter 3: Expand relationships, close larger deals
- Quarter 4: 12 active accounts, $450K in pipeline

**18-Month Result:**
- Montana grows from $220K to $680K (209% growth)
- 15 active accounts
- Minimal incremental travel cost
- Recognition as "most improved territory"

**Career Impact:**
- Promoted to Regional Manager
- Asked to share methodology with national team
- Montana expansion becomes case study for other regions

## Data Privacy & Ethics

**Important considerations:**

1. **Don't share competitive intelligence unethically:**
   - Focus on public information and your own data
   - Don't include proprietary customer information
   - Follow your company's data policies

2. **Secure your planning data:**
   ```
   You: Add encryption for account financial data and strategic plans. These are confidential.
   ```

3. **Use for planning, not manipulation:**
   - The goal is to serve customers better, not manipulate them
   - Prioritize based on mutual value, not just extraction
   - Build relationships on trust and value delivery

## Next Steps

Once you have territory planning working:

1. **Integrate with Customer Intelligence:**
   - Combine with [Customer Intelligence Dashboard](customer-intelligence-dashboard.md)
   - Get both strategic (territory) and tactical (account) views

2. **Build Strategic Roadmap:**
   - Use insights to inform [Sales Strategy & Roadmap](sales-strategy-roadmap.md)
   - Plan your 10-year career trajectory

3. **Track Competitive Intelligence:**
   - Feed competitive insights from [Competitive Intelligence Tracker](competitive-intelligence.md)
   - Develop territory-specific competitive strategies

## What You've Learned

By completing this project, you've:
- ✓ Built a comprehensive territory management system
- ✓ Learned data-driven account prioritization
- ✓ Created efficient travel and coverage plans
- ✓ Identified significant white space opportunities
- ✓ Developed strategic thinking skills
- ✓ Positioned yourself for leadership roles

---

**Remember:** Great sales managers don't just work hard - they work systematically. This tool gives you the system to maximize your territory's potential.

**Questions?** Ask Claude Code for help building and customizing your territory planner!
