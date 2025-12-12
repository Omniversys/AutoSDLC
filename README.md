# AutoSDLC

## Table of Contents

- [Attribution](#-attribution)
- [Quick Start](#-quick-start-2-minutes)
- [What It Is](#what-it-is)
- [For Organizations](#-for-organizations)
- [How It Works](#how-it-works)
- [Example Workflows](#-example-workflows)
- [The Prompt Engineering Architecture](#the-prompt-engineering-architecture)
- [Full Installation Guide](#-full-installation-guide)
- [Team Workflow](#-team-workflow)
- [Contributing vs Forking](#-contributing-vs-forking)
- [What This Framework Provides](#-what-this-framework-provides)
- [Documentation](#-documentation)
- [Configuration](#-configuration)
- [How It Works (Detailed)](#-how-it-works)
- [Updating AutoSDLC](#-updating-autosdlc)
- [Framework Structure](#-framework-structure)
- [Is This Prompt Engineering?](#is-this-prompt-engineering)
- [Contributing](#-contributing)
- [License](#-license)

---

## 🙏 Attribution

AutoSDLC is inspired by innovative multi-agent development workflow frameworks. See [ATTRIBUTION.md](ATTRIBUTION.md) for full details.

---

## 🚀 Quick Start (2 Minutes)

> **💡 For detailed instructions, see [SETUP.md](SETUP.md). If you just want to get started quickly, follow these steps:**

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

For manual installation, global installation, or detailed setup instructions, see [SETUP.md](SETUP.md).

---

**Where AI Meets Engineering Discipline**

*Multi-Agent Development Workflow via Prompt Engineering*

A config-driven framework that orchestrates AI coding assistants through structured prompts. Define agent behaviors, workflows, and quality gates in YAML—AI follows your methodology.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Version](https://img.shields.io/badge/version-v1.0.0-blue.svg)](https://github.com/Omniversys/AutoSDLC/releases)
[![GitHub Issues](https://img.shields.io/github/issues/Omniversys/AutoSDLC.svg)](https://github.com/Omniversys/AutoSDLC/issues)
[![Contributions Welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg)](https://github.com/Omniversys/AutoSDLC/blob/main/CONTRIBUTING.md)

## What It Is

- 📝 **Prompt Engineering Framework** - Not software, just structured prompts
- ⚙️ **Config-Driven** - Define workflows, agents, and rules in YAML
- 🔄 **Workflow Orchestration** - Two-phase process (Design → Execute)
- 🤖 **Multi-Agent** - AI role-plays 9 specialized agents via prompts
- 🧠 **Memory System** - Semantic, episodic, and procedural memory for continuity
- 🛠️ **Tool Agnostic** - Works with GitHub Copilot, Claude Code, Cursor, or any AI assistant
- 📦 **Git-Friendly** - Everything is version-controlled config files

## 🏢 For Organizations

- **Multi-Tier Memory** - Organization → Team → User → Project hierarchy
- **Knowledge Retention** - Learnings persist across projects and team members
- **Git-Based Collaboration** - Team knowledge versioned and shared via Git
- **Compliance & Security** - Enforced org-wide policies and standards
- **Scalable Onboarding** - New developers bootstrap from org/team knowledge

See [ORGANIZATIONAL-MEMORY.md](ORGANIZATIONAL-MEMORY.md) for enterprise deployment.

## How It Works

1. Clone AutoSDLC into your project
2. AI reads entry point config (`.github/copilot-instructions.md`, `claude.md`, or `.cursorrules`)
3. Entry point references AutoSDLC's ORCHESTRATOR.md
4. YAML files define agent behaviors and workflow rules
5. AI interprets configs and follows the methodology
6. AI role-plays different agents based on current phase
7. Memory system preserves knowledge across sessions
8. Status files track progress across sessions

**It's a methodology, not a tool. The AI is the execution engine.**

## 📺 Example Workflows

AutoSDLC adapts to your needs with five specialized workflows:

### Example 1: Emergency Hot-Fix (30-120 minutes) 🚨

```
┌────────────────────────────────────────────────────────────────┐
│  Critical Production Issue - Emergency Hot-Fix                 │
└────────────────────────────────────────────────────────────────┘

👤 User: "Production is down! Users can't log in"

🤖 PM: "🚨 EMERGENCY MODE - Setting up Hot-Fix workflow..."

Gate 1: Rapid Assessment (15 min)
─────────────────────────────────────────────────────────────────
🏗️ Architect:
   [Analyzing] production logs, auth service status

   CRITICAL ISSUE: Database connection pool exhausted
   Location: auth-service/db-pool.ts:28
   Impact: 100% of login attempts failing

   Hot-Fix Options:
   [A] Immediate: Increase pool size (5 min deploy)
   [B] Quick patch: Add connection timeout (15 min)

👤 User: "Option A - deploy now!"

Gate 2: Hot-Fix & Deploy (45 min)
─────────────────────────────────────────────────────────────────
💻 Dev: Increased pool size from 10 to 50
🔧 DevOps: Deployed to production, monitoring metrics
🧪 QA: Verified login working, load testing passed

✅ PRODUCTION RESTORED in 60 minutes!
📋 Post-mortem scheduled for root cause analysis
```

### Example 2: Bug Fix (45 minutes) 🐛

```
┌────────────────────────────────────────────────────────────────┐
│  Quick Bug Fix with AutoSDLC                                    │
└────────────────────────────────────────────────────────────────┘

👤 User: "Fix the login timeout bug"

🤖 PM: "I'll set up Bug Fix workflow. Analyzing the issue..."

Gate 1: Problem Analysis (15 min)
─────────────────────────────────────────────────────────────────
🏗️ Architect:
   [Analyzing] auth/login.ts, session-manager.ts

   Root Cause: Session timeout set to 5ms instead of 5min
   Location: config/auth.ts:42

   Fix Options:
   [A] Quick fix: Change timeout constant (Low risk, 5 min)
   [B] Add validation: Prevent invalid timeouts (Medium risk, 15 min)
   [C] Comprehensive: Refactor session config (High risk, 1 hour)

👤 User: "Option A"

Gate 2: Implementation (30 min)
─────────────────────────────────────────────────────────────────
💻 Dev: Fixed timeout constant
🧪 QA: Verified fix, all tests passing, no regression

✅ BUG RESOLVED in 45 minutes!
```

### Example 3: Code Refactor (1 day) 🔄

```
┌────────────────────────────────────────────────────────────────┐
│  Refactoring UserAuth Module                                   │
└────────────────────────────────────────────────────────────────┘

👤 User: "The UserAuth.js file is 500 lines and impossible to maintain"

🤖 PM: "Setting up Refactor workflow..."

Gate 1: Code Quality Analysis (1 hour)
─────────────────────────────────────────────────────────────────
🏗️ Architect: Analyzed UserAuth.js

   Code Smells Found:
   • Cyclomatic complexity: 45 (target: <10)
   • File length: 487 lines (target: <200)
   • 3 levels of nesting
   • Duplicate validation logic (4 places)
   • Mixed concerns: validation, API, state, UI

   Current Metrics:
   • Test coverage: 45%
   • Code duplication: 23%
   • Maintainability index: 32/100

👤 User: "Approved - let's fix this"

Gate 2: Refactoring Strategy (1 hour)
─────────────────────────────────────────────────────────────────
🏗️ Architect: Refactoring approaches:

   [A] Conservative (4-8 hours)
       • Extract duplicate validation
       • Split into smaller functions
       • Risk: Low

   [B] Moderate (1-2 days)  ⭐ RECOMMENDED
       • Extract 4 separate modules
       • Apply separation of concerns
       • Risk: Medium

   [C] Comprehensive (2-5 days)
       • Complete redesign with patterns
       • Full test suite rewrite
       • Risk: High

👤 User: "Option B - Moderate"

Gate 3: Refactor & Verify (4 hours)
─────────────────────────────────────────────────────────────────
💻 Dev: Refactoring incrementally

   Commit 1: Extract AuthValidator ✅ (tests pass)
   Commit 2: Extract AuthAPI ✅ (tests pass)
   Commit 3: Extract AuthState ✅ (tests pass)
   Commit 4: Extract AuthUI ✅ (tests pass)

🧪 QA: Verification complete
   • All 127 tests passing
   • No behavior changes
   • Functional equivalence confirmed

📊 Final Metrics:
   • Cyclomatic complexity: 12 (improved 73%!)
   • Test coverage: 78% (improved 33%)
   • Code duplication: 5% (reduced 78%!)
   • Maintainability index: 82/100 (improved 156%!)

✅ REFACTOR COMPLETE: Code quality dramatically improved!
```

### Example 4: Feature Development (2 days) ✨

```
┌────────────────────────────────────────────────────────────────┐
│  Adding Dark Mode Feature                                      │
└────────────────────────────────────────────────────────────────┘

👤 User: "Add dark mode to the app"

🤖 PM: "Setting up Feature Development workflow..."

Gate 1: Feature Brief & Codebase Analysis (2 hours)
─────────────────────────────────────────────────────────────────
📋 PO: Created feature brief with 3 user stories:
   • User can toggle dark mode
   • Theme persists across sessions
   • All components support dark theme

🏗️ Architect: Analyzed codebase
   Integration points found:
   • ThemeProvider in App.tsx
   • 23 components need theme updates
   • localStorage for persistence

👤 User: "Approved"

Gate 2: Technical Design (2 hours)
─────────────────────────────────────────────────────────────────
🏗️ Architect: Implementation options:

   [A] CSS Variables approach
       Pros: Clean, performant, easy maintenance
       Cons: No IE11 support
       Impact: Modify 23 components, add theme.css

   [B] Styled Components theming
       Pros: Type-safe, component-scoped
       Cons: Runtime overhead
       Impact: Add styled-components, wrap all components

👤 User: "Option A - CSS Variables"

Gate 3: Implementation (1 day)
─────────────────────────────────────────────────────────────────
💻 Dev Team:
   [✓] Story 1: Toggle component → DONE
   [✓] Story 2: Persistence → DONE
   [✓] Story 3: Theme components → IN PROGRESS

🧪 QA: Testing each story as completed

✅ FEATURE COMPLETE: Dark mode working across entire app!
```

### Example 5: New Project (3 weeks) 🚀

```
┌────────────────────────────────────────────────────────────────┐
│  Building E-commerce Platform                                  │
└────────────────────────────────────────────────────────────────┘

Week 1: Architecture & Planning
─────────────────────────────────────────────────────────────────
👤 User: "Build an e-commerce platform"

🤖 PM: "Setting up full Project workflow..."

Gate 1: PSA (Day 1)
📋 PO: Created PSA with 5 epics:
   • User Management & Auth
   • Product Catalog
   • Shopping Cart
   • Checkout & Payment
   • Admin Dashboard

Gate 2: Stories (Day 2-3)
📋 PO: Created 28 detailed user stories with acceptance criteria

Gate 3: Architecture (Day 4-5)
🏗️ Architect: Technology stack options presented:
   Backend: [Django | FastAPI | Node.js]
   Frontend: [React | Vue | Angular]
   Database: [PostgreSQL | MongoDB]
   Payment: [Stripe | PayPal]

👤 User: "FastAPI + React + PostgreSQL + Stripe"

Gate 4: Sprint Planning (Day 5)
🤖 PM: Created 3-sprint plan, assigned tasks to agents

Week 2-3: Autonomous Execution
─────────────────────────────────────────────────────────────────
💻 All 9 agents working autonomously:

   Sprint 1: ████████████████████ 100% (Auth + Products)
   Sprint 2: ████████████░░░░░░░ 75% (Cart + Checkout)
   Sprint 3: ░░░░░░░░░░░░░░░░░░░ 0% (Admin + Polish)

🤖 PM: Weekly sprint reviews with demos

✅ PROJECT DELIVERED with full architecture and quality gates!
```

## The Prompt Engineering Architecture

```
claude.md (orchestrator)
    ↓ references
AutoSDLC/
  ├── config/
  │   ├── workflow.yaml    ← Defines phases, gates, transitions
  │   ├── agents.yaml      ← Which agents are active
  │   └── rules.yaml       ← Quality rules and constraints
  ├── agents/
  │   ├── pm.yaml          ← PM personality and behaviors
  │   ├── architect.yaml   ← Architect prompt engineering
  │   └── ...              ← 7 more agent definitions
  └── templates/           ← Document templates

AI reads these → AI follows → AI orchestrates
```

No compilation. No dependencies. Just prompts and configs.

## 📖 Full Installation Guide

For complete installation instructions including manual setup, global installation, entry point configuration, and team workflow, see **[SETUP.md](SETUP.md)**.

---

## 👥 Team Workflow

**First Developer (Setup):**
1. ✅ Install AutoSDLC locally (hidden directory or global)
2. ✅ Update `.gitignore` (add `.AutoSDLC-framework/` and `.AutoSDLC/`)
3. ✅ Create entry point file (`.github/copilot-instructions.md` or `claude.md`)
4. ✅ Commit `.gitignore` and entry point file to repo
5. ✅ Push to remote

**Other Team Members (Join):**
1. ✅ Pull the repo (gets `.gitignore` and entry point)
2. ✅ Install AutoSDLC locally: Run install script OR `git clone https://github.com/Omniversys/AutoSDLC.git .AutoSDLC-framework`
3. ✅ Start AI tool - AutoSDLC auto-initializes

**Key Points:**
- 🔒 AutoSDLC framework is **NOT committed** to project repo
- 📝 Only entry point file (`.github/copilot-instructions.md`) is committed
- 👤 Each developer installs AutoSDLC independently
- 🔄 Developers can choose hidden directory OR global install
- 🌍 Global install: Update once, all projects benefit

---

## 🔀 Contributing vs Forking

### ✅ Contribute Improvements (No Fork Needed)

**When to contribute:**
- 🐛 Bug fixes that benefit everyone
- ✨ General improvements (no org-specific logic)
- 📚 Documentation enhancements
- 🔧 New workflow types or agent behaviors

**How:**
```bash
cd .AutoSDLC-framework
git checkout -b feature/your-improvement
# Make changes
git commit -m "Improve error handling"
git push origin feature/your-improvement
# Create PR to Omniversys/AutoSDLC
```

See [CONTRIBUTING.md](CONTRIBUTING.md) for full guidelines.

### 🍴 Fork for Customizations

**When to fork:**
- 🏢 Organization-wide customizations
- 🔒 Proprietary modifications
- 🎨 Custom agent personalities
- 🔐 Internal tool integrations

**Install from your fork:**
```bash
# Linux/Mac
AutoSDLC_REPO=https://github.com/yourname/AutoSDLC.git bash install-AutoSDLC.sh

# Windows
$env:AutoSDLC_REPO = "https://github.com/yourname/AutoSDLC.git"
.\install-AutoSDLC.ps1
```

**Keep fork synchronized:**
```bash
cd .AutoSDLC-framework
git fetch upstream
git merge upstream/main
```

See [FORK-WORKFLOW.md](FORK-WORKFLOW.md) for complete fork guide.

---

## 📋 What This Framework Provides

- **10 AI Agents**: PM, Product Owner, Architect, Backend Dev, Frontend Dev, ML Engineer, DevOps, QA Automation, QA Manual, Security Expert
- **5 Specialized Workflows**:
  - 🚨 Emergency Hot-Fix (2 gates, 30-120 min)
  - 🐛 Bug Fix (2 gates, 45-90 min)
  - 🔄 Refactor (3 gates, 2h-3 days)
  - ✨ Feature Development (3 gates, 1-5 days)
  - 🚀 New Project (4 gates + execution, weeks-months)
- **Task Classification**: AI automatically routes to the right workflow
- **Document Templates**: PSA, Epics, Stories, Tasks, Architecture proposals
- **Quality Gates**: 3-gate story completion prevents incomplete work
- **Configurable Rules**: Control what happens at each phase

## 📚 Documentation

- **[SETUP.md](SETUP.md)** - Installation and setup guide
- **[FORK-WORKFLOW.md](FORK-WORKFLOW.md)** - Fork and contribute guide
- **[ORGANIZATIONAL-MEMORY.md](ORGANIZATIONAL-MEMORY.md)** - Enterprise memory system
- **[ORG-SETUP-GUIDE.md](ORG-SETUP-GUIDE.md)** - Organizational deployment
- **[ORCHESTRATOR.md](ORCHESTRATOR.md)** - Complete orchestrator reference
- **[WORKFLOW-VISUAL-GUIDE.md](WORKFLOW-VISUAL-GUIDE.md)** - Visual diagrams and decision trees
- **[FAQ.md](FAQ.md)** - Frequently asked questions
- **[STORY-COMPLETION-RULES-UPDATE.md](STORY-COMPLETION-RULES-UPDATE.md)** - Quality gate details

## 🔧 Configuration

Edit `project.yaml` in your project root to customize:
- Project name and description
- Client involvement level
- Active agents
- Workflow preferences

## 📖 How It Works

1. **Task Classification** (AI asks what you need)
   - 🐛 Bug Fix: Fast analysis and targeted fix
   - 🔄 Refactor: Code quality improvement without behavior changes
   - ✨ Feature: Balanced design and implementation
   - 🚀 Project: Full architecture and planning

2. **Workflow Execution** (Optimized for task type)
   - Bug Fix: 2 gates (Analysis → Fix)
   - Refactor: 3 gates (Analysis → Strategy → Refactor)
   - Feature: 3 gates (Scoping → Design → Build)
   - Project: 4 gates (PSA → Stories → Architecture → Sprint) + Execution phase

3. **Quality Assurance** (Every story verified)
   - Peer code review by different agent
   - QA verification and testing
   - PM final verification
   - No incomplete work marked as done

## 🔄 Updating AutoSDLC

```bash
cd AutoSDLC
git pull
```

## 📁 Framework Structure

```
AutoSDLC/
├── config/              # Shared configurations
├── workflows/           # Workflow definitions
├── agents/              # Agent behaviors
└── templates/           # Document templates
```

## Is This Prompt Engineering?

**Yes!** AutoSDLC is 100% prompt engineering:

- ✅ No compiled code, no dependencies
- ✅ Just YAML configs + markdown templates
- ✅ AI reads configs and follows instructions
- ✅ Agent "behaviors" are just prompts in YAML
- ✅ Workflows are prompt sequences
- ✅ Works with any LLM-based coding assistant

**Think of it as:**
- A "framework" = Structured collection of prompts
- "Agents" = Different prompt contexts for the same AI
- "Orchestration" = AI switching between prompt contexts
- "Workflow" = Sequence of prompt-guided actions

It's prompt engineering at scale.

## 🤝 Contributing

This framework is meant to be stable. Fork and customize for your needs.

## 📝 License

MIT
