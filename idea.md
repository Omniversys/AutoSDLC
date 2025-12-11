> **Note:** This document contains the original conceptual design. DevFlow is a prompt engineering framework where AI interprets YAML configs to follow structured workflows. The "AI software company" is a metaphor—the AI role-plays different agents based on prompt engineering defined in config files.

---

# Final Plan Overview - AI Software Company for Claude Code

## 🎯 Core Concept

**You are a technical client** who contracts an AI software company. You control all technical decisions in the design phase, then the company executes autonomously.

---

## 📁 Project Structure

```
project-root/
│
├── Claude.md                          # 🧠 Main orchestrator engine (reads all configs)
│
├── config/                            # ⚙️ Configuration files (the brain)
│   ├── project.yaml                   # Project settings, client preferences
│   ├── agents.yaml                    # Which agents are active
│   ├── workflow.yaml                  # References the workflow to use
│   ├── rules.yaml                     # Business rules & constraints
│   └── templates-config.yaml          # Maps document types to templates
│
├── workflows/                         # 🔄 Pluggable workflow definitions
│   └── agile-two-phase.yaml          # YOUR workflow (Design → Execute)
│
├── agents/                            # 👥 Individual agent behaviors
│   ├── pm.yaml                        # Project Manager config
│   ├── product-owner.yaml             # Product Owner config
│   ├── architect.yaml                 # Solution Architect config
│   ├── backend-dev.yaml
│   ├── frontend-dev.yaml
│   ├── ml-engineer.yaml
│   ├── devops.yaml
│   ├── qa-auto.yaml
│   └── qa-manual.yaml
│
├── templates/                         # 📝 Document templates
│   ├── documents/
│   │   ├── PSA.template.md
│   │   ├── epic.template.md
│   │   ├── story.template.md
│   │   └── task.template.md
│   └── architecture/
│       ├── proposal.template.md
│       └── adr.template.md            # Architecture Decision Record
│
├── docs/                              # 📋 Generated project documents
│   ├── PSA.md                         # Product Scope Agreement (living doc)
│   ├── epics/
│   │   ├── EPIC-001.md
│   │   └── EPIC-002.md
│   ├── stories/
│   │   ├── STORY-001.md
│   │   └── STORY-002.md
│   └── tasks/
│       ├── TASK-001.md
│       └── TASK-002.md
│
├── architecture/                      # 🏗️ Architecture artifacts
│   ├── proposal.md                    # Options presented to you
│   ├── approved-architecture.md       # Your final decisions
│   ├── tech-stack.yaml               # Locked after Gate 3
│   ├── diagrams/
│   └── decisions/                     # ADRs (Architecture Decision Records)
│
├── src/                               # 💻 Source code (created in Phase 2)
│   ├── backend/
│   ├── frontend/
│   └── ml/
│
├── tests/
│   ├── automated/
│   └── manual/
│
└── status/                            # 📊 Project tracking
    ├── current-status.yaml            # Current phase, gate, agent
    ├── sprint-plan.md
    └── daily-standup.md
```

---

## 👥 The 9 Agents

| Agent | Phase 1 Role | Phase 2 Role | Autonomy P1/P2 |
|-------|-------------|-------------|----------------|
| **Project Manager** | Your coordinator, presents proposals | Autonomous coordination | 50% / 90% |
| **Product Owner** | Creates epics/stories for your review | Refines stories autonomously | 60% / 95% |
| **Solution Architect** | Presents tech OPTIONS, you decide | Enforces your decisions | 30% / 100% |
| **Backend Developer** | Silent, waiting | Codes autonomously | 0% / 100% |
| **Frontend Developer** | Silent, waiting | Codes autonomously | 0% / 100% |
| **ML Engineer** | Silent, waiting | Builds models autonomously | 0% / 100% |
| **DevOps Engineer** | Silent, waiting | Sets up CI/CD autonomously | 0% / 100% |
| **QA Automation** | Silent, waiting | Writes tests autonomously | 0% / 100% |
| **QA Manual** | Silent, waiting | Tests autonomously | 0% / 100% |

---

## 🔄 Two-Phase Workflow

### **Phase 1: Collaborative Design** (You're in control)

```
┌─────────────────────────────────────────────────────────────┐
│                    PHASE 1: DESIGN                          │
│                  (Collaborative Mode)                        │
└─────────────────────────────────────────────────────────────┘

  You Submit Request
         ↓
  ┌─────────────────────────────────────┐
  │ GATE 1: PSA Approval                │
  │ Owner: Product Owner                 │
  │ → Creates PSA with all epics         │
  │ → YOU REVIEW & APPROVE               │
  └─────────────────────────────────────┘
         ↓
  ┌─────────────────────────────────────┐
  │ GATE 2: Epics/Stories Approval      │
  │ Owner: Product Owner                 │
  │ → Creates detailed user stories      │
  │ → Defines acceptance criteria        │
  │ → YOU REVIEW & APPROVE               │
  └─────────────────────────────────────┘
         ↓
  ┌─────────────────────────────────────┐
  │ GATE 3: Architecture Approval ⭐     │
  │ Owner: Solution Architect            │
  │ → Presents 2-3 OPTIONS per decision  │
  │ → Backend? (FastAPI vs Django...)    │
  │ → Frontend? (React vs Vue...)        │
  │ → Database? (Postgres vs Mongo...)   │
  │ → Pros/Cons for each                 │
  │ → YOU MAKE ALL TECHNICAL DECISIONS   │
  │ → Architect documents your choices   │
  │ → YOU SAY "ARCHITECTURE APPROVED"    │
  └─────────────────────────────────────┘
         ↓
  ┌─────────────────────────────────────┐
  │ GATE 4: Sprint Planning             │
  │ Owner: Project Manager               │
  │ → Creates sprint plan                │
  │ → Assigns tasks to agents            │
  │ → YOU REVIEW & APPROVE               │
  └─────────────────────────────────────┘
         ↓
  🚀 YOU SAY: "Begin Execution"
```

### **Phase 2: Autonomous Execution** (They're in control)

```
┌─────────────────────────────────────────────────────────────┐
│                  PHASE 2: EXECUTION                         │
│                 (Autonomous Mode)                            │
└─────────────────────────────────────────────────────────────┘

  Architecture LOCKED 🔒
         ↓
  All 9 Agents Activated
         ↓
  ┌─────────────────────────────────────┐
  │ Agents Work in Parallel             │
  │                                     │
  │ Backend Dev → Builds APIs           │
  │ Frontend Dev → Builds UI            │
  │ ML Engineer → Trains models         │
  │ DevOps → Sets up pipelines          │
  │ QA Auto → Writes tests              │
  │ QA Manual → Tests features          │
  │                                     │
  │ PM coordinates everything           │
  │ Architect enforces your decisions   │
  └─────────────────────────────────────┘
         ↓
  Daily Updates (optional)
         ↓
  ┌─────────────────────────────────────┐
  │ GATE 5: Sprint Review (Recurring)   │
  │ Owner: Project Manager               │
  │ → Shows completed work               │
  │ → YOU REVIEW                         │
  │ → Feedback for next sprint           │
  └─────────────────────────────────────┘
         ↓
  Repeat until complete
```

---

## 🎮 Your Interaction Points

### **Phase 1 (You're Active)**
1. **PM presents PSA** → You approve/request changes
2. **PO presents Epics/Stories** → You approve/request changes
3. **Architect presents OPTIONS** → You make all tech decisions
4. **PM presents Sprint Plan** → You approve
5. **You say: "Architecture approved, begin execution"** 🚀

### **Phase 2 (You're Passive)**
1. **Optional**: Receive daily standup summaries
2. **Required**: Sprint reviews (demo completed work)
3. **Only If**: Critical blocker escalated to you

---

## 📋 Key Documents & Their Purpose

### **Living Documents** (Updated Throughout)
- **PSA.md**: Project overview, status, epics list
- **status/current-status.yaml**: Current phase, gate, active agent
- **architecture/approved-architecture.md**: Locked after Gate 3

### **Phase 1 Deliverables**
- **docs/epics/EPIC-*.md**: Each epic with its stories
- **docs/stories/STORY-*.md**: Each story with tasks & acceptance criteria
- **architecture/proposal.md**: OPTIONS presented to you
- **status/sprint-plan.md**: Sprint timeline & assignments

### **Phase 2 Deliverables**
- **docs/tasks/TASK-*.md**: Individual task status tracking
- **src/**: All source code
- **tests/**: All test suites
- **architecture/decisions/**: ADRs for any minor decisions agents make

---

## 🔒 Critical Rules (Enforced by `config/rules.yaml`)

1. **No code written before Gate 3 approval** ✋
2. **Architect NEVER makes final decisions in Phase 1** (only proposes options)
3. **No tech stack changes in Phase 2 without your approval** 🔒
4. **PM is your single point of contact** 
5. **Phase transition happens only when you say so** 🚀

---

## 🚀 How It All Works

### **When You Start a Project:**

1. **You create** a new project folder
2. **You run**: `claude-code` in that folder
3. **Claude reads** `Claude.md`
4. **Claude loads**:
   - `config/project.yaml` → Understands this is a two-phase workflow
   - `workflows/agile-two-phase.yaml` → Loads the workflow
   - `config/agents.yaml` → Activates PM, PO, Architect for Phase 1
5. **PM Agent activates** and says:
   > "Hello! I'm your Project Manager. What would you like to build?"

### **Phase 1 Flow:**

```
You: "I need a customer portal with auth and dashboard"
  ↓
PM: "Let me clarify requirements..."
  (asks questions)
  ↓
PO: "Here's the PSA with 3 epics: Auth, Dashboard, Admin"
  ↓
You: "Approved"
  ↓
PO: "Here are 12 user stories with acceptance criteria"
  ↓
You: "Change story #5, rest approved"
  ↓
Architect: "Here are my recommendations:
  - Backend: Option A (FastAPI) vs Option B (Django)
  - Frontend: Option A (React) vs Option B (Vue)
  - Database: Option A (Postgres) vs Option B (Mongo)
  
  [Shows pros/cons comparison matrix]
  
  What's your decision?"
  ↓
You: "FastAPI, React, Postgres"
  ↓
Architect: "Documented. Here's the full architecture."
  ↓
You: "Architecture approved, begin execution" 🚀
```

### **Phase 2 Flow:**

```
PM: "Switching to execution mode. All agents activated."
  ↓
[Agents work silently for hours/days]
  ↓
Backend Dev: ✅ TASK-001 complete
Frontend Dev: ✅ TASK-002 complete
ML Engineer: ✅ TASK-003 complete
...
  ↓
PM: "Sprint 1 complete. Here's the demo..."
  ↓
You: "Looks good, continue"
  ↓
[Repeat]
```

---

## 🔧 Customization Examples

### **Want Full Autonomy?**
Change `config/project.yaml`:
```yaml
client_role:
  involvement_level: "minimal"
  approval_required_for:
    - final_delivery  # Only final review
```

### **Want More Control in Phase 2?**
Change `workflows/agile-two-phase.yaml`:
```yaml
phases:
  execution:
    autonomy_level: 70  # Lower autonomy
    gates:
      - gate_5_sprint_review
      - gate_6_task_review  # Add task-level reviews
```

### **Want to Add New Agent?**
1. Create `agents/security-engineer.yaml`
2. Add to `config/agents.yaml`
3. Add to workflow phases where needed

---

## 📊 Status Tracking

### **At Any Time, Check:**
- `status/current-status.yaml` → Current phase/gate
- `docs/PSA.md` → Overall project status
- `docs/tasks/*.md` → Individual task progress

### **Document Status Flow:**
```
TASK complete → STORY updates
STORY complete → EPIC updates
EPIC complete → PSA updates
All EPICS complete → PROJECT COMPLETE ✅
```

---

## 🎯 Next Steps

**To build this system, we need to create:**

1. ✅ **Claude.md** - The orchestrator engine
2. ✅ **config/*.yaml** - All configuration files
3. ✅ **workflows/agile-two-phase.yaml** - Your workflow
4. ✅ **agents/*.yaml** - All 9 agent definitions
5. ✅ **templates/*.md** - All document templates

