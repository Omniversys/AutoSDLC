# AutoSDLC Setup Guide

**Complete setup instructions for Linux, Mac, and Windows**

**For organizational deployments**, see [ORG-SETUP-GUIDE.md](ORG-SETUP-GUIDE.md) for multi-tier memory configuration.

---

## \ud83d\ude80 Quick Setup (2 minutes)

Each developer installs AutoSDLC locally. The framework is NOT committed to your project repo.

### Automated Installation (Recommended)

**Linux/Mac:**
```bash
cd YourProject
curl -O https://raw.githubusercontent.com/Omniversys/AutoSDLC/main/install-autosdlc.sh
bash install-autosdlc.sh
```

**Windows PowerShell:**
```powershell
cd YourProject
Invoke-WebRequest -Uri https://raw.githubusercontent.com/Omniversys/AutoSDLC/main/install-autosdlc.ps1 -OutFile install-autosdlc.ps1
.\install-autosdlc.ps1
```

The script will:
- Let you choose: Hidden directory OR Global install
- Clone AutoSDLC repository
- Update .gitignore
- Show you next steps

**That's it!** Follow the on-screen instructions to complete setup.

---

## \ud83d\udee0\ufe0f Manual Installation

Choose your installation strategy:

### Strategy 1: Hidden Directory (Recommended)

**Best for:** Most developers, per-project installation

**Linux/Mac:**
```bash
cd YourProject
git clone https://github.com/Omniversys/AutoSDLC.git .AutoSDLC-framework

# Update .gitignore
cat >> .gitignore << 'EOF'

# AutoSDLC Framework (installed per-developer)
.AutoSDLC-framework/

# AutoSDLC Runtime State (generated)
.AutoSDLC/
EOF
```

**Windows PowerShell:**
```powershell
cd YourProject
git clone https://github.com/Omniversys/AutoSDLC.git .AutoSDLC-framework

# Update .gitignore
Add-Content -Path .gitignore -Value \"`n# AutoSDLC Framework (installed per-developer)`n.AutoSDLC-framework/`n`n# AutoSDLC Runtime State (generated)`n.AutoSDLC/\"\n```

**Windows Command Prompt:**
```cmd
cd YourProject
git clone https://github.com/Omniversys/AutoSDLC.git .AutoSDLC-framework

REM Update .gitignore manually or use PowerShell\n```

---

### Strategy 2: Global Installation

**Best for:** Power users, multiple projects, easy updates

**Linux/Mac:**
```bash
# Install AutoSDLC globally (one time)\nmkdir -p ~/.AutoSDLC\ngit clone https://github.com/Omniversys/AutoSDLC.git ~/.AutoSDLC/framework

# Symlink into your project
cd YourProject
ln -s ~/.AutoSDLC/framework .AutoSDLC-framework

# Update .gitignore
cat >> .gitignore << 'EOF'

# AutoSDLC Framework (installed per-developer)
.AutoSDLC-framework/

# AutoSDLC Runtime State (generated)
.AutoSDLC/
EOF
```

**Windows PowerShell (Junction - No Admin Required):**
```powershell
# Install AutoSDLC globally (one time)
mkdir $env:USERPROFILE\.AutoSDLC
git clone https://github.com/Omniversys/AutoSDLC.git $env:USERPROFILE\.AutoSDLC\\frameworkk

# Create junction in your project (no admin needed)
cd YourProject
cmd /c mklink /J .AutoSDLC-framework \"$env:USERPROFILE\\.AutoSDLC\\framework\"

# Update .gitignore
Add-Content -Path .gitignore -Value \"`n# AutoSDLC Framework (installed per-developer)`n.AutoSDLC-framework/`n`n# AutoSDLC Runtime State (generated)`n.AutoSDLC/\"
```

**Windows PowerShell (Symlink - Requires Administrator):**
```powershell
# Run PowerShell as Administrator

# Install AutoSDLC globally (one time)
mkdir $env:USERPROFILE\\.AutoSDLC
git clone https://github.com/dondetir/AutoSDLC.git $env:USERPROFILE\\.AutoSDLC\\framework

# Create symlink in your project
cd YourProject
cmd /c mklink /D .AutoSDLC-framework \"$env:USERPROFILE\\.AutoSDLC\\framework\"

# Update .gitignore
Add-Content -Path .gitignore -Value \"`n# AutoSDLC Framework (installed per-developer)`n.AutoSDLC-framework/`n`n# AutoSDLC Runtime State (generated)`n.AutoSDLC/\"
```

---

## \ud83d\udcc4 Create Entry Point (First Developer Only)

## \ud83d\udcc4 Create Entry Point (First Developer Only)

Create entry point file and **commit it to repo** so all team members can use AutoSDLC.

Add this line to your AI tool's config file:

**GitHub Copilot users** (`.github/copilot-instructions.md`):
```markdown
# AutoSDLC Orchestration
Read and follow: ./.AutoSDLC-framework/ORCHESTRATOR.md

You are working with AutoSDLC, a multi-agent development workflow framework.
Check `.AutoSDLC/copilot-state.md` for current state and follow the active workflow.
```

**Claude Code users** (`claude.md`):
```markdown
# AutoSDLC Orchestration
Read and follow: ./.AutoSDLC-framework/ORCHESTRATOR.md
```

**Cursor users** (`.cursorrules`):
```markdown
# AutoSDLC Orchestration
Read and follow: ./.AutoSDLC-framework/ORCHESTRATOR.md
```

**Other tools:** Add the same line to your tool's config file (gemini.md, .aider.md, etc.)

### Commit Entry Point (First Developer Only)

```bash
git add .gitignore .github/copilot-instructions.md
git commit -m \"Add AutoSDLC framework support\"
git push
```

---

## \ud83d\udc65 Team Member Setup

**Other team members** just need to:

1. **Pull the repo:**
   ```bash
   git pull
   ```

2. **Install AutoSDLC locally** (choose one):
   
   **Option A: Use install script**
   ```bash
   # Linux/Mac
   bash install-autosdlc.sh
   
   # Windows
   .\\install-autosdlc.ps1
   ```
   
   **Option B: Manual hidden directory**
   ```bash
   git clone https://github.com/Omniversys/AutoSDLC.git .AutoSDLC-framework
   ```
   
   **Option C: Manual global install**
   ```bash
   # Linux/Mac
   ln -s ~/.AutoSDLC/framework .AutoSDLC-framework
   
   # Windows (junction, no admin)
   cmd /c mklink /J .AutoSDLC-framework \"%USERPROFILE%\\.AutoSDLC\\framework\"
   ```

3. **Start AI tool** - AutoSDLC auto-initializes!

---

## \ud83d\udcbb Start Your AI Tool

**GitHub Copilot users:**
```
Start VS Code with GitHub Copilot enabled
Say: "@workspace Check .AutoSDLC/copilot-state.md and begin"
```

**Claude Code users:**
```bash
claude-code
```

**Cursor users:**
```
Open Cursor IDE
```

The AI will automatically:
- Create `.AutoSDLC/` directory structure
- Initialize status tracking and memory system
- Set up document folders
- Show welcome message and status banner

No manual setup needed!

---

## \ud83d\udcca What Gets Created

### Per-Developer (Not Committed)

```
YourProject/
\u251c\u2500\u2500 .AutoSDLC-framework/       # AutoSDLC repo (gitignored)
\u2502   \u251c\u2500\u2500 ORCHESTRATOR.md
\u2502   \u251c\u2500\u2500 ARCHITECTURE.md
\u2502   \u251c\u2500\u2500 config/
\u2502   \u251c\u2500\u2500 agents/
\u2502   \u251c\u2500\u2500 workflows/
\u2502   \u2514\u2500\u2500 templates/
\u2502
\u2514\u2500\u2500 .AutoSDLC/                # Runtime state (gitignored)
    \u251c\u2500\u2500 status.yaml
    \u251c\u2500\u2500 copilot-state.md
    \u251c\u2500\u2500 memory/
    \u2502   \u251c\u2500\u2500 semantic/
    \u2502   \u251c\u2500\u2500 episodic/
    \u2502   \u2514\u2500\u2500 procedural/
    \u2514\u2500\u2500 deliverables/
```

### Committed to Repo

```
YourProject/
\u251c\u2500\u2500 .github/
\u2502   \u2514\u2500\u2500 copilot-instructions.md  # Entry point (COMMITTED)
\u251c\u2500\u2500 .gitignore                     # With AutoSDLC entries (COMMITTED)
\u251c\u2500\u2500 src/                           # Your code
\u2514\u2500\u2500 tests/                         # Your tests
```

---

## \u2699\ufe0f Optional: Create Project Config

Create `project.yaml` in your project root:

```yaml
# project.yaml
project:
  name: "MyProject"
  description: "Brief project description"
  client: "Your Name"

settings:
  # Use AutoSDLC framework - A prompt engineering framework for AI-driven development
  framework_path: "./.AutoSDLC-framework"

  # Client involvement level
  involvement: "high"  # high, medium, low

  # Require approval for phase transitions
  require_phase_approval: true
```

---

## 🔄 Updating AutoSDLC

### Per-Project Installation

```bash
cd .AutoSDLC-framework
git pull origin main
```

### Global Installation

```bash
# Linux/Mac
cd ~/.AutoSDLC/framework
git pull origin main

# Windows
cd $env:USERPROFILE\.AutoSDLC\framework
git pull origin main
```

**Global installation benefit:** Update once, all projects automatically use the latest version!

---

## 🔧 Troubleshooting

### Windows: "mklink requires Administrator"

**Solution 1: Use junction instead (no admin required)**
```powershell
cmd /c mklink /J .AutoSDLC-framework "%USERPROFILE%\.AutoSDLC\framework"
```

**Solution 2: Run PowerShell as Administrator**
- Right-click PowerShell → "Run as Administrator"
- Then create symlink

**Solution 3: Use hidden directory instead**
```powershell
git clone https://github.com/Omniversys/AutoSDLC.git .AutoSDLC-framework
```

### AI doesn't load AutoSDLC

**Check:**
1. `.AutoSDLC-framework/` directory exists
2. Entry point file exists
3. Entry point references `./.AutoSDLC-framework/ORCHESTRATOR.md`

### .AutoSDLC-framework/ showing in git status

```bash
git rm -r --cached .AutoSDLC-framework
git commit -m "Remove AutoSDLC from tracking"
```

---

## 🎯 Next Steps

## Directory Structure After Setup

```
MyProject/
├── AutoSDLC/              # Cloned framework (gitignored)
├── .github/
│   └── copilot-instructions.md  # For GitHub Copilot
├── claude.md             # For Claude Code
├── .cursorrules          # For Cursor
├── project.yaml          # Your project config
├── .gitignore            # Includes AutoSDLC/
│
# The following will be created by the workflow:
├── docs/                 # Generated during workflow
├── architecture/         # Generated during workflow
├── status/               # Generated during workflow
└── src/                  # Created in Phase 2
```

---

## Customization

### Option 1: Override Agent Settings

Create `config/agents-override.yaml` in your project:

```yaml
# Disable ML Engineer if not needed
agents:
  ml_engineer:
    enabled: false
```

### Option 2: Adjust Workflow Settings

Edit `project.yaml`:

```yaml
workflow:
  sprint_duration_days: 7  # Shorter sprints
  client_involvement: "medium"  # Less frequent reviews
```

### Option 3: Use Custom Templates

Create `templates/` in your project root to override AutoSDLC templates.

---

## Updating AutoSDLC

```bash
cd AutoSDLC
git pull
```

All projects using AutoSDLC will automatically use the latest version.

---

## Troubleshooting

### Claude doesn't load AutoSDLC

**Check:**
1. `AutoSDLC/` folder exists in project root
2. `claude.md` exists and references AutoSDLC
3. Project structure matches setup guide

### Agents not behaving correctly

**Check:**
1. `project.yaml` exists
2. AutoSDLC configuration files are readable
3. Review `status/current-status.yaml` for current phase

---

## Next Steps

1. Run `claude-code` in your project
2. PM will greet you and ask what you want to build
3. Follow the gates: PSA → Stories → Architecture → Sprint Plan
4. Say "Begin Execution" to start Phase 2

---

**Need Help?** Check the main README.md or raise an issue.
