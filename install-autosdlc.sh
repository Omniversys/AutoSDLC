#!/bin/bash
# AutoSDLC Installation Script for Linux/Mac
# Installs AutoSDLC framework for AI-assisted development

set -e

echo ""
echo "╔════════════════════════════════════════════════════════════╗"
echo "║            AutoSDLC Installation - Linux/Mac                ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "❌ Error: git is not installed. Please install git first."
    exit 1
fi

# Check if we're in a git repository
if [ ! -d .git ]; then
    echo "⚠️  Warning: Not in a git repository. Continue anyway? (y/n)"
    read -r response
    if [[ ! "$response" =~ ^[Yy]$ ]]; then
        echo "Installation cancelled."
        exit 0
    fi
fi

echo "Choose installation method:"
echo ""
echo "  1) Hidden directory (per-project)"
echo "     → Installs to .AutoSDLC-framework/ in this project"
echo "     → Recommended for most users"
echo ""
echo "  2) Global install (symlinked)"
echo "     → Installs once to ~/.AutoSDLC/framework"
echo "     → Creates symlink in this project"
echo "     → Update once, benefit everywhere"
echo ""
read -p "Enter choice [1-2]: " choice

case $choice in
    1)
        # Hidden directory install
        echo ""
        echo "📦 Installing AutoSDLC to .AutoSDLC-framework/..."
        
        if [ -d .AutoSDLC-framework ]; then
            echo "⚠️  .AutoSDLC-framework/ already exists."
            read -p "Update existing installation? (y/n): " update
            if [[ "$update" =~ ^[Yy]$ ]]; then
                cd .AutoSDLC-framework
                git pull origin main
                cd ..
                echo "✅ AutoSDLC updated successfully"
            else
                echo "Installation cancelled."
                exit 0
            fi
        else
            AutoSDLC_REPO="${AutoSDLC_REPO:-https://github.com/Omniversys/AutoSDLC.git}"
            git clone "$AutoSDLC_REPO" .AutoSDLC-framework
            
            # Remove non-essential files
            echo "🧹 Cleaning up non-essential files..."
            cd .AutoSDLC-framework
            rm -f CONTRIBUTING.md CODE_OF_CONDUCT.md CHANGELOG.md idea.md
            rm -f install-autosdlc.sh install-autosdlc.ps1
            cd ..
            
            echo "✅ AutoSDLC installed to .AutoSDLC-framework/"
            echo "📦 Source: $AutoSDLC_REPO"
        fi
        ;;
        
    2)
        # Global install
        echo ""
        echo "📦 Installing AutoSDLC globally..."
        
        GLOBAL_PATH="$HOME/.AutoSDLC/framework"
        AutoSDLC_REPO="${AutoSDLC_REPO:-https://github.com/Omniversys/AutoSDLC.git}"
        
        if [ ! -d "$GLOBAL_PATH" ]; then
            mkdir -p "$HOME/.AutoSDLC"
            git clone "$AutoSDLC_REPO" "$GLOBAL_PATH"
            
            # Remove non-essential files
            echo "🧹 Cleaning up non-essential files..."
            cd "$GLOBAL_PATH"
            rm -f CONTRIBUTING.md CODE_OF_CONDUCT.md CHANGELOG.md idea.md
            rm -f install-autosdlc.sh install-autosdlc.ps1
            cd - > /dev/null
            
            echo "✅ AutoSDLC installed globally to $GLOBAL_PATH"
            echo "📦 Source: $AutoSDLC_REPO"
        else
            echo "✅ Global AutoSDLC already exists at $GLOBAL_PATH"
            read -p "Update global installation? (y/n): " update
            if [[ "$update" =~ ^[Yy]$ ]]; then
                cd "$GLOBAL_PATH"
                git pull origin main
                cd - > /dev/null
                echo "✅ AutoSDLC updated successfully"
            fi
        fi
        
        echo ""
        echo "🔗 Creating symlink..."
        
        if [ -L .AutoSDLC-framework ]; then
            echo "⚠️  Symlink already exists"
        elif [ -e .AutoSDLC-framework ]; then
            echo "❌ Error: .AutoSDLC-framework exists but is not a symlink"
            echo "   Please remove it manually first"
            exit 1
        else
            ln -s "$GLOBAL_PATH" .AutoSDLC-framework
            echo "✅ Symlink created: .AutoSDLC-framework → $GLOBAL_PATH"
        fi
        ;;
        
    *)
        echo "❌ Invalid choice. Installation cancelled."
        exit 1
        ;;
esac

echo ""
echo "📝 Updating .gitignore..."

# Create .gitignore if it doesn't exist
if [ ! -f .gitignore ]; then
    touch .gitignore
fi

# Check if entries already exist
if grep -q ".AutoSDLC-framework/" .gitignore && grep -q ".AutoSDLC/" .gitignore; then
    echo "✅ .gitignore already configured"
else
    # Add entries if they don't exist
    {
        echo ""
        echo "# AutoSDLC Framework (installed per-developer)"
        echo ".AutoSDLC-framework/"
        echo ""
        echo "# AutoSDLC Runtime State (generated)"
        echo ".AutoSDLC/"
    } >> .gitignore
    echo "✅ Updated .gitignore"
fi

echo ""
echo "📁 Setting up .github directory..."

# Create .github directory if it doesn't exist
if [ ! -d .github ]; then
    mkdir -p .github
    echo "✅ Created .github directory"
else
    echo "✅ .github directory already exists"
fi

# Copy contents from dotgithub-contents if it exists in the framework
if [ -d .AutoSDLC-framework/dotgithub-contents ]; then
    echo "📋 Copying GitHub configuration files..."
    cp -r .AutoSDLC-framework/dotgithub-contents/* .github/
    echo "✅ Copied files from dotgithub-contents to .github"
    
    # Remove dotgithub-contents from framework after copying
    echo "🧹 Cleaning up dotgithub-contents..."
    rm -rf .AutoSDLC-framework/dotgithub-contents
    echo "✅ Removed dotgithub-contents from framework"
else
    echo "⚠️  dotgithub-contents not found in framework, skipping copy"
fi

echo ""
echo "╔════════════════════════════════════════════════════════════╗"
echo "║               ✅ Installation Complete!                    ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""
echo "📋 Next Steps:"
echo ""
echo "1. Review the .github directory:"
echo "   → .github/copilot-instructions.md has been created"
echo "   → Customize if needed for your project"
echo ""
echo "2. Commit .gitignore and .github files:"
echo "   → git add .gitignore .github"
echo "   → git commit -m \"Add AutoSDLC framework support\""
echo ""
echo "3. Start your AI tool and begin working!"
echo ""
echo "📚 Documentation:"
echo "   → .AutoSDLC-framework/README.md"
echo "   → .AutoSDLC-framework/SETUP.md"
echo "   → .AutoSDLC-framework/ARCHITECTURE.md"
echo ""
echo "🔄 To update AutoSDLC later:"
if [ "$choice" = "1" ]; then
    echo "   → cd .AutoSDLC-framework && git pull"
else
    echo "   → cd ~/.AutoSDLC/framework && git pull"
fi
echo ""
