# AutoSDLC Visual Workflow Guide

Visual diagrams and decision trees to help you choose and understand workflows.

**Key Innovation**: AutoSDLC includes a 3-tier memory system (semantic/episodic/procedural) that preserves context and learnings across sessions. See ARCHITECTURE.md for detailed system design.

---

## 🎯 Workflow Selection Decision Tree

```mermaid
flowchart TD
    START([Start AutoSDLC])
    NEED{What do you need?}
    
    FIX[Need to fix<br/>something?]
    ADD[Need to add<br/>something?]
    NEW[Need to start<br/>something new?]
    
    BROKEN{Is it broken?}
    EXISTS{Does it exist?}
    SCOPE{How big is<br/>the scope?}
    
    START --> NEED
    NEED --> FIX
    NEED --> ADD
    NEED --> NEW
    
    FIX --> BROKEN
    ADD --> EXISTS
    NEW --> SCOPE
    
    BROKEN -->|YES<br/>Bug?| BUG[🐛 BUG FIX<br/>2 gates<br/>45-90m]
    BROKEN -->|NO<br/>Code Quality?| REFAC1[🔄 REFACTOR<br/>3 gates<br/>2h-3d]
    
    EXISTS -->|YES<br/>Refactor| REFAC2[🔄 REFACTOR<br/>3 gates<br/>2h-3d]
    EXISTS -->|NO<br/>Feature| FEAT1[✨ FEATURE<br/>3 gates<br/>1-5d]
    
    SCOPE -->|Feature<br/>&lt;1 week| FEAT2[✨ FEATURE<br/>3 gates<br/>1-5d]
    SCOPE -->|Full System<br/>weeks| PROJ[🚀 PROJECT<br/>4 gates<br/>weeks]
    
    style START fill:#2196F3,stroke:#1565C0,stroke-width:3px,color:#fff
    style NEED fill:#FFC107,stroke:#F57C00,stroke-width:2px,color:#000
    style BUG fill:#EF5350,stroke:#C62828,stroke-width:2px,color:#fff
    style REFAC1 fill:#FFA726,stroke:#E65100,stroke-width:2px,color:#000
    style REFAC2 fill:#FFA726,stroke:#E65100,stroke-width:2px,color:#000
    style FEAT1 fill:#66BB6A,stroke:#2E7D32,stroke-width:2px,color:#fff
    style FEAT2 fill:#66BB6A,stroke:#2E7D32,stroke-width:2px,color:#fff
    style PROJ fill:#9C27B0,stroke:#6A1B9A,stroke-width:2px,color:#fff
```

---

## 📊 Workflow Comparison Matrix

| Aspect | 🐛 Bug Fix | 🔄 Refactor | ✨ Feature | 🚀 Project |
|--------|-----------|------------|-----------|-----------|
| **Gates** | 2 | 3 | 3 | 4 |
| **Timeline** | 45-90m | 2h-3d | 1-5d | weeks |
| **Agents** | 3 | 3 | 5 | 9 |
| **Code Analysis** | Deep | V.Deep | Deep | Basic |
| **Architecture** | No | No | Yes | Yes |
| **User Control** | High | High | High | High |
| **Autonomy** | Low | Medium | Medium | High |
| **Risk Level** | Low | Medium | Medium | High |
| **Scope** | Minimal | Focused | Bounded | Full |
| **New Features** | ❌ | ❌ | ✅ | ✅ |
| **Code Changes** | Minimal | Major | Major | Major |
| **Tests** | Add 1 | Maintain | Add New | Full |

**Legend:**
- **V.Deep** = Very Deep analysis of code structure
- **Deep** = Thorough analysis of specific area
- **Basic** = High-level understanding sufficient

---

## 🔄 Gate Progression Diagrams

### Bug Fix Workflow (2 Gates)

```mermaid
flowchart LR
    START([START])
    G1[Gate 1: Analysis<br/>15-30m]
    G2[Gate 2: Fix & Verify<br/>30-60m]
    DONE([✅ DONE])
    
    START --> G1
    G1 -->|Find root cause<br/>Present 3 options<br/>User chooses| G2
    G2 -->|Implement fix<br/>QA verifies<br/>All tests pass| DONE
    
    style START fill:#2196F3,stroke:#1565C0,stroke-width:3px,color:#fff
    style G1 fill:#FFC107,stroke:#F57C00,stroke-width:2px,color:#000
    style G2 fill:#FF9800,stroke:#E65100,stroke-width:2px,color:#000
    style DONE fill:#4CAF50,stroke:#2E7D32,stroke-width:3px,color:#fff
```

**Timeline:** 45-90 minutes

---

### Refactor Workflow (3 Gates)

```mermaid
flowchart LR
    START([START])
    G1[Gate 1: Analysis<br/>1-2h]
    G2[Gate 2: Strategy<br/>1-2h]
    G3[Gate 3: Refactor<br/>varies]
    DONE([✅ DONE])
    
    START --> G1
    G1 -->|Code smell analysis<br/>Tech debt report<br/>Metrics & impact| G2
    G2 -->|Present approaches<br/>User chooses<br/>Detailed plan| G3
    G3 -->|Small commits<br/>Tests pass continuously<br/>No behavior change| DONE
    
    style START fill:#2196F3,stroke:#1565C0,stroke-width:3px,color:#fff
    style G1 fill:#FFC107,stroke:#F57C00,stroke-width:2px,color:#000
    style G2 fill:#FF9800,stroke:#E65100,stroke-width:2px,color:#000
    style G3 fill:#FFA726,stroke:#EF6C00,stroke-width:2px,color:#000
    style DONE fill:#4CAF50,stroke:#2E7D32,stroke-width:3px,color:#fff
```

**Timeline:** 2h - 3 days

---

### Feature Workflow (3 Gates)

```mermaid
flowchart LR
    START([START])
    G1[Gate 1: Scoping<br/>2h]
    G2[Gate 2: Design<br/>2h]
    G3[Gate 3: Build<br/>1-3d]
    DONE([✅ DONE])
    
    START --> G1
    G1 -->|Discuss feature<br/>Explore codebase<br/>User approves scope| G2
    G2 -->|Present options<br/>User chooses<br/>Integration plan| G3
    G3 -->|Implement stories<br/>Quality gates<br/>Demo to user| DONE
    
    style START fill:#2196F3,stroke:#1565C0,stroke-width:3px,color:#fff
    style G1 fill:#FFC107,stroke:#F57C00,stroke-width:2px,color:#000
    style G2 fill:#FF9800,stroke:#E65100,stroke-width:2px,color:#000
    style G3 fill:#FFA726,stroke:#EF6C00,stroke-width:2px,color:#000
    style DONE fill:#4CAF50,stroke:#2E7D32,stroke-width:3px,color:#fff
```

**Timeline:** 1-5 days

---

### Project Workflow (4 Gates + Execution)

```mermaid
flowchart LR
    START([START])
    
    subgraph DESIGN["PHASE 1: DESIGN"]
        G1[G1: PSA<br/>1d]
        G2[G2: Stories<br/>2d]
        G3[G3: Architecture<br/>2d]
        G4[G4: Sprint Plan<br/>1d]
    end
    
    subgraph EXEC["PHASE 2: EXECUTION"]
        BUILD[Autonomous Build<br/>weeks]
    end
    
    DONE([✅ DONE])
    
    START --> G1
    G1 -->|Create PSA<br/>Epics list<br/>User OK| G2
    G2 -->|Detail stories<br/>User OK| G3
    G3 -->|Present options<br/>User OK| G4
    G4 -->|Sprint plan<br/>User OK| BUILD
    BUILD -->|All 9 agents<br/>work together<br/>Sprint reviews| DONE
    
    style START fill:#2196F3,stroke:#1565C0,stroke-width:3px,color:#fff
    style G1 fill:#FFC107,stroke:#F57C00,stroke-width:2px,color:#000
    style G2 fill:#FF9800,stroke:#E65100,stroke-width:2px,color:#000
    style G3 fill:#FFA726,stroke:#EF6C00,stroke-width:2px,color:#000
    style G4 fill:#FFB74D,stroke:#F57C00,stroke-width:2px,color:#000
    style BUILD fill:#9C27B0,stroke:#6A1B9A,stroke-width:2px,color:#fff
    style DONE fill:#4CAF50,stroke:#2E7D32,stroke-width:3px,color:#fff
```

**Timeline:** weeks - months

---

## 🎭 Agent Involvement by Workflow

<table style="background-color: #1a1a1a; color: white; width: 100%; border-collapse: collapse;">
  <thead>
    <tr style="background-color: #2d2d2d;">
      <th style="padding: 12px; text-align: left; border: 1px solid #404040;">Agent</th>
      <th style="padding: 12px; text-align: center; border: 1px solid #404040;">🐛 Bug Fix</th>
      <th style="padding: 12px; text-align: center; border: 1px solid #404040;">🔄 Refactor</th>
      <th style="padding: 12px; text-align: center; border: 1px solid #404040;">✨ Feature</th>
      <th style="padding: 12px; text-align: center; border: 1px solid #404040;">🚀 Project</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="padding: 12px; border: 1px solid #404040;">PM</td>
      <td style="padding: 12px; text-align: center; background-color: #404040; border: 1px solid #404040;">—</td>
      <td style="padding: 12px; text-align: center; background-color: #4CAF50; border: 1px solid #404040;">✓</td>
      <td style="padding: 12px; text-align: center; background-color: #4CAF50; border: 1px solid #404040;">✓</td>
      <td style="padding: 12px; text-align: center; background-color: #4CAF50; border: 1px solid #404040;">✓</td>
    </tr>
    <tr>
      <td style="padding: 12px; border: 1px solid #404040;">Product Owner</td>
      <td style="padding: 12px; text-align: center; background-color: #404040; border: 1px solid #404040;">—</td>
      <td style="padding: 12px; text-align: center; background-color: #404040; border: 1px solid #404040;">—</td>
      <td style="padding: 12px; text-align: center; background-color: #4CAF50; border: 1px solid #404040;">✓</td>
      <td style="padding: 12px; text-align: center; background-color: #4CAF50; border: 1px solid #404040;">✓</td>
    </tr>
    <tr>
      <td style="padding: 12px; border: 1px solid #404040;">Solution Architect</td>
      <td style="padding: 12px; text-align: center; background-color: #4CAF50; border: 1px solid #404040;">✓</td>
      <td style="padding: 12px; text-align: center; background-color: #4CAF50; border: 1px solid #404040;">✓</td>
      <td style="padding: 12px; text-align: center; background-color: #4CAF50; border: 1px solid #404040;">✓</td>
      <td style="padding: 12px; text-align: center; background-color: #4CAF50; border: 1px solid #404040;">✓</td>
    </tr>
    <tr>
      <td style="padding: 12px; border: 1px solid #404040;">Backend Developer</td>
      <td style="padding: 12px; text-align: center; background-color: #4CAF50; border: 1px solid #404040;">✓</td>
      <td style="padding: 12px; text-align: center; background-color: #4CAF50; border: 1px solid #404040;">✓</td>
      <td style="padding: 12px; text-align: center; background-color: #4CAF50; border: 1px solid #404040;">✓</td>
      <td style="padding: 12px; text-align: center; background-color: #4CAF50; border: 1px solid #404040;">✓</td>
    </tr>
    <tr>
      <td style="padding: 12px; border: 1px solid #404040;">Frontend Developer</td>
      <td style="padding: 12px; text-align: center; background-color: #4CAF50; border: 1px solid #404040;">✓</td>
      <td style="padding: 12px; text-align: center; background-color: #4CAF50; border: 1px solid #404040;">✓</td>
      <td style="padding: 12px; text-align: center; background-color: #4CAF50; border: 1px solid #404040;">✓</td>
      <td style="padding: 12px; text-align: center; background-color: #4CAF50; border: 1px solid #404040;">✓</td>
    </tr>
    <tr>
      <td style="padding: 12px; border: 1px solid #404040;">ML Engineer</td>
      <td style="padding: 12px; text-align: center; background-color: #404040; border: 1px solid #404040;">—</td>
      <td style="padding: 12px; text-align: center; background-color: #404040; border: 1px solid #404040;">—</td>
      <td style="padding: 12px; text-align: center; background-color: #FFC107; border: 1px solid #404040;">◐</td>
      <td style="padding: 12px; text-align: center; background-color: #4CAF50; border: 1px solid #404040;">✓</td>
    </tr>
    <tr>
      <td style="padding: 12px; border: 1px solid #404040;">DevOps Engineer</td>
      <td style="padding: 12px; text-align: center; background-color: #404040; border: 1px solid #404040;">—</td>
      <td style="padding: 12px; text-align: center; background-color: #404040; border: 1px solid #404040;">—</td>
      <td style="padding: 12px; text-align: center; background-color: #404040; border: 1px solid #404040;">—</td>
      <td style="padding: 12px; text-align: center; background-color: #4CAF50; border: 1px solid #404040;">✓</td>
    </tr>
    <tr>
      <td style="padding: 12px; border: 1px solid #404040;">QA Automation</td>
      <td style="padding: 12px; text-align: center; background-color: #4CAF50; border: 1px solid #404040;">✓</td>
      <td style="padding: 12px; text-align: center; background-color: #4CAF50; border: 1px solid #404040;">✓</td>
      <td style="padding: 12px; text-align: center; background-color: #4CAF50; border: 1px solid #404040;">✓</td>
      <td style="padding: 12px; text-align: center; background-color: #4CAF50; border: 1px solid #404040;">✓</td>
    </tr>
    <tr>
      <td style="padding: 12px; border: 1px solid #404040;">QA Manual</td>
      <td style="padding: 12px; text-align: center; background-color: #FFC107; border: 1px solid #404040;">◐</td>
      <td style="padding: 12px; text-align: center; background-color: #FFC107; border: 1px solid #404040;">◐</td>
      <td style="padding: 12px; text-align: center; background-color: #4CAF50; border: 1px solid #404040;">✓</td>
      <td style="padding: 12px; text-align: center; background-color: #4CAF50; border: 1px solid #404040;">✓</td>
    </tr>
  </tbody>
</table>

**Legend:**
- **🟢 Green (✓)** = Fully active - Agent is core to workflow
- **🟡 Yellow (◐)** = Sometimes active - Agent involved depending on context
- **⚫ Gray (—)** = Not involved - Agent not used in this workflow

---

## 🚦 Quality Gate Flow

All workflows enforce quality through multiple checkpoints:

---

## 🚦 Three-Gate Quality System (Mermaid)

```mermaid
flowchart LR
    DEV[Developer<br/>Implements Code]
    
    subgraph G1["Gate 1: Peer Review"]
        direction TB
        R1[Different Agent Reviews]
        R2[No Stubs/TODOs]
        R3[Tests Exist]
        R4[Code Quality]
    end
    
    subgraph G2["Gate 2: QA Verification"]
        direction TB
        Q1[Run All Tests]
        Q2[Manual Testing]
        Q3[Acceptance Criteria]
        Q4[Edge Cases]
    end
    
    subgraph G3["Gate 3: PM Verification"]
        direction TB
        P1[Spot-Check Code]
        P2[Verify Reports]
        P3[Definition of Done]
        P4[Update Status]
    end
    
    DEV --> G1
    G1 -->|Pass| G2
    G1 -->|Fail| REJECT1[❌ REJECT<br/>Back to Dev]
    REJECT1 --> DEV
    
    G2 -->|Pass| G3
    G2 -->|Fail| REJECT2[❌ REJECT<br/>Back to Dev]
    REJECT2 --> DEV
    
    G3 -->|Pass| DONE[✅ Story Complete]
    G3 -->|Fail| REJECT3[❌ REJECT<br/>Back to Dev]
    REJECT3 --> DEV
    
    style DEV fill:#2196F3,stroke:#1565C0,stroke-width:3px,color:#fff
    style G1 fill:#FFC107,stroke:#F57C00,stroke-width:3px,color:#000
    style G2 fill:#FF9800,stroke:#E65100,stroke-width:3px,color:#000
    style G3 fill:#FFA726,stroke:#EF6C00,stroke-width:3px,color:#000
    style DONE fill:#4CAF50,stroke:#2E7D32,stroke-width:3px,color:#fff
    style REJECT1 fill:#EF5350,stroke:#C62828,stroke-width:3px,color:#fff
    style REJECT2 fill:#EF5350,stroke:#C62828,stroke-width:3px,color:#fff
    style REJECT3 fill:#EF5350,stroke:#C62828,stroke-width:3px,color:#fff
```

---

## 📈 Complexity vs. Time Investment

```mermaid
quadrantChart
    title Workflow Complexity vs Time Investment
    x-axis Low Time Investment --> High Time Investment
    y-axis Low Complexity --> High Complexity
    quadrant-1 Future Features
    quadrant-2 Major Projects
    quadrant-3 Quick Wins
    quadrant-4 Improvements
    Bug Fix: [0.15, 0.25]
    Hotfix: [0.10, 0.30]
    Refactor: [0.45, 0.55]
    Feature: [0.60, 0.65]
    Project: [0.85, 0.90]
```

**Time Scale:**
- **45m-90m**: Bug Fix, Hotfix
- **2h-4h**: Small Refactors
- **1d-2d**: Feature Scoping
- **1w**: Feature Implementation
- **2w+**: Full Projects

---

## 🧠 Memory Access Pattern

```mermaid
flowchart TD
    START([Session Start])
    
    subgraph ALWAYS["Always Load (Short-Term)"]
        ST1[copilot-state.md<br/>Current Context]
        ST2[action-plan.md<br/>Task Checklist]
    end
    
    subgraph ONDEMAND["On-Demand (Long-Term)"]
        direction TB
        
        subgraph SEM["Semantic Memory"]
            S1[knowledge-base.md]
            S2[glossary.md]
        end
        
        subgraph EPI["Episodic Memory"]
            E1[pm.md]
            E2[architect.md]
            E3[developer.md]
            E4[qa.md]
        end
        
        subgraph PROC["Procedural Memory"]
            P1[agent-skills.yaml]
            P2[user-preferences.yaml]
        end
    end
    
    START --> ST1
    START --> ST2
    
    ST1 -->|Need Architecture?| S1
    ST1 -->|Need Terminology?| S2
    ST1 -->|PM Active?| E1
    ST1 -->|Architect Active?| E2
    ST1 -->|Developer Active?| E3
    ST1 -->|QA Active?| E4
    ST2 -->|Need How-To?| P1
    ST2 -->|Need Preferences?| P2
    
    S1 --> WORK([Execute Work])
    S2 --> WORK
    E1 --> WORK
    E2 --> WORK
    E3 --> WORK
    E4 --> WORK
    P1 --> WORK
    P2 --> WORK
    
    WORK --> UPDATE([Update All Memories])
    UPDATE --> END([Session End])
    
    style ALWAYS fill:#4CAF50,stroke:#2E7D32,stroke-width:3px,color:#fff
    style ONDEMAND fill:#FFC107,stroke:#F57C00,stroke-width:3px,color:#000
    style SEM fill:#2196F3,stroke:#1565C0,stroke-width:2px,color:#fff
    style EPI fill:#9C27B0,stroke:#6A1B9A,stroke-width:2px,color:#fff
    style PROC fill:#E91E63,stroke:#C2185B,stroke-width:2px,color:#fff
```

---

## 🎯 When To Use Each Workflow

```mermaid
flowchart TD
    Q1{What's the situation?}
    
    BROKEN["Something is BROKEN<br/>• App crashes<br/>• Feature doesn't work<br/>• Wrong behavior<br/>• Security vulnerability"]
    MESSY["Code works but is MESSY<br/>• Too complex<br/>• Hard to maintain<br/>• Duplicate code<br/>• Tech debt<br/>• Poor structure"]
    ADD["Need to ADD something<br/>• New capability<br/>• Enhancement<br/>• Integration<br/>• Optimization"]
    SCRATCH["Starting from SCRATCH<br/>• New application<br/>• New system<br/>• Multiple features<br/>• Full architecture needed"]
    
    BUG[🐛 BUG FIX WORKFLOW]
    REFACTOR[🔄 REFACTOR WORKFLOW]
    FEATURE[✨ FEATURE WORKFLOW]
    PROJECT[🚀 PROJECT WORKFLOW]
    
    Q1 --> BROKEN
    Q1 --> MESSY
    Q1 --> ADD
    Q1 --> SCRATCH
    
    BROKEN --> BUG
    MESSY --> REFACTOR
    ADD --> FEATURE
    SCRATCH --> PROJECT
    
    style BROKEN fill:#FFCDD2,stroke:#C62828,stroke-width:2px,color:#000
    style MESSY fill:#FFE0B2,stroke:#E65100,stroke-width:2px,color:#000
    style ADD fill:#C8E6C9,stroke:#2E7D32,stroke-width:2px,color:#000
    style SCRATCH fill:#E1BEE7,stroke:#6A1B9A,stroke-width:2px,color:#000
    style BUG fill:#EF5350,stroke:#C62828,stroke-width:3px,color:#fff
    style REFACTOR fill:#FFA726,stroke:#E65100,stroke-width:3px,color:#000
    style FEATURE fill:#66BB6A,stroke:#2E7D32,stroke-width:3px,color:#fff
    style PROJECT fill:#9C27B0,stroke:#6A1B9A,stroke-width:3px,color:#fff
```

---

## 🔀 Workflow Transitions

You can switch workflows if the task evolves:

```mermaid
flowchart TD
    BUG[🐛 Bug Fix]
    REFACTOR[🔄 Refactor]
    FEATURE[✨ Feature]
    PROJECT[🚀 Project]
    
    BUG -->|Needs new capability| FEATURE
    BUG -->|Root cause is<br/>poor structure| REFACTOR
    
    REFACTOR -->|Missing capability<br/>discovered| FEATURE
    
    FEATURE -->|Scope grew to<br/>multi-feature system| PROJECT
    
    BUG -.->|PM escalates| USER1[User Approves<br/>Transition]
    REFACTOR -.->|PM presents| USER2[User Approves<br/>Transition]
    FEATURE -.->|PM shows impact| USER3[User Approves<br/>Transition]
    
    USER1 -.-> FEATURE
    USER1 -.-> REFACTOR
    USER2 -.-> FEATURE
    USER3 -.-> PROJECT
    
    style BUG fill:#EF5350,stroke:#C62828,stroke-width:2px,color:#fff
    style REFACTOR fill:#FFA726,stroke:#E65100,stroke-width:2px,color:#000
    style FEATURE fill:#66BB6A,stroke:#2E7D32,stroke-width:2px,color:#fff
    style PROJECT fill:#9C27B0,stroke:#6A1B9A,stroke-width:2px,color:#fff
    style USER1 fill:#FFC107,stroke:#F57C00,stroke-width:2px,color:#000
    style USER2 fill:#FFC107,stroke:#F57C00,stroke-width:2px,color:#000
    style USER3 fill:#FFC107,stroke:#F57C00,stroke-width:2px,color:#000
```

**All transitions require user approval**

---

## 📋 Workflow Selection Checklist

Before starting, ask yourself:

```mermaid
flowchart TD
    START([Start: Choose Workflow])
    
    Q1{Does something<br/>not work correctly?}
    Q2{Does code work but<br/>need structural<br/>improvement?}
    Q3{Am I adding new<br/>behavior to<br/>existing system?}
    Q4{Am I building<br/>something new<br/>from scratch?}
    UNSURE{Not sure?}
    
    BUG[✅ Bug Fix Workflow]
    REFACTOR[✅ Refactor Workflow]
    FEATURE[✅ Feature Workflow]
    PROJECT[✅ Project Workflow]
    PM[Let PM analyze<br/>and suggest workflow]
    
    START --> Q1
    Q1 -->|YES| BUG
    Q1 -->|NO| Q2
    Q2 -->|YES| REFACTOR
    Q2 -->|NO| Q3
    Q3 -->|YES| FEATURE
    Q3 -->|NO| Q4
    Q4 -->|YES| PROJECT
    Q4 -->|NO| UNSURE
    UNSURE --> PM
    
    style BUG fill:#4CAF50,stroke:#2E7D32,stroke-width:2px,color:#fff
    style REFACTOR fill:#4CAF50,stroke:#2E7D32,stroke-width:2px,color:#fff
    style FEATURE fill:#4CAF50,stroke:#2E7D32,stroke-width:2px,color:#fff
    style PROJECT fill:#4CAF50,stroke:#2E7D32,stroke-width:2px,color:#fff
    style PM fill:#FFC107,stroke:#F57C00,stroke-width:2px,color:#000
```

---

## 🎓 Learning Curve

```mermaid
%%{init: {'theme':'base', 'themeVariables': {'primaryColor':'#e3f2fd'}}}%%
journey
    title AutoSDLC Learning Curve
    section Easiest
      Bug Fix: 2: Quick, Focused
    section Easy
      Refactor: 4: Code Quality
    section Moderate
      Feature: 6: Design Thinking
    section Advanced
      Project: 9: Full System
```

**Why this progression?**
- **🐛 Bug Fix**: Focused scope, clear objective, quick resolution
- **🔄 Refactor**: Requires understanding "good code" principles
- **✨ Feature**: Needs design thinking, integration analysis
- **🚀 Project**: Requires full system design, long-term planning

---

**Use these diagrams to:**
- Choose the right workflow for your task
- Understand the process before starting
- Explain AutoSDLC to your team
- Train new users on workflow selection

---

**For detailed architecture and system design, see ARCHITECTURE.md**

---

## 📊 Complete Workflow State Diagram (Mermaid)

```mermaid
stateDiagram-v2
    [*] --> LoadMemory: Session Start
    LoadMemory --> TaskClassification: Context Loaded
    
    TaskClassification --> Hotfix: Emergency
    TaskClassification --> BugFix: Bug
    TaskClassification --> Refactor: Code Quality
    TaskClassification --> Feature: Enhancement
    TaskClassification --> Project: New System
    
    state Hotfix {
        [*] --> HF_G1: Analysis
        HF_G1 --> HF_G2: Approve
        HF_G2 --> HF_G3: Fix
        HF_G3 --> [*]: Verify
    }
    
    state BugFix {
        [*] --> BF_G1: Analyze
        BF_G1 --> BF_G2: Choose Fix
        BF_G2 --> [*]: Verify
    }
    
    state Refactor {
        [*] --> RF_G1: Analyze
        RF_G1 --> RF_G2: Strategy
        RF_G2 --> RF_G3: Execute
        RF_G3 --> [*]: Tests Pass
    }
    
    state Feature {
        [*] --> FT_G1: Scope
        FT_G1 --> FT_G2: Design
        FT_G2 --> FT_G3: Build
        FT_G3 --> [*]: Complete
    }
    
    state Project {
        [*] --> DesignPhase
        
        state DesignPhase {
            [*] --> PJ_G1: PSA
            PJ_G1 --> PJ_G2: Stories
            PJ_G2 --> PJ_G3: Architecture
            PJ_G3 --> PJ_G4: Sprint Plan
            PJ_G4 --> [*]
        }
        
        DesignPhase --> ExecutionPhase
        
        state ExecutionPhase {
            [*] --> Sprint
            Sprint --> ThreeGates: Story
            
            state ThreeGates {
                [*] --> CodeReview
                CodeReview --> QAVerify
                QAVerify --> PMVerify
                PMVerify --> [*]
            }
            
            ThreeGates --> Sprint: More Stories
            Sprint --> [*]: All Complete
        }
        
        ExecutionPhase --> [*]
    }
    
    Hotfix --> SaveMemory: Complete
    BugFix --> SaveMemory: Complete
    Refactor --> SaveMemory: Complete
    Feature --> SaveMemory: Complete
    Project --> SaveMemory: Complete
    
    SaveMemory --> [*]: Session End
    
    note right of LoadMemory
        Load short-term state
        Load long-term memories
        Resume where left off
    end note
    
    note right of SaveMemory
        Update state files
        Save learnings
        Preserve context
    end note
```

---

**For detailed architecture and system design, see ARCHITECTURE.md**
