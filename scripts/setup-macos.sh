#!/bin/bash

# Claude Code Setup Script for macOS/Linux
# This script will install all necessary dependencies and set up Claude Code

set -e  # Exit on any error

echo "=================================="
echo "Claude Code Setup Script"
echo "=================================="
echo ""

# Color codes for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to print colored output
print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠ $1${NC}"
}

print_error() {
    echo -e "${RED}✗ $1${NC}"
}

print_info() {
    echo -e "$1"
}

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Detect OS
OS="$(uname -s)"
case "${OS}" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    *)          MACHINE="UNKNOWN:${OS}"
esac

print_info "Detected OS: $MACHINE"
echo ""

# Step 1: Check/Install Homebrew (macOS only)
if [ "$MACHINE" = "Mac" ]; then
    print_info "Step 1: Checking for Homebrew..."
    if command_exists brew; then
        print_success "Homebrew is already installed"
        brew --version
    else
        print_warning "Homebrew not found. Installing..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

        # Add Homebrew to PATH for Apple Silicon Macs
        if [ -d "/opt/homebrew" ]; then
            echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
            eval "$(/opt/homebrew/bin/brew shellenv)"
        fi

        print_success "Homebrew installed successfully"
    fi
    echo ""
fi

# Step 2: Check/Install Node.js
print_info "Step 2: Checking for Node.js..."
if command_exists node; then
    print_success "Node.js is already installed"
    node --version
    npm --version
else
    print_warning "Node.js not found. Installing..."
    if [ "$MACHINE" = "Mac" ]; then
        brew install node
    elif [ "$MACHINE" = "Linux" ]; then
        # For Linux, use NodeSource repository
        curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
        sudo apt-get install -y nodejs
    fi
    print_success "Node.js installed successfully"
    node --version
    npm --version
fi
echo ""

# Step 3: Install Claude Code
print_info "Step 3: Installing Claude Code..."
if command_exists claude; then
    print_success "Claude Code is already installed"
    claude --version
    print_info "Updating to latest version..."
    npm update -g @anthropic-ai/claude-code
else
    npm install -g @anthropic-ai/claude-code
    print_success "Claude Code installed successfully"
    claude --version
fi
echo ""

# Step 4: Check/Install Git
print_info "Step 4: Checking for Git..."
if command_exists git; then
    print_success "Git is already installed"
    git --version
else
    print_warning "Git not found. Installing..."
    if [ "$MACHINE" = "Mac" ]; then
        brew install git
    elif [ "$MACHINE" = "Linux" ]; then
        sudo apt-get install -y git
    fi
    print_success "Git installed successfully"
    git --version
fi
echo ""

# Step 5: Configure Git (if not already configured)
print_info "Step 5: Configuring Git..."
if [ -z "$(git config --global user.name)" ]; then
    print_info "Git user name not set. Let's configure it."
    read -p "Enter your name: " git_name
    git config --global user.name "$git_name"
    print_success "Git user name set to: $git_name"
else
    print_success "Git user name already set to: $(git config --global user.name)"
fi

if [ -z "$(git config --global user.email)" ]; then
    print_info "Git user email not set. Let's configure it."
    read -p "Enter your email: " git_email
    git config --global user.email "$git_email"
    print_success "Git user email set to: $git_email"
else
    print_success "Git user email already set to: $(git config --global user.email)"
fi
echo ""

# Step 6: Set up API Key
print_info "Step 6: Setting up Anthropic API Key..."
if [ -n "$ANTHROPIC_API_KEY" ]; then
    print_success "API key is already set in your environment"
else
    print_warning "API key not found in environment"
    print_info ""
    print_info "To get your API key:"
    print_info "1. Visit https://console.anthropic.com"
    print_info "2. Sign up or log in"
    print_info "3. Go to API Keys and create a new key"
    print_info ""
    read -p "Enter your Anthropic API key (or press Enter to skip): " api_key

    if [ -n "$api_key" ]; then
        # Determine which shell config file to use
        if [ -n "$ZSH_VERSION" ] || [ -f "$HOME/.zshrc" ]; then
            SHELL_CONFIG="$HOME/.zshrc"
        elif [ -n "$BASH_VERSION" ] || [ -f "$HOME/.bash_profile" ]; then
            SHELL_CONFIG="$HOME/.bash_profile"
        else
            SHELL_CONFIG="$HOME/.profile"
        fi

        # Add API key to shell config
        echo "" >> "$SHELL_CONFIG"
        echo "# Anthropic API Key for Claude Code" >> "$SHELL_CONFIG"
        echo "export ANTHROPIC_API_KEY=\"$api_key\"" >> "$SHELL_CONFIG"

        # Also set it for current session
        export ANTHROPIC_API_KEY="$api_key"

        print_success "API key saved to $SHELL_CONFIG"
        print_warning "Please run: source $SHELL_CONFIG"
        print_warning "Or restart your terminal for the key to take effect"
    else
        print_warning "Skipping API key setup. You'll need to set it manually later."
        print_info "Add this to your shell config file (~/.zshrc or ~/.bash_profile):"
        print_info "export ANTHROPIC_API_KEY=\"your-api-key-here\""
    fi
fi
echo ""

# Step 7: Test installation
print_info "Step 7: Testing installation..."
if command_exists claude && [ -n "$ANTHROPIC_API_KEY" ]; then
    print_success "All dependencies are installed and configured!"
    echo ""
    print_info "=================================="
    print_info "Setup Complete!"
    print_info "=================================="
    echo ""
    print_info "You can now start using Claude Code by running:"
    print_info "  claude"
    echo ""
    print_info "Try creating a test project:"
    print_info "  mkdir ~/claude-test"
    print_info "  cd ~/claude-test"
    print_info "  claude"
    echo ""
    print_info "Next steps:"
    print_info "  • Check out the example projects in docs/examples/"
    print_info "  • Follow the GitHub setup guide in docs/github-setup.md"
    print_info "  • Start building something amazing!"
elif command_exists claude; then
    print_warning "Claude Code is installed, but API key needs to be set"
    print_info "Please set your API key and restart your terminal"
else
    print_error "Installation completed with some issues"
    print_info "Please check the errors above and try the manual setup guide"
fi
echo ""
