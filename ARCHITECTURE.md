# AutoSDLC Architecture

High-level architecture of the AutoSDLC multi-agent development workflow framework with memory system.

---

## 🏗️ System Overview

### High-Level Architecture

```mermaid
flowchart TD
    USER[👤 User/Developer]
    
    AI[🤖 AI Assistant<br/>GitHub Copilot / Claude / Cursor]
    
    ENTRY[📄 Entry Points<br/>.github/copilot-instructions.md<br/>claude.md<br/>.cursorrules]
    
    ORCH[📋 ORCHESTRATOR.md<br/>Main Framework Instructions]
    
    CONFIG[⚙️ Configuration Layer<br/>workflows/ agents/ config/ templates/]
    
    MEMORY[🧠 Memory System<br/>Short-Term: State & Plans<br/>Long-Term: Semantic/Episodic/Procedural]
    
    PROJECT[💻 User Project<br/>src/ tests/ docs/]
    
    USER -->|Requests Task| AI
    AI -->|Reads Instructions| ENTRY
    ENTRY -->|Points To| ORCH
    ORCH -->|Loads Configs| CONFIG
    AI -->|Reads/Updates| MEMORY
    AI -->|Analyzes/Modifies| PROJECT
    AI -->|Delivers Results| USER
    
    style USER fill:#e3f2fd
    style AI fill:#fff9c4
    style ENTRY fill:#f3e5f5
    style ORCH fill:#e8f5e9
    style CONFIG fill:#fff3e0
    style MEMORY fill:#fce4ec
    style PROJECT fill:#e0f2f1
```

### Core Framework Components

```mermaid
flowchart LR
    subgraph WORKFLOWS["📁 Workflows"]
        W1[hotfix-workflow.yaml<br/>30-120min]
        W2[bug-fix-workflow.yaml<br/>45-90min]
        W3[refactor-workflow.yaml<br/>2h-3days]
        W4[feature-workflow.yaml<br/>1-5days]
        W5[agile-two-phase.yaml<br/>weeks-months]
    end
    
    subgraph AGENTS["👥 Agents (9 Specialists)"]
        A1[PM]
        A2[Product Owner]
        A3[Solution Architect]
        A4[Backend Dev]
        A5[Frontend Dev]
        A6[ML Engineer]
        A7[DevOps]
        A8[QA Auto]
        A9[QA Manual]
        A10[Security Expert]
    end
    
    subgraph CONFIGS["⚙️ Configuration"]
        C1[workflow.yaml]
        C2[agents.yaml]
        C3[rules.yaml]
        C4[templates/]
    end
    
    CONFIGS -->|Defines| WORKFLOWS
    CONFIGS -->|Defines| AGENTS
    
    style WORKFLOWS fill:#e8f5e9
    style AGENTS fill:#fff3e0
    style CONFIGS fill:#f3e5f5
```

---

## 🧠 Memory System Architecture

### Three-Tier Cognitive Memory Model

```mermaid
flowchart TB
    AI[🤖 AI Assistant<br/>GitHub Copilot / Claude / Cursor]
    
    subgraph SHORT["⚡ SHORT-TERM MEMORY - Always Loaded (~500 words)"]
        S1[📌 copilot-state.md<br/>Current Context<br/>~200 words]
        S2[✅ action-plan.md<br/>Task Checklist<br/>~300 words]
        S3[🔖 context-anchors.md<br/>Critical Info<br/>~300 words]
        S4[🔔 behavior-triggers.md<br/>Auto Behaviors<br/>~250 words]
    end
    
    AI --> SHORT
    
    subgraph SEMANTIC["📚 SEMANTIC MEMORY - Facts & Knowledge"]
        SEM1[📖 knowledge-base.md<br/>Architecture Decisions<br/>API Contracts<br/>Business Rules]
        SEM2[📝 glossary.md<br/>Domain Terms<br/>Technical Terms<br/>Abbreviations]
    end
    
    subgraph EPISODIC["📅 EPISODIC MEMORY - Agent Experiences"]
        EP1[👔 pm.md<br/>PM Sessions]
        EP2[🏗️ solution-architect.md<br/>Architect Sessions]
        EP3[💻 backend-developer.md<br/>Backend Sessions]
        EP4[🎨 frontend-developer.md<br/>Frontend Sessions]
        EP5[📊 + 5 More Agent Logs]
    end
    
    subgraph PROCEDURAL["🛠️ PROCEDURAL MEMORY - Skills & Patterns"]
        PROC1[⚙️ agent-skills.yaml<br/>Learned Procedures<br/>How-To Knowledge]
        PROC2[👤 user-preferences.yaml<br/>User Work Style<br/>Communication Preferences]
        PROC3[🧩 memory-manager.yaml<br/>Memory System Rules]
    end
    
    AI -->|Gate Transitions| SEMANTIC
    AI -->|Agent Active| EPISODIC
    AI -->|Task Execution| PROCEDURAL
    
    AI -.->|Update After Session| SHORT
    AI -.->|Save Decisions| SEMANTIC
    AI -.->|Log Experiences| EPISODIC
    AI -.->|Learn Patterns| PROCEDURAL
    
    style AI fill:#fff9c4,stroke:#f9a825,stroke-width:3px
    style SHORT fill:#e8f5e9,stroke:#4caf50,stroke-width:2px
    style SEMANTIC fill:#e3f2fd,stroke:#2196f3,stroke-width:2px
    style EPISODIC fill:#f3e5f5,stroke:#9c27b0,stroke-width:2px
    style PROCEDURAL fill:#fce4ec,stroke:#e91e63,stroke-width:2px
```

**Memory Loading Strategy:**
- **GitHub Copilot**: Compact short-term (~500 words), selective long-term (load on-demand)
- **Claude Code**: Auto-load all memory at session start (larger context window)
- **Cursor**: Auto-load all memory at session start (larger context window)

---

## 🔄 Workflow Execution Architecture

```mermaid
stateDiagram-v2
    [*] --> TaskClassification
    
    TaskClassification --> HotfixWorkflow: Emergency<br/>(30-120min)
    TaskClassification --> BugFixWorkflow: Bug<br/>(45-90min)
    TaskClassification --> RefactorWorkflow: Code Quality<br/>(2h-3days)
    TaskClassification --> FeatureWorkflow: Feature<br/>(1-5days)
    TaskClassification --> ProjectWorkflow: New Project<br/>(weeks-months)
    
    state HotfixWorkflow {
        [*] --> HF_Gate1: Analysis
        HF_Gate1 --> HF_Gate2: User Approves
        HF_Gate2 --> HF_Gate3: Fix Complete
        HF_Gate3 --> [*]: Verified
    }
    
    state BugFixWorkflow {
        [*] --> BF_Gate1: Analysis
        BF_Gate1 --> BF_Gate2: User Chooses Fix
        BF_Gate2 --> [*]: Verified
    }
    
    state RefactorWorkflow {
        [*] --> RF_Gate1: Analysis
        RF_Gate1 --> RF_Gate2: User Approves Strategy
        RF_Gate2 --> RF_Gate3: Refactoring
        RF_Gate3 --> [*]: Tests Pass
    }
    
    state FeatureWorkflow {
        [*] --> FT_Gate1: Scoping
        FT_Gate1 --> FT_Gate2: User Approves Scope
        FT_Gate2 --> FT_Gate3: User Chooses Design
        FT_Gate3 --> [*]: Feature Complete
    }
    
    state ProjectWorkflow {
        [*] --> DesignPhase
        DesignPhase --> ExecutionPhase: All Gates Passed
        ExecutionPhase --> [*]: Project Complete
        
        state DesignPhase {
            [*] --> PJ_Gate1: PSA & Epics
            PJ_Gate1 --> PJ_Gate2: User Approves
            PJ_Gate2 --> PJ_Gate3: Stories Detailed
            PJ_Gate3 --> PJ_Gate4: Architecture Options
            PJ_Gate4 --> [*]: Sprint Plan
        }
        
        state ExecutionPhase {
            [*] --> SprintCycle
            SprintCycle --> SprintCycle: Continue Sprints
            SprintCycle --> [*]: All Sprints Done
            
            state SprintCycle {
                [*] --> StoryImplementation
                StoryImplementation --> CodeReviewGate: Dev Complete
                CodeReviewGate --> QAVerificationGate: Pass
                QAVerificationGate --> PMVerificationGate: Pass
                PMVerificationGate --> [*]: Story Done
                
                CodeReviewGate --> StoryImplementation: Fail
                QAVerificationGate --> StoryImplementation: Fail
                PMVerificationGate --> StoryImplementation: Fail
            }
        }
    }
    
    HotfixWorkflow --> [*]
    BugFixWorkflow --> [*]
    RefactorWorkflow --> [*]
    FeatureWorkflow --> [*]
    ProjectWorkflow --> [*]
```

---

## 🎭 Multi-Agent System Architecture

```mermaid
graph TD
    subgraph "Design Phase Agents"
        PM[PM<br/>Coordination]
        PO[Product Owner<br/>Requirements]
        ARCH[Solution Architect<br/>Design Options]
    end
    
    subgraph "Implementation Agents"
        BE[Backend Developer<br/>Server/API/DB]
        FE[Frontend Developer<br/>UI/UX]
        ML[ML Engineer<br/>Data/Models]
        DO[DevOps<br/>Infra/CI/CD]
    end
    
    subgraph "Quality Agents"
        QAA[QA Automation<br/>Test Scripts]
        QAM[QA Manual<br/>Verification]
        SEC[Security Expert<br/>Security Review]
    end
    
    PM -->|Coordinates| PO
    PM -->|Coordinates| ARCH
    PM -->|Coordinates| BE
    PM -->|Coordinates| FE
    PM -->|Coordinates| ML
    PM -->|Coordinates| DO
    PM -->|Coordinates| QAA
    PM -->|Coordinates| QAM
    PM -->|Coordinates| SEC
    
    PO -->|Provides Requirements| ARCH
    ARCH -->|Provides Options| BE
    ARCH -->|Provides Options| FE
    ARCH -->|Provides Options| ML
    ARCH -->|Provides Options| DO
    
    BE -->|Code| QAA
    FE -->|Code| QAA
    ML -->|Code| QAA
    DO -->|Config| QAA
    
    QAA -->|Tests| QAM
    QAM -->|Verified| PM
    
    SEC -->|Reviews| BE
    SEC -->|Reviews| FE
    SEC -->|Reviews| ML
    SEC -->|Reviews| DO
    
    PM -->|Reports| USER[User/Stakeholder]
    USER -->|Approves/Directs| PM
```

**Agent Activation Rules:**
- **Design Phase**: PM, Product Owner, Solution Architect always active
- **Execution Phase**: All agents active as needed
- **Quality Gates**: Different agent reviews code (peer review principle)
- **Security**: Activated for security-sensitive changes

---

## 📦 File System Architecture

```
AutoSDLC/                              # Framework Definition
├── ORCHESTRATOR.md                   # Main instructions
├── ARCHITECTURE.md                   # This file
├── OVERVIEW.md                       # System overview
├── SETUP.md                          # Setup guide
├── README.md                         # Documentation
├── .github/
│   └── copilot-instructions.md       # Copilot entry point
├── claude.md                         # Claude entry point
├── .cursorrules                      # Cursor entry point
├── config/
│   ├── workflow.yaml                 # Workflow selector
│   ├── agents.yaml                   # Agent definitions
│   ├── rules.yaml                    # Quality rules
│   ├── templates-config.yaml         # Template config
│   └── copilot-adaptations.yaml      # Copilot optimizations
├── workflows/
│   ├── hotfix-workflow.yaml          # Emergency fixes
│   ├── bug-fix-workflow.yaml         # Bug fixes
│   ├── refactor-workflow.yaml        # Code quality
│   ├── feature-workflow.yaml         # Feature development
│   └── agile-two-phase.yaml          # New projects
├── agents/
│   ├── pm.yaml                       # Project Manager
│   ├── product-owner.yaml            # Requirements
│   ├── architect.yaml                # Design
│   ├── backend-dev.yaml              # Backend
│   ├── frontend-dev.yaml             # Frontend
│   ├── ml-engineer.yaml              # ML/Data
│   ├── devops.yaml                   # Infrastructure
│   ├── qa-auto.yaml                  # Test automation
│   ├── qa-manual.yaml                # Manual testing
│   └── security-expert.yaml          # Security
├── templates/
│   ├── comprehensive/                # Full templates
│   ├── moderate/                     # Medium templates
│   ├── minimal/                      # Light templates
│   ├── hotfix/                       # Hotfix templates
│   ├── security/                     # Security templates
│   └── session-context/              # Context templates
└── init/
    └── .AutoSDLC/                     # Initial state structure

.AutoSDLC/                             # State & Memory (Created at runtime)
├── status.yaml                       # Workflow state
├── session-context.md                # Session summary
├── copilot-state.md                  # Current context (Copilot)
├── action-plan.md                    # Task checklist (Copilot)
├── context-anchors.md                # Critical info (Copilot)
├── behavior-triggers.md              # Auto behaviors (Copilot)
└── memory/
    ├── semantic/
    │   ├── knowledge-base.md         # Project facts
    │   └── glossary.md               # Terminology
    ├── episodic/
    │   ├── pm.md                     # PM experiences
    │   ├── solution-architect.md     # Architect experiences
    │   ├── backend-developer.md      # Backend experiences
    │   ├── frontend-developer.md     # Frontend experiences
    │   ├── ml-engineer.md            # ML experiences
    │   ├── devops.md                 # DevOps experiences
    │   ├── qa-automation.md          # QA Auto experiences
    │   ├── qa-manual.md              # QA Manual experiences
    │   └── security-expert.md        # Security experiences
    └── procedural/
        ├── agent-skills.yaml         # Learned procedures
        ├── user-preferences.yaml     # User work style
        └── memory-manager.yaml       # Memory system config
```

---

## 🔀 Information Flow Architecture

```mermaid
sequenceDiagram
    participant U as User
    participant AI as AI Assistant
    participant EP as Entry Point
    participant ORCH as Orchestrator
    participant MEM as Memory System
    participant WF as Workflow
    participant AG as Agent
    participant CODE as User Code
    
    U->>AI: Request/Question
    AI->>EP: Load Instructions
    EP->>ORCH: Follow Main Orchestrator
    ORCH->>MEM: Load Short-Term Memory
    MEM-->>ORCH: copilot-state.md, action-plan.md
    ORCH->>MEM: Load Long-Term Memory (selective)
    MEM-->>ORCH: Relevant memories
    ORCH->>WF: Select Workflow
    WF-->>ORCH: Workflow Config
    ORCH->>AG: Activate Agent
    AG-->>ORCH: Agent Config
    ORCH->>CODE: Analyze/Modify
    CODE-->>ORCH: Code Context
    ORCH->>MEM: Update State & Memory
    ORCH->>U: Response/Results
    
    loop Continue Session
        U->>AI: "continue"
        AI->>MEM: Read action-plan.md
        MEM-->>AI: Next task
        AI->>CODE: Execute task
        CODE-->>AI: Results
        AI->>MEM: Update progress
        AI->>U: Task complete
    end
    
    Note over AI,MEM: End of Session
    AI->>MEM: Update copilot-state.md
    AI->>MEM: Update episodic memory
    AI->>MEM: Update procedural memory
```

---

## 🛠️ Tool Compatibility Architecture

```mermaid
graph TB
    subgraph "Universal Core"
        CORE[AutoSDLC Framework<br/>ORCHESTRATOR.md<br/>Config YAMLs<br/>Agent YAMLs<br/>Workflows]
        
        MEM[Memory System<br/>Semantic/Episodic/Procedural<br/>Universal Format]
    end
    
    subgraph "Tool-Specific Adaptations"
        subgraph "GitHub Copilot"
            GH_EP[.github/copilot-instructions.md]
            GH_STATE[Compact State Files<br/>~500 words total]
            GH_LOAD[On-Demand Loading<br/>Selective Memory]
            GH_BEHAVIOR[Explicit Behaviors<br/>action-plan.md]
        end
        
        subgraph "Claude Code"
            CL_EP[claude.md]
            CL_LOAD[Auto-Load All Memory<br/>Full Context]
            CL_BEHAVIOR[Proactive Actions<br/>Autonomous]
        end
        
        subgraph "Cursor"
            CR_EP[.cursorrules]
            CR_LOAD[Auto-Load All Memory<br/>Full Context]
            CR_BEHAVIOR[Proactive Actions<br/>Autonomous]
        end
    end
    
    CORE --> GH_EP
    CORE --> CL_EP
    CORE --> CR_EP
    
    MEM --> GH_STATE
    MEM --> CL_LOAD
    MEM --> CR_LOAD
    
    GH_EP --> GH_LOAD
    GH_EP --> GH_BEHAVIOR
    CL_EP --> CL_LOAD
    CL_EP --> CL_BEHAVIOR
    CR_EP --> CR_LOAD
    CR_EP --> CR_BEHAVIOR
    
    GH_STATE --> AI1[GitHub Copilot]
    GH_LOAD --> AI1
    GH_BEHAVIOR --> AI1
    
    CL_LOAD --> AI2[Claude Code]
    CL_BEHAVIOR --> AI2
    
    CR_LOAD --> AI3[Cursor]
    CR_BEHAVIOR --> AI3
```

**Key Design Principles:**
1. **Single Source of Truth**: One memory system, multiple access patterns
2. **Tool-Specific Entry Points**: Different files, same core framework
3. **Graceful Degradation**: Works with varying context window sizes
4. **Universal Compatibility**: No tool-specific memory formats

---

## 🔐 Quality Gate Architecture

```mermaid
graph LR
    subgraph "Story Implementation"
        DEV[Developer<br/>Implements Code]
    end
    
    DEV --> G1
    
    subgraph "Gate 1: Peer Review"
        G1{Code Review}
        G1_CHECK[Different Agent Reviews<br/>No Stubs/TODOs<br/>Tests Exist<br/>Code Quality]
    end
    
    G1 -->|Pass| G2
    G1 -->|Fail| REJECT1[REJECT<br/>Back to Dev]
    REJECT1 --> DEV
    
    subgraph "Gate 2: QA Verification"
        G2{QA Testing}
        G2_CHECK[QA Agent Tests<br/>All Tests Pass<br/>Manual Verification<br/>Acceptance Criteria]
    end
    
    G2 -->|Pass| G3
    G2 -->|Fail| REJECT2[REJECT<br/>Back to Dev]
    REJECT2 --> DEV
    
    subgraph "Gate 3: PM Verification"
        G3{PM Check}
        G3_CHECK[PM Spot-Checks<br/>Verifies Reports<br/>Definition of Done<br/>Updates Status]
    end
    
    G3 -->|Pass| DONE[Story Complete ✅]
    G3 -->|Fail| REJECT3[REJECT<br/>Back to Dev]
    REJECT3 --> DEV
```

**Gate Enforcement Rules:**
- No gate can be skipped
- Each gate requires explicit pass from designated agent
- Failed gates send work back to developer
- User approval NOT required for story-level gates (only workflow gates)
- All three gates must pass before story marked complete

---

## 📊 State Management Architecture

```mermaid
graph TD
    subgraph "Session Lifecycle"
        START[Session Start]
        WORK[Active Work]
        END[Session End]
    end
    
    subgraph "State Files"
        STATUS[status.yaml<br/>phase, gate, agent]
        CONTEXT[session-context.md<br/>summary, decisions]
        COPILOT[copilot-state.md<br/>current task]
        PLAN[action-plan.md<br/>checklist]
    end
    
    subgraph "Memory Updates"
        EPISODIC[episodic/{agent}.md<br/>learnings]
        SEMANTIC[knowledge-base.md<br/>decisions]
        PROCEDURAL[agent-skills.yaml<br/>patterns]
    end
    
    START -->|Load| STATUS
    START -->|Load| CONTEXT
    START -->|Load| COPILOT
    START -->|Load| PLAN
    
    STATUS --> WORK
    CONTEXT --> WORK
    COPILOT --> WORK
    PLAN --> WORK
    
    WORK -->|Update| STATUS
    WORK -->|Update| CONTEXT
    WORK -->|Update| COPILOT
    WORK -->|Update| PLAN
    
    END -->|Save| STATUS
    END -->|Save| CONTEXT
    END -->|Save| COPILOT
    END -->|Save| PLAN
    END -->|Append| EPISODIC
    END -->|Update If Decision| SEMANTIC
    END -->|Update If Pattern| PROCEDURAL
```

---

## 🎯 Design Principles

### 1. **Prompt Engineering, Not Software**
- Framework is text files (YAML + Markdown)
- AI reads configs and role-plays agents
- No compilation, no dependencies, no execution code

### 2. **Tool Agnostic Core**
- Universal memory system
- Tool-specific entry points
- Same methodology across all AI assistants

### 3. **User Authority**
- AI proposes OPTIONS, user decides
- Explicit approvals required at gates
- No autonomous decisions on architecture

### 4. **Quality Gates**
- Multi-gate story completion
- Peer review principle (different agent reviews)
- No incomplete work passes gates

### 5. **Memory Preservation**
- Short-term state for current context
- Long-term memory for continuity
- Semantic/Episodic/Procedural separation

### 6. **Scalable Complexity**
- Bug fix: 45 min, 2 gates, 3 agents
- New project: weeks, 4 gates, 9 agents
- Same framework, different workflows

### 7. **Session Continuity**
- Status files maintain workflow position
- Memory files preserve learnings
- Resume work across sessions

---

## 🔄 Extension Points

The architecture supports extension at multiple levels:

### New Workflows
Add `workflows/{name}-workflow.yaml` with custom phases and gates

### New Agents
Add `agents/{name}.yaml` with agent personality and responsibilities

### New Templates
Add `templates/{category}/{name}.template.md` for custom documents

### New Memory Types
Add new memory files under `.AutoSDLC/memory/` (system auto-discovers)

### Tool-Specific Optimizations
Add `config/{tool}-adaptations.yaml` for tool-specific settings

---

## 📈 Scalability Characteristics

| Aspect | Small Task | Large Task | Strategy |
|--------|-----------|-----------|----------|
| **Memory** | ~1KB state | ~50KB memory | On-demand loading |
| **Agents** | 3 active | 9 active | Selective activation |
| **Gates** | 2 gates | 4+ gates | Workflow-dependent |
| **Duration** | 45 min | Weeks | Task classification |
| **Autonomy** | Low (user decides) | High (agents work) | Phase-dependent |
| **Context** | Focused | Broad | Memory system |

---

## 🧪 Testing & Validation

The framework is self-validating:

1. **Config Validation**: AI reads YAML, catches syntax errors
2. **Gate Enforcement**: Rules.yaml enforces quality standards
3. **Memory Integrity**: Memory-manager.yaml defines access rules
4. **Cross-Session Validation**: Status files verify continuity
5. **Multi-Agent Coordination**: PM validates agent interactions

---

## 🎓 Learning Resources

- **ORCHESTRATOR.md**: Main instructions for AI assistants
- **OVERVIEW.md**: System overview and concepts
- **WORKFLOW-VISUAL-GUIDE.md**: Visual workflow diagrams
- **SETUP.md**: Installation and setup guide
- **COPILOT-SETUP.md**: GitHub Copilot specific guide
- **README.md**: Quick start and examples

---

**This architecture enables:**
- ✅ Multi-agent coordination without specialized software
- ✅ Memory preservation across sessions
- ✅ Tool-agnostic framework (Copilot/Claude/Cursor)
- ✅ Quality enforcement through gates
- ✅ User authority over all decisions
- ✅ Scalable from 45-minute bugs to months-long projects
