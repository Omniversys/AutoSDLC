# AutoSDLC Installation Script for Windows (PowerShell)
# Installs AutoSDLC framework for AI-assisted development

$ErrorActionPreference = "Stop"

Write-Host ""
Write-Host "╔════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║            AutoSDLC Installation - Windows                  ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

# Check if git is installed
try {
    git --version | Out-Null
} catch {
    Write-Host "❌ Error: git is not installed. Please install git first." -ForegroundColor Red
    exit 1
}

# Check if we're in a git repository
if (-not (Test-Path .git)) {
    Write-Host "⚠️  Warning: Not in a git repository. Continue anyway? (y/n)" -ForegroundColor Yellow
    $response = Read-Host
    if ($response -notmatch '^[Yy]$') {
        Write-Host "Installation cancelled." -ForegroundColor Yellow
        exit 0
    }
}

Write-Host "Choose installation method:" -ForegroundColor White
Write-Host ""
Write-Host "  1) Hidden directory (per-project)" -ForegroundColor White
Write-Host "     → Installs to .AutoSDLC-framework\ in this project" -ForegroundColor Gray
Write-Host "     → Recommended for most users" -ForegroundColor Gray
Write-Host ""
Write-Host "  2) Global install (symlinked/junction)" -ForegroundColor White
Write-Host "     → Installs once to %USERPROFILE%\.AutoSDLC\framework" -ForegroundColor Gray
Write-Host "     → Creates link in this project" -ForegroundColor Gray
Write-Host "     → Update once, benefit everywhere" -ForegroundColor Gray
Write-Host "     → Note: Symlinks require Administrator rights" -ForegroundColor Gray
Write-Host "              Junctions work without admin" -ForegroundColor Gray
Write-Host ""
$choice = Read-Host "Enter choice [1-2]"

switch ($choice) {
    "1" {
        # Hidden directory install
        Write-Host ""
        Write-Host "📦 Installing AutoSDLC to .AutoSDLC-framework\..." -ForegroundColor Cyan
        
        if (Test-Path .AutoSDLC-framework) {
            Write-Host "⚠️  .AutoSDLC-framework\ already exists." -ForegroundColor Yellow
            $update = Read-Host "Update existing installation? (y/n)"
            if ($update -match '^[Yy]$') {
                Push-Location .AutoSDLC-framework
                git pull origin main
                Pop-Location
                Write-Host "✅ AutoSDLC updated successfully" -ForegroundColor Green
            } else {
                Write-Host "Installation cancelled." -ForegroundColor Yellow
                exit 0
            }
        } else {
            $AutoSDLCRepo = if ($env:AutoSDLC_REPO) { $env:AutoSDLC_REPO } else { "https://github.com/Omniversys/AutoSDLC.git" }
            git clone $AutoSDLCRepo .AutoSDLC-framework
            
            # Remove non-essential files
            Write-Host "🧹 Cleaning up non-essential files..." -ForegroundColor Cyan
            Push-Location .AutoSDLC-framework
            Remove-Item CONTRIBUTING.md, CODE_OF_CONDUCT.md, CHANGELOG.md, idea.md -ErrorAction SilentlyContinue
            Remove-Item install-autosdlc.sh, install-autosdlc.ps1 -ErrorAction SilentlyContinue
            Pop-Location
            
            Write-Host "✅ AutoSDLC installed to .AutoSDLC-framework\" -ForegroundColor Green
            Write-Host "📦 Source: $AutoSDLCRepo" -ForegroundColor Cyan
        }
    }
    
    "2" {
        # Global install
        Write-Host ""
        Write-Host "📦 Installing AutoSDLC globally..." -ForegroundColor Cyan
        
        $globalPath = "$env:USERPROFILE\.AutoSDLC\framework"
        $AutoSDLCRepo = if ($env:AutoSDLC_REPO) { $env:AutoSDLC_REPO } else { "https://github.com/Omniversys/AutoSDLC.git" }
        
        if (-not (Test-Path $globalPath)) {
            New-Item -ItemType Directory -Path "$env:USERPROFILE\.AutoSDLC" -Force | Out-Null
            git clone $AutoSDLCRepo $globalPath
            
            # Remove non-essential files
            Write-Host "🧹 Cleaning up non-essential files..." -ForegroundColor Cyan
            Push-Location $globalPath
            Remove-Item CONTRIBUTING.md, CODE_OF_CONDUCT.md, CHANGELOG.md, idea.md -ErrorAction SilentlyContinue
            Remove-Item install-autosdlc.sh, install-autosdlc.ps1 -ErrorAction SilentlyContinue
            Pop-Location
            
            Write-Host "✅ AutoSDLC installed globally to $globalPath" -ForegroundColor Green
            Write-Host "📦 Source: $AutoSDLCRepo" -ForegroundColor Cyan
        } else {
            Write-Host "✅ Global AutoSDLC already exists at $globalPath" -ForegroundColor Green
            $update = Read-Host "Update global installation? (y/n)"
            if ($update -match '^[Yy]$') {
                Push-Location $globalPath
                git pull origin main
                Pop-Location
                Write-Host "✅ AutoSDLC updated successfully" -ForegroundColor Green
            }
        }
        
        Write-Host ""
        Write-Host "🔗 Creating link..." -ForegroundColor Cyan
        
        # Check if link already exists
        if (Test-Path .AutoSDLC-framework) {
            $item = Get-Item .AutoSDLC-framework
            if ($item.LinkType) {
                Write-Host "⚠️  Link already exists" -ForegroundColor Yellow
            } else {
                Write-Host "❌ Error: .AutoSDLC-framework exists but is not a link" -ForegroundColor Red
                Write-Host "   Please remove it manually first" -ForegroundColor Red
                exit 1
            }
        } else {
            # Check if running as Administrator
            $isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
            
            if ($isAdmin) {
                # Try symlink first (requires admin)
                try {
                    cmd /c mklink /D .AutoSDLC-framework "$globalPath" 2>&1 | Out-Null
                    Write-Host "✅ Symlink created: .AutoSDLC-framework → $globalPath" -ForegroundColor Green
                } catch {
                    Write-Host "❌ Error creating symlink: $_" -ForegroundColor Red
                    exit 1
                }
            } else {
                # Use junction (no admin required)
                Write-Host "⚠️  Not running as Administrator, creating junction instead of symlink..." -ForegroundColor Yellow
                try {
                    cmd /c mklink /J .AutoSDLC-framework "$globalPath" 2>&1 | Out-Null
                    Write-Host "✅ Junction created: .AutoSDLC-framework → $globalPath" -ForegroundColor Green
                    Write-Host "   (Junctions work like symlinks but don't require admin)" -ForegroundColor Gray
                } catch {
                    Write-Host "❌ Error creating junction: $_" -ForegroundColor Red
                    Write-Host ""
                    Write-Host "Try running PowerShell as Administrator or use hidden directory install" -ForegroundColor Yellow
                    exit 1
                }
            }
        }
    }
    
    default {
        Write-Host "❌ Invalid choice. Installation cancelled." -ForegroundColor Red
        exit 1
    }
}

Write-Host ""
Write-Host "📝 Updating .gitignore..." -ForegroundColor Cyan

# Create .gitignore if it doesn't exist
if (-not (Test-Path .gitignore)) {
    New-Item -ItemType File -Path .gitignore | Out-Null
}

# Check if entries already exist
$gitignoreContent = Get-Content .gitignore -Raw -ErrorAction SilentlyContinue
if ($gitignoreContent -match "\.AutoSDLC-framework/" -and $gitignoreContent -match "\.AutoSDLC/") {
    Write-Host "✅ .gitignore already configured" -ForegroundColor Green
} else {
    # Add entries if they don't exist
    $newEntries = @"

# AutoSDLC Framework (installed per-developer)
.AutoSDLC-framework/

# AutoSDLC Runtime State (generated)
.AutoSDLC/
"@
    Add-Content -Path .gitignore -Value $newEntries
    Write-Host "✅ Updated .gitignore" -ForegroundColor Green
}

Write-Host ""
Write-Host "📁 Setting up .github directory..." -ForegroundColor Cyan

# Create .github directory if it doesn't exist
if (-not (Test-Path .github)) {
    New-Item -ItemType Directory -Path .github -Force | Out-Null
    Write-Host "✅ Created .github directory" -ForegroundColor Green
} else {
    Write-Host "✅ .github directory already exists" -ForegroundColor Green
}

# Copy contents from dotgithub-contents if it exists in the framework
$dotgithubSource = ".AutoSDLC-framework\dotgithub-contents"
if (Test-Path $dotgithubSource) {
    Write-Host "📋 Copying GitHub configuration files..." -ForegroundColor Cyan
    Copy-Item -Path "$dotgithubSource\*" -Destination .github -Recurse -Force
    Write-Host "✅ Copied files from dotgithub-contents to .github" -ForegroundColor Green
} else {
    Write-Host "⚠️  dotgithub-contents not found in framework, skipping copy" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "╔════════════════════════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║               ✅ Installation Complete!                    ║" -ForegroundColor Green
Write-Host "╚════════════════════════════════════════════════════════════╝" -ForegroundColor Green
Write-Host ""
Write-Host "📋 Next Steps:" -ForegroundColor Cyan
Write-Host ""
Write-Host "1. Review the .github directory:" -ForegroundColor White
Write-Host "   → .github\copilot-instructions.md has been created" -ForegroundColor Gray
Write-Host "   → Customize if needed for your project" -ForegroundColor Gray
Write-Host ""
Write-Host "2. Commit .gitignore and .github files:" -ForegroundColor White
Write-Host "   → git add .gitignore .github" -ForegroundColor Gray
Write-Host "   → git commit -m `"Add AutoSDLC framework support`"" -ForegroundColor Gray
Write-Host ""
Write-Host "3. Start your AI tool and begin working!" -ForegroundColor White
Write-Host ""
Write-Host "📚 Documentation:" -ForegroundColor Cyan
Write-Host "   → .AutoSDLC-framework\README.md" -ForegroundColor Gray
Write-Host "   → .AutoSDLC-framework\SETUP.md" -ForegroundColor Gray
Write-Host "   → .AutoSDLC-framework\ARCHITECTURE.md" -ForegroundColor Gray
Write-Host ""
Write-Host "🔄 To update AutoSDLC later:" -ForegroundColor Cyan
if ($choice -eq "1") {
    Write-Host "   → cd .AutoSDLC-framework; git pull" -ForegroundColor Gray
} else {
    Write-Host "   → cd $env:USERPROFILE\.AutoSDLC\framework; git pull" -ForegroundColor Gray
}
Write-Host ""
