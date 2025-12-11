 ╔══════════════════════════════════════════════════════════════════════════════╗
  ║                    DEVFLOW - Multi-Agent Development Workflow                 ║
  ║                    Where AI Meets Engineering Discipline                      ║
  ║              Config-Driven Prompt Engineering Framework for AI                ║
  ╚══════════════════════════════════════════════════════════════════════════════╝

  PURPOSE: Orchestrate AI coding assistants via structured prompts and YAML configs
           AI reads configs → AI role-plays agents → AI follows methodology


  ┌──────────────────────────────────────────────────────────────────────────────┐
  │ STEP 1: SETUP                                                                │
  └──────────────────────────────────────────────────────────────────────────────┘

      Your Project                    Clone DevFlow                Add One Line
      ┌─────────┐                     ┌─────────┐                ┌──────────────┐
      │  src/   │                     │ DevFlow/│                │  claude.md   │
      │  test/  │  ────────────────>  │ config/ │  ───────────>  │ Read and     │
      │  docs/  │                     │ agents/ │                │ follow:      │
      └─────────┘                     │ workflows/               │ DevFlow/     │
                                      └─────────┘                │ ORCHESTRATOR │
                                                                 └──────────────┘


  ┌──────────────────────────────────────────────────────────────────────────────┐
  │ STEP 2: AI INTERPRETS FRAMEWORK (Not software, just prompts!)               │
  └──────────────────────────────────────────────────────────────────────────────┘

     AI Reads Configs                     AI Understands                AI Follows
     ┌──────────────┐                     ┌─────────────┐              ┌─────────┐
     │ workflow.yaml│ ──────────────────> │ • Phases    │ ──────────>  │ Agent   │
     │ agents.yaml  │                     │ • Gates     │              │ Behaviors│
     │ rules.yaml   │                     │ • Agents    │              │ Quality  │
     │ templates/   │                     │ • Rules     │              │ Gates    │
     └──────────────┘                     └─────────────┘              └─────────┘


  ┌──────────────────────────────────────────────────────────────────────────────┐
  │ STEP 3: TASK CLASSIFICATION (Choose workflow based on task)                 │
  └──────────────────────────────────────────────────────────────────────────────┘

                              User describes task
                                      ▼
                ┌────────────────────────────────────────────┐
                │   What type of work are you doing?        │
                └────────────────────────────────────────────┘
                                      ▼
           ┌──────────┬──────────┬──────────┬──────────┬──────────┐
           │          │          │          │          │          │
      🚨 Emergency  🐛 Bug    🔄 Refactor ✨ Feature  🚀 Project
        Hot-Fix      Fix                  Development
           │          │          │          │          │
           ▼          ▼          ▼          ▼          ▼
      3 gates    2 gates    3 gates    3 gates    4 gates + exec
      30-120min  45-90min   2h-3days   1-5days    weeks-months


  ┌──────────────────────────────────────────────────────────────────────────────┐
  │ STEP 4: TWO-PHASE WORKFLOW (Example: Feature Development ✨)                │
  └──────────────────────────────────────────────────────────────────────────────┘

  ╔════════════════════════════════════════════════════════════════════════════╗
  ║ PHASE 1: DESIGN (User Decides Everything, AI Proposes Options)            ║
  ╚════════════════════════════════════════════════════════════════════════════╝

  ┌─────────────────────┐
  │ Gate 1: Scoping     │ ───> 📋 Product Owner: Create feature brief
  │                     │      🏗️  Architect: Analyze codebase, find integrations
  │ User Approves Scope │      ─────────────────────────────────────────────────
  └─────────────────────┘              User: ✅ Approved / ❌ Revise
                                                  │
                                                  ▼
  ┌─────────────────────┐
  │ Gate 2: Design      │ ───> 🏗️  Architect: Present 2-3 implementation options
  │                     │      • Option A: CSS Variables (pros/cons)
  │ User Chooses Design │      • Option B: Styled Components (pros/cons)
  └─────────────────────┘      ─────────────────────────────────────────────────
                                       User: Chooses Option A
                                                  │
                                                  ▼
  ╔════════════════════════════════════════════════════════════════════════════╗
  ║ PHASE 2: EXECUTION (AI Agents Work Autonomously)                          ║
  ╚════════════════════════════════════════════════════════════════════════════╝

  ┌─────────────────────┐
  │ Gate 3: Build       │ ───> 💻 Dev Team: Implements stories autonomously
  │                     │
  │ Multi-Gate Quality  │      For each story:
  └─────────────────────┘      ┌──────────────────────────────────────────┐
                               │ Story Lifecycle (3-Gate Quality)         │
                               ├──────────────────────────────────────────┤
                               │ ✅ Gate 1: Peer Code Review             │
                               │    Different agent reviews code          │
                               │    Verify no stubs/TODOs                 │
                               │    Run tests                             │
                               │                                          │
                               │ ✅ Gate 2: QA Verification              │
                               │    QA tests feature                      │
                               │    Verify acceptance criteria            │
                               │                                          │
                               │ ✅ Gate 3: PM Verification              │
                               │    PM spot-checks code                   │
                               │    Confirms Definition of Done           │
                               └──────────────────────────────────────────┘
                                                │
                                                ▼
                                      ✅ Story Complete!


  ┌──────────────────────────────────────────────────────────────────────────────┐
  │ STEP 5: MULTI-AGENT SYSTEM (AI role-plays 9 specialized agents)            │
  └──────────────────────────────────────────────────────────────────────────────┘

  Design Phase Agents                     Execution Phase Agents
  ┌──────────────────┐                    ┌──────────────────────┐
  │ 🤖 PM            │ ── Coordinates ──> │ 💻 Backend Dev       │
  │ 📋 Product Owner │                    │ 🎨 Frontend Dev      │
  │ 🏗️  Architect    │                    │ 🤖 ML Dev            │
  └──────────────────┘                    │ 🔧 DevOps Engineer   │
                                          │ 🧪 QA Automation     │
                                          │ 🧪 QA Manual         │
                                          │ 🛡️  Security Expert  │
                                          └──────────────────────┘

  Each agent has:
  • Personality defined in agents/{agent_id}.yaml
  • Specific responsibilities per phase
  • Behaviors and guidelines
  • Communication style


  ┌──────────────────────────────────────────────────────────────────────────────┐
  │ STEP 6: STATE & MEMORY SYSTEM (Session persistence + continuity)            │
  └──────────────────────────────────────────────────────────────────────────────┘

  Short-Term Memory                       Long-Term Memory
  (Always loaded)                         (Loaded on-demand)
  ┌──────────────────────┐                ┌─────────────────────────┐
  │ copilot-state.md     │                │ Semantic Memory:         │
  │ • Current task       │                │ • knowledge-base.md     │
  │ • Active agent       │                │ • glossary.md           │
  │ • Blockers           │                │                         │
  │                      │                │ Episodic Memory:        │
  │ action-plan.md       │                │ • pm.md (experiences)   │
  │ • Task checklist     │                │ • architect.md          │
  │ • Next steps         │                │ • developer.md          │
  │                      │                │                         │
  │ status.yaml          │                │ Procedural Memory:      │
  │ • Phase/gate         │                │ • agent-skills.yaml     │
  │ • Progress           │                │ • user-preferences.yaml │
  └──────────────────────┘                └─────────────────────────┘

           Tracks current work                 Preserves learnings
           Resumes mid-session                 across all sessions

  See ARCHITECTURE.md for detailed memory system design

  ┌──────────────────────────────────────────────────────────────────────────────┐
  │ ORGANIZATIONAL MEMORY SYSTEM (Enterprise Extension)                         │
  └──────────────────────────────────────────────────────────────────────────────┘

  For enterprise deployments, DevFlow extends to a **four-tier memory hierarchy**:

  1. **Organization Level** (~/.devflow/org-memory/)
     • Company-wide standards, security policies, architecture patterns
     • Git-versioned, enforced across all teams

  2. **Team Level** (~/devflow-team-memory/)
     • Team conventions, shared ADRs, collaborative learnings
     • Git repository for team collaboration

  3. **User Level** (~/.devflow/global-memory/)
     • Personal cross-project patterns and preferences
     • Private to individual developer

  4. **Project Level** (.devflow/memory/)
     • Project-specific context (existing individual memory)

  **Loading Priority:** Project → User → Team → Organization (higher overrides lower)

  **Key Enterprise Features:**
  • Memory promotion/demotion (export up hierarchy, import down)
  • Git-based collaboration with PR reviews for team/org memories
  • Access control with role-based permissions
  • Automatic pattern detection and context-aware loading
  • Memory analytics and health monitoring
  • New developer onboarding from org/team knowledge

  See ORGANIZATIONAL-MEMORY.md for complete architecture
  See ORG-SETUP-GUIDE.md for deployment instructions


  ┌──────────────────────────────────────────────────────────────────────────────┐
  │ WHAT MAKES THIS UNIQUE                                                       │
  └──────────────────────────────────────────────────────────────────────────────┘

  ✨ NOT SOFTWARE                      📝 PURE PROMPT ENGINEERING
     • No compilation                    • YAML configs define behavior
     • No dependencies                   • Markdown templates structure output
     • Just text files                   • AI interprets and follows

  🔄 METHODOLOGY, NOT TOOL             🛠️ TOOL AGNOSTIC
     • AI reads instructions             • Works with GitHub Copilot
     • AI follows process                • Works with Claude Code
     • AI role-plays agents              • Works with Cursor
                                         • Universal memory system

  ⚙️ CONFIG-DRIVEN                     📦 GIT-FRIENDLY
     • Workflow rules in YAML            • Everything version-controlled
     • Agent behaviors in YAML           • Share methodology across teams
     • Templates for documents           • Fork and customize


  ┌──────────────────────────────────────────────────────────────────────────────┐
  │ KEY BENEFITS                                                                 │
  └──────────────────────────────────────────────────────────────────────────────┘

  ✅ Structured Development            ✅ Quality Gates
     Task → Analysis → Design →          3-gate story completion
     Implementation → Verification       No incomplete work

  ✅ Context Preservation              ✅ Scalable Complexity
     3-tier memory system                Bug fix: 45 min, 2 gates
     Resume across sessions              New project: weeks, 4 gates
     Learns from experience              Adapts to task complexity

  ✅ Separation of Concerns            ✅ User Control
     Design: User decides                User approves all major decisions
     Execution: AI implements            AI proposes options, never decides

  In Summary:

  DevFlow is a prompt engineering framework that transforms any AI coding assistant into a structured multi-agent development team with memory. It's not software you install—it's a methodology the AI follows by reading YAML configs and markdown templates. You get organized workflows, quality gates, multi-agent coordination, and cross-session continuity without writing any execution code.

  For detailed architecture diagrams and system design, see ARCHITECTURE.md

