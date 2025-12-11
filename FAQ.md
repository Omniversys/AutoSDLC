# Frequently Asked Questions (FAQ)

## General Questions

### What is AutoSDLC?

AutoSDLC is a prompt engineering framework for AI coding assistants. It's a collection of YAML configs and structured prompts that teach AI to follow a systematic development workflow. Instead of building software, you define agent behaviors, quality gates, and workflows in config files—then AI interprets and follows them. It simulates a 9-agent software team through prompt engineering, with a two-phase workflow where you make technical decisions in Phase 1, and AI executes autonomously in Phase 2.

### Is this actually prompt engineering?

Yes, 100%! AutoSDLC is pure prompt engineering:
- Agent "behaviors" are YAML configs that structure prompts
- The "orchestrator" (claude.md) is a meta-prompt that loads other prompts
- Workflows are sequences of prompt-guided actions
- No code execution—just AI reading configs and following instructions
- Works with any LLM-based coding assistant (Claude Code, Cursor, etc.)

The framework is prompts teaching AI how to behave like different agents and follow specific methodologies.

### How is this different from other AI coding workflows?

AutoSDLC is unique in several ways:
- **Two-phase separation**: Explicit design vs execution phases
- **Team simulation**: 9 specialized AI agents with distinct roles
- **Gate-based approval**: You control transitions between phases
- **Architecture-first**: Forces technical decisions before coding
- **Quality gates**: Mandatory peer review and verification for completions

### How do I integrate AutoSDLC with my AI tool?

Super simple - just add one line to your AI tool's config file:

```markdown
# AutoSDLC Orchestration
Read and follow: ./AutoSDLC/ORCHESTRATOR.md
```

This works for:
- Claude Code (`claude.md`)
- Cursor (`.cursorrules`)
- Gemini CLI (`gemini.md`)
- Aider (`.aider.md`)
- Any tool that reads config files

The AI will load AutoSDLC's ORCHESTRATOR.md which contains all the workflow instructions.

### Do I need to know YAML or programming?

Basic familiarity helps, but not required:
- **To use AutoSDLC**: Just answer questions and make decisions
- **To customize**: Basic YAML editing (we provide examples)
- **To extend**: Understanding of YAML structure and agent concepts

## Workflow Selection Questions

### How do I choose the right workflow?

AutoSDLC provides three specialized workflows. Choose based on your task:

**🐛 Bug Fix** - When something is broken:
- App crashes or throws errors
- Feature doesn't work as expected
- Security vulnerability needs patching
- Timeline: 45-90 minutes

**✨ Feature Development** - Adding to existing projects:
- New capability or enhancement
- Integration with external service
- Optimization or improvement
- Timeline: 1-5 days

**🚀 New Project** - Starting from scratch:
- New application or system
- Multiple features and components
- Full architecture planning needed
- Timeline: Weeks to months

**🔄 Refactor** - Code improvement:
- Code works but is messy
- High complexity, tech debt
- Poor structure, duplicate code
- Timeline: 2 hours - 3 days

### Can I switch workflows mid-project?

Yes! AutoSDLC supports workflow transitions with your approval.

**Common transitions:**
- **Bug → Feature**: "While fixing the bug, we discovered it needs a feature"
- **Bug → Refactor**: "Root cause is poor code structure requiring refactor"
- **Feature → Project**: "Feature scope grew into multi-feature system"
- **Refactor → Feature**: "During refactor, discovered missing capability"

When PM detects scope change, they'll:
1. Present the situation
2. Recommend workflow transition
3. Wait for your approval
4. Switch workflows seamlessly

### What if I'm not sure which workflow to use?

Just describe what you need! The PM will analyze your request and suggest the best workflow.

**Examples:**

You: "The login page keeps timing out"
→ PM suggests: Bug Fix workflow

You: "I want to add dark mode to my app"
→ PM suggests: Feature Development workflow

You: "Build a todo app with team collaboration"
→ PM suggests: New Project workflow

You: "This authentication module is too complex, hard to maintain"
→ PM suggests: Refactor workflow

If PM's suggestion doesn't feel right, you can request a different workflow.

### What's the difference between Bug Fix and Refactor?

Key differences:

**🐛 Bug Fix:**
- Something is **broken** or **wrong**
- Goal: Restore correct behavior
- Scope: Minimal code changes
- Tests: Add regression test for bug
- Timeline: 45-90 minutes

**🔄 Refactor:**
- Code **works** but is **messy**
- Goal: Improve structure, no behavior change
- Scope: Significant restructuring
- Tests: All existing tests must still pass
- Timeline: 2 hours - 3 days

**Example:**
- Bug: "Login button doesn't work" → Bug Fix
- Refactor: "Login component is 500 lines and hard to maintain" → Refactor

### When should I use Feature vs Project workflow?

**Use Feature Development (✨) when:**
- Adding to an **existing codebase**
- Scope is **bounded** (days, not weeks)
- Architecture already exists
- 1-5 user stories typically
- Examples: "Add export to PDF", "Integrate with Stripe", "Add dark mode"

**Use Project (🚀) when:**
- Starting **from scratch**
- **Multiple features** and components
- Need **full architecture** planning
- Long-term project (weeks to months)
- 10+ user stories typically
- Examples: "Build e-commerce platform", "Create SaaS application"

**Rule of thumb:**
- If you're opening an existing project → Feature
- If you're creating a new repo → Project

### Can I customize how workflows work?

Yes! Several customization options:

**Override workflow settings** in `project.yaml`:
```yaml
workflow:
  sprint_duration_days: 7  # Shorter sprints
  client_involvement: "medium"  # Less frequent check-ins
```

**Disable specific gates** (advanced):
Edit the workflow YAML file to skip gates you don't need.

**Create custom workflows:**
1. Copy an existing workflow YAML
2. Modify gates and processes
3. Reference it in `config/workflow.yaml`

### How do quality gates work across workflows?

All workflows enforce the **3-gate story completion process**:

**Gate 1: Peer Review**
- Different agent reviews code
- Reads actual files (not just reports)
- Verifies no stubs/TODOs

**Gate 2: QA Verification**
- QA runs all tests
- Manually tests functionality
- Checks acceptance criteria

**Gate 3: PM Verification**
- PM reads review reports
- Spot-checks actual code
- Updates status only if all gates pass

This applies to:
- Bug fixes (for the fix verification)
- Feature stories (for each story)
- Project stories (for each story)
- Refactors (for each refactor chunk)

**Result**: No incomplete work gets marked as done!

## Usage Questions

### Can I customize the agents?

Yes! You can:
- Enable/disable specific agents in `config/agents.yaml`
- Override agent behaviors by creating custom agent files
- Adjust agent responsibilities in their YAML definitions
- Create new custom agents by following the existing patterns

### What if I don't need all 9 agents?

Disable unused agents in your project's `config/agents-override.yaml`:

```yaml
agents:
  ml_engineer:
    enabled: false
  devops:
    enabled: false
```

### How do I update AutoSDLC?

Since AutoSDLC is cloned into your project:

```bash
cd AutoSDLC
git pull
```

All projects using AutoSDLC will use the updated version.

### Do I need to run any setup scripts?

No! AutoSDLC auto-initializes on first run. Just:
1. Clone AutoSDLC into your project
2. Add one line to your AI tool's config
3. Start your AI tool

The AI will detect it's the first run and automatically create:
- `.AutoSDLC/` directory structure
- Initial status files
- Document folders

Everything is handled through prompt engineering.

### Can I use AutoSDLC for non-code projects?

Yes! While designed for software, it works for:
- Documentation projects
- Infrastructure/DevOps setups
- Research projects
- Content creation with structured workflows

## Technical Questions

### What happens in Phase 1?

**Phase 1 - Collaborative Design:**
1. Product Owner creates PSA and stories → You approve
2. Solution Architect presents technical OPTIONS → You decide
3. PM creates sprint plan → You approve
4. You say "Begin Execution" to move to Phase 2

### What happens in Phase 2?

**Phase 2 - Autonomous Execution:**
1. All agents activate based on your approved architecture
2. They work independently on assigned tasks
3. PM coordinates and tracks progress
4. You receive sprint reviews and demos
5. Only critical blockers escalate to you

### Can I change the architecture mid-project?

Architecture is locked after Gate 3 approval. Changes require:
1. Explicit approval from you
2. Impact analysis by the Architect
3. Updated ADR (Architecture Decision Record)
4. Potential sprint re-planning

This prevents scope creep and ensures stability.

### How does the story completion process work?

AutoSDLC enforces a 3-gate quality process:
1. **Gate 1 - Peer Review**: Different agent reviews code
2. **Gate 2 - QA Verification**: QA tests functionality
3. **Gate 3 - PM Verification**: PM spot-checks and updates status

This prevents incomplete work from being marked as done.

## Troubleshooting

### Claude doesn't load AutoSDLC

**Check:**
1. `AutoSDLC/` folder exists in your project root
2. `claude.md` file exists and references AutoSDLC
3. `project.yaml` exists with correct framework path
4. Run `ls -la` to verify structure

### Agents aren't behaving correctly

**Check:**
1. `AutoSDLC/config/workflow.yaml` points to correct workflow
2. Agent YAML files are readable: `ls -la AutoSDLC/agents/`
3. No YAML syntax errors: `yamllint AutoSDLC/config/*.yaml`
4. Review `status/current-status.yaml` for current phase

### Stories are being marked complete when they're not done

This should not happen with AutoSDLC 1.0+ thanks to quality gates. If it does:
1. Check that `config/rules.yaml` includes story completion rules
2. Verify PM is following the 3-gate verification process
3. Review the story completion rules in `ORCHESTRATOR.md`

### How do I start over / reset the workflow?

To restart a project:
1. Delete generated folders: `docs/`, `architecture/`, `status/`, `src/`
2. Keep: `AutoSDLC/`, `claude.md`, `project.yaml`
3. Re-run Claude Code
4. PM will start from Phase 1, Gate 1

## Configuration Questions

### Where do I configure project-specific settings?

Create `project.yaml` in your project root:

```yaml
project:
  name: "MyProject"
  description: "Brief description"

settings:
  framework_path: "./AutoSDLC"
  client_involvement: "high"  # high, medium, low
  require_phase_approval: true
```

### Can I use custom document templates?

Yes! Create a `templates/` folder in your project root:

```
MyProject/
├── templates/
│   ├── documents/
│   │   └── story.template.md  # Overrides AutoSDLC's template
│   └── architecture/
│       └── adr.template.md     # Overrides AutoSDLC's template
```

AutoSDLC will use your templates first, then fall back to default templates.

### How do I adjust sprint duration?

In `project.yaml`:

```yaml
workflow:
  sprint_duration_days: 7  # Default is 14
```

## Integration Questions

### Does AutoSDLC work with CI/CD?

Yes! AutoSDLC generates standard code that works with:
- GitHub Actions
- GitLab CI
- Jenkins
- Any standard CI/CD system

The DevOps agent can set up pipelines during Phase 2.

### Can I use AutoSDLC with existing projects?

Yes, but recommended approach:
1. Start AutoSDLC in a new branch
2. Let it generate architecture docs
3. Review and merge what's useful
4. Use AutoSDLC for new features going forward

### Does it work with languages other than English?

Currently AutoSDLC templates are in English. For other languages:
- Create custom templates in your language
- Override agent personalities in custom agent YAML files
- Submit translations as contributions!

## Contributing

### How can I contribute to AutoSDLC?

See [CONTRIBUTING.md](CONTRIBUTING.md) for:
- Bug reporting process
- Feature request guidelines
- Code contribution workflow
- Development setup

### Can I create custom agents?

Yes! Create a new YAML file in `agents/`:

```yaml
agent_name: "Security Engineer"
agent_id: "security"
role: "Security analysis and testing"
# ... define responsibilities, behaviors, etc.
```

Then register it in `config/agents.yaml`.

### Are there visual guides to help me understand workflows?

Yes! Check out **[WORKFLOW-VISUAL-GUIDE.md](WORKFLOW-VISUAL-GUIDE.md)** which includes:

**📊 Decision Trees:**
- Visual flowchart to choose the right workflow
- Step-by-step decision process

**📈 Comparison Charts:**
- Side-by-side workflow comparisons
- Timeline visualizations
- Complexity vs time investment graphs

**🎭 Agent Involvement Diagrams:**
- Which agents work in each workflow
- Activity levels per workflow type

**🚦 Quality Gate Flows:**
- How the 3-gate process works
- Verification checkpoints

**🎯 Use Case Examples:**
- When to use each workflow
- Real-world scenarios
- Transition paths between workflows

Perfect for:
- First-time users learning AutoSDLC
- Teams needing workflow reference
- Training new developers
- Quick decision-making

### Where can I get help?

1. Check this FAQ
2. Review [README.md](README.md) and [SETUP.md](SETUP.md)
3. Check [WORKFLOW-VISUAL-GUIDE.md](WORKFLOW-VISUAL-GUIDE.md) for workflow selection help
4. Search [GitHub Issues](https://github.com/dondetir/AutoSDLC/issues)
5. Open a new issue with the question template
6. Start a [GitHub Discussion](https://github.com/dondetir/AutoSDLC/discussions)

## License and Legal

### What's the license?

AutoSDLC is MIT licensed. See [LICENSE](LICENSE) file.

You can:
- Use it commercially
- Modify it
- Distribute it
- Use it privately

Just keep the license notice and don't sue us. 😊

### Can I use AutoSDLC for client work?

Yes! MIT license allows commercial use. AutoSDLC helps you:
- Manage client projects professionally
- Document decisions clearly
- Maintain quality standards
- Deliver predictably

---

**Still have questions?** [Open an issue](https://github.com/dondetir/AutoSDLC/issues/new) or [start a discussion](https://github.com/dondetir/AutoSDLC/discussions)!
