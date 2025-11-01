# Claude Code Setup Script for Windows
# This script will install all necessary dependencies and set up Claude Code
# Run this in PowerShell as Administrator

# Ensure we're running as Administrator
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if (-not $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "⚠ This script requires Administrator privileges" -ForegroundColor Yellow
    Write-Host "Please right-click PowerShell and select 'Run as Administrator'" -ForegroundColor Yellow
    Read-Host "Press Enter to exit"
    exit
}

Write-Host "==================================" -ForegroundColor Cyan
Write-Host "Claude Code Setup Script" -ForegroundColor Cyan
Write-Host "==================================" -ForegroundColor Cyan
Write-Host ""

# Helper functions
function Print-Success {
    param($Message)
    Write-Host "✓ $Message" -ForegroundColor Green
}

function Print-Warning {
    param($Message)
    Write-Host "⚠ $Message" -ForegroundColor Yellow
}

function Print-Error {
    param($Message)
    Write-Host "✗ $Message" -ForegroundColor Red
}

function Print-Info {
    param($Message)
    Write-Host $Message
}

function Test-CommandExists {
    param($Command)
    $null -ne (Get-Command $Command -ErrorAction SilentlyContinue)
}

# Step 1: Check for Chocolatey (Windows package manager)
Print-Info "Step 1: Checking for Chocolatey package manager..."
if (Test-CommandExists choco) {
    Print-Success "Chocolatey is already installed"
    choco --version
} else {
    Print-Warning "Chocolatey not found. Would you like to install it? (Recommended)"
    Print-Info "Chocolatey makes it easier to install and manage software on Windows."
    $installChoco = Read-Host "Install Chocolatey? (y/n)"

    if ($installChoco -eq 'y') {
        Print-Info "Installing Chocolatey..."
        Set-ExecutionPolicy Bypass -Scope Process -Force
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
        Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
        Print-Success "Chocolatey installed successfully"
    }
}
Write-Host ""

# Step 2: Check/Install Node.js
Print-Info "Step 2: Checking for Node.js..."
if (Test-CommandExists node) {
    Print-Success "Node.js is already installed"
    node --version
    npm --version
} else {
    Print-Warning "Node.js not found."
    Print-Info ""
    Print-Info "Node.js installation options:"
    Print-Info "1. Install via Chocolatey (automatic)"
    Print-Info "2. Download from nodejs.org (manual - you'll need to run the installer)"
    Print-Info ""

    if (Test-CommandExists choco) {
        $installChoice = Read-Host "Choose option (1 or 2)"

        if ($installChoice -eq "1") {
            Print-Info "Installing Node.js via Chocolatey..."
            choco install nodejs -y
            # Refresh environment variables
            $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
            Print-Success "Node.js installed successfully"
        } else {
            Print-Info "Please download Node.js from: https://nodejs.org"
            Print-Info "Download the LTS version and run the installer."
            Print-Warning "After installation, close and reopen PowerShell, then run this script again."
            Read-Host "Press Enter to exit"
            exit
        }
    } else {
        Print-Info "Please download Node.js from: https://nodejs.org"
        Print-Info "Download the LTS version and run the installer."
        Print-Warning "After installation, close and reopen PowerShell, then run this script again."
        Read-Host "Press Enter to exit"
        exit
    }
}
Write-Host ""

# Verify Node.js is available
if (-not (Test-CommandExists node)) {
    Print-Error "Node.js installation verification failed"
    Print-Warning "Please close and reopen PowerShell, then run this script again."
    Read-Host "Press Enter to exit"
    exit
}

# Step 3: Install Claude Code
Print-Info "Step 3: Installing Claude Code..."
if (Test-CommandExists claude) {
    Print-Success "Claude Code is already installed"
    claude --version
    Print-Info "Updating to latest version..."
    npm update -g @anthropic-ai/claude-code
} else {
    Print-Info "Installing Claude Code globally..."
    npm install -g @anthropic-ai/claude-code
    Print-Success "Claude Code installed successfully"
    # Refresh environment variables
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
    if (Test-CommandExists claude) {
        claude --version
    } else {
        Print-Warning "Claude command not found in PATH. You may need to restart PowerShell."
    }
}
Write-Host ""

# Step 4: Check/Install Git
Print-Info "Step 4: Checking for Git..."
if (Test-CommandExists git) {
    Print-Success "Git is already installed"
    git --version
} else {
    Print-Warning "Git not found."

    if (Test-CommandExists choco) {
        Print-Info "Installing Git via Chocolatey..."
        choco install git -y
        # Refresh environment variables
        $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
        Print-Success "Git installed successfully"
    } else {
        Print-Info "Please download Git from: https://git-scm.com/download/win"
        Print-Warning "After installation, close and reopen PowerShell, then run this script again."
        Read-Host "Press Enter to exit"
        exit
    }
}
Write-Host ""

# Step 5: Configure Git
Print-Info "Step 5: Configuring Git..."
$gitName = git config --global user.name
if ([string]::IsNullOrEmpty($gitName)) {
    Print-Info "Git user name not set. Let's configure it."
    $name = Read-Host "Enter your name"
    git config --global user.name $name
    Print-Success "Git user name set to: $name"
} else {
    Print-Success "Git user name already set to: $gitName"
}

$gitEmail = git config --global user.email
if ([string]::IsNullOrEmpty($gitEmail)) {
    Print-Info "Git user email not set. Let's configure it."
    $email = Read-Host "Enter your email"
    git config --global user.email $email
    Print-Success "Git user email set to: $email"
} else {
    Print-Success "Git user email already set to: $gitEmail"
}
Write-Host ""

# Step 6: Set up API Key
Print-Info "Step 6: Setting up Anthropic API Key..."
$currentApiKey = [System.Environment]::GetEnvironmentVariable('ANTHROPIC_API_KEY', 'User')

if ($currentApiKey) {
    Print-Success "API key is already set in your environment"
} else {
    Print-Warning "API key not found in environment"
    Print-Info ""
    Print-Info "To get your API key:"
    Print-Info "1. Visit https://console.anthropic.com"
    Print-Info "2. Sign up or log in"
    Print-Info "3. Go to API Keys and create a new key"
    Print-Info ""
    $apiKey = Read-Host "Enter your Anthropic API key (or press Enter to skip)"

    if (-not [string]::IsNullOrEmpty($apiKey)) {
        # Set environment variable permanently for current user
        [System.Environment]::SetEnvironmentVariable('ANTHROPIC_API_KEY', $apiKey, 'User')

        # Also set it for current session
        $env:ANTHROPIC_API_KEY = $apiKey

        Print-Success "API key saved to user environment variables"
        Print-Warning "The key is now available for your current session"
        Print-Info "It will be automatically available in new PowerShell windows"
    } else {
        Print-Warning "Skipping API key setup. You'll need to set it manually later."
        Print-Info ""
        Print-Info "To set it manually, run this command in PowerShell:"
        Print-Info "[System.Environment]::SetEnvironmentVariable('ANTHROPIC_API_KEY', 'your-api-key-here', 'User')"
    }
}
Write-Host ""

# Step 7: Test installation
Print-Info "Step 7: Testing installation..."
$allGood = $true

if (-not (Test-CommandExists node)) {
    Print-Error "Node.js is not available"
    $allGood = $false
}

if (-not (Test-CommandExists npm)) {
    Print-Error "npm is not available"
    $allGood = $false
}

if (-not (Test-CommandExists claude)) {
    Print-Warning "Claude Code command not found"
    Print-Info "You may need to close and reopen PowerShell"
    $allGood = $false
}

if (-not (Test-CommandExists git)) {
    Print-Error "Git is not available"
    $allGood = $false
}

$apiKeySet = -not [string]::IsNullOrEmpty($env:ANTHROPIC_API_KEY)
if (-not $apiKeySet) {
    Print-Warning "API key is not set for current session"
    $allGood = $false
}

Write-Host ""

if ($allGood) {
    Print-Success "All dependencies are installed and configured!"
    Write-Host ""
    Print-Info "==================================" -ForegroundColor Cyan
    Print-Info "Setup Complete!" -ForegroundColor Cyan
    Print-Info "==================================" -ForegroundColor Cyan
    Write-Host ""
    Print-Info "You can now start using Claude Code by running:"
    Print-Info "  claude"
    Write-Host ""
    Print-Info "Try creating a test project:"
    Print-Info "  mkdir ~/claude-test"
    Print-Info "  cd ~/claude-test"
    Print-Info "  claude"
    Write-Host ""
    Print-Info "Next steps:"
    Print-Info "  • Check out the example projects in docs/examples/"
    Print-Info "  • Follow the GitHub setup guide in docs/github-setup.md"
    Print-Info "  • Start building something amazing!"
} else {
    Print-Warning "Setup completed with some issues"
    Print-Info "Please close and reopen PowerShell for changes to take effect"
    Print-Info "Then verify by running: claude --version"
}

Write-Host ""
Read-Host "Press Enter to exit"
