# AutoSDLC Setup for GitHub Copilot

GitHub Copilot works great with AutoSDLC! This guide covers Copilot-specific setup and usage patterns.

---

## 🎯 What's Different with Copilot

GitHub Copilot has some unique characteristics compared to Claude Code or Cursor:

| Feature | GitHub Copilot | Claude/Cursor |
|---------|----------------|---------------|
| **File Loading** | Requires `@workspace` command | Automatic |
| **State Persistence** | Manual (read state files) | Automatic |
| **Context Window** | Smaller (~4K tokens) | Larger (~100K+ tokens) |
| **Proactive Behavior** | Less autonomous | More autonomous |
| **Memory Loading** | On-demand | Automatic |

**Good news**: AutoSDLC's new memory system and Copilot adaptations solve these limitations!

---

## 🚀 Quick Setup (5 minutes)

### 1. Clone AutoSDLC

```bash
cd YourProject
git clone https://github.com/dondetir/AutoSDLC.git AutoSDLC
echo "AutoSDLC/" >> .gitignore
```

### 2. Create Copilot Instructions File

Create `.github/copilot-instructions.md` in your project:

```markdown
# AutoSDLC Orchestration
Read and follow: ./AutoSDLC/ORCHESTRATOR.md

You are working with AutoSDLC, a multi-agent development workflow framework.
Check `.AutoSDLC/copilot-state.md` for current state and follow the active workflow.
```

Or copy from AutoSDLC:
```bash
mkdir .github
cp AutoSDLC/.github/copilot-instructions.md .github/
```

### 3. Start VS Code with GitHub Copilot

```bash
code .
```

### 4. Initialize AutoSDLC

In Copilot Chat, say:
```
@workspace Initialize AutoSDLC for this project
```

Copilot will create:
- `.AutoSDLC/` directory structure
- Memory system (semantic, episodic, procedural)
- State files (copilot-state.md, action-plan.md, etc.)
- Initial workflow status

---

## 💡 How to Use AutoSDLC with Copilot

### Starting a New Session

Every time you start working, say:
```
@workspace Check .AutoSDLC/copilot-state.md and continue
```

Copilot will:
1. Read where you left off
2. Load relevant memory
3. Show current task and next steps
4. Ask if you want to continue

### Continuing Work

To keep working autonomously, just say:
```
continue
```

Copilot will:
1. Read action-plan.md
2. Execute next unchecked item
3. Update state when done
4. Keep working until blocked

### Checking Status

To see where you are, say:
```
status
```

Copilot will show:
- Current phase and gate
- Active agent role
- Current task
- Progress
- Any blockers

### Loading Long-Term Memory

When you need to recall decisions or past work:
```
@workspace Load semantic memory for architecture decisions
```

Or:
```
@workspace What did we learn last session? Check episodic memory
```

---

## 🧠 Understanding AutoSDLC's Memory System

### Short-Term Memory (Always Loaded)

**Files read on every interaction:**
- `.AutoSDLC/copilot-state.md` (~200 words) - Where you are now
- `.AutoSDLC/action-plan.md` (~300 words) - What to do next

**Total**: ~500 words, fits easily in Copilot's context

### Long-Term Memory (Load When Needed)

**Semantic Memory** (shared facts):
- `.AutoSDLC/memory/semantic/knowledge-base.md` - Architecture, decisions, facts
- `.AutoSDLC/memory/semantic/glossary.md` - Terminology

**Episodic Memory** (personal experiences):
- `.AutoSDLC/memory/episodic/{agent-id}.md` - Past sessions, learnings per agent

**Procedural Memory** (how-to knowledge):
- `.AutoSDLC/memory/procedural/agent-skills.yaml` - Learned procedures
- `.AutoSDLC/memory/procedural/user-preferences.yaml` - Your work style

**When to load**: Use `@workspace` to load specific memory when needed

---

## 📋 Common Commands

### Session Management
```
@workspace Check copilot-state.md and continue    # Start session
continue                                           # Keep working
status                                             # Check progress
```

### Memory Access
```
@workspace Load semantic memory                   # Load facts/decisions
@workspace What did I learn last time?            # Load episodic memory
@workspace How should I do [task]?                # Load procedural memory
```

### Task Management
```
What's next?                                      # See action plan
Mark current task complete                        # Update progress
Show blockers                                     # See any blockers
```

### Quality Gates
```
Am I ready for the next gate?                    # Check gate requirements
Show gate deliverables                           # See what's needed
Request gate review                              # Prepare for approval
```

---

## 🎨 Recommended Settings

Add to your `project.yaml`:

```yaml
settings:
  ai_tool: "github-copilot"
  
  # Use compact documentation for smaller context
  documentation_mode: "moderate"  # not comprehensive
  
  # Shorter session context
  session_context_words: 300      # not unlimited
  
  # Copilot-specific optimizations
  use_copilot_state: true
  auto_load_memory: false         # Manual loading preferred
```

---

## 🔧 Optimization Tips

### 1. Keep State Files Updated

After significant work, update state manually if Copilot forgets:
```
Update copilot-state.md with current progress
```

### 2. Load Memory Selectively

Don't load all memory at once. Load what you need:
```
@workspace Load only the backend developer episodic memory
```

### 3. Use Action Plans

Action plans guide autonomous work:
```
@workspace Show my action plan and execute next 3 items
```

### 4. Leverage Behavior Triggers

Behavior triggers tell Copilot when to act automatically:
```
@workspace Read behavior-triggers.md and act accordingly
```

---

## 🚨 Troubleshooting

### Copilot Doesn't Remember Context

**Solution**: Explicitly load state files
```
@workspace Read .AutoSDLC/copilot-state.md first
```

### Copilot Asks Too Many Questions

**Solution**: Load action plan for autonomous work
```
@workspace Follow action-plan.md autonomously until blocked
```

### Memory Not Loading

**Solution**: Use @workspace command explicitly
```
@workspace Load .AutoSDLC/memory/semantic/knowledge-base.md
```

### State Gets Out of Sync

**Solution**: Manually update state files
```
Update copilot-state.md: Last action = [what you did], Next = [what's next]
```

---

## 📊 Memory Usage Optimization

Copilot has a smaller context window, so we optimize memory:

| Memory Type | Size | When to Load |
|-------------|------|--------------|
| Short-term state | ~500 words | Always (automatic) |
| Semantic memory | ~2000 words | Gate transitions, architecture questions |
| Episodic memory | ~1500 words | Session start, collaboration |
| Procedural memory | ~1500 words | When executing procedures |

**Strategy**: Load only what you need for the current task.

---

## 🎓 Best Practices

### 1. Start Every Session the Same Way
```
@workspace Check .AutoSDLC/copilot-state.md and continue
```

### 2. Use "continue" for Autonomous Work
Let Copilot work through action plans without interruption.

### 3. Update State Regularly
After completing tasks:
```
Update state files with progress
```

### 4. Load Memory On-Demand
Don't preload everything. Load when needed:
```
@workspace When was the auth architecture decided? Check semantic memory
```

### 5. Use Behavior Triggers
Reference behavior-triggers.md for automatic actions:
```
@workspace What should I do when tests pass? Check behavior-triggers.md
```

---

## 🆚 Copilot vs Claude/Cursor

### Advantages of Copilot
- ✅ Integrated with VS Code
- ✅ Inline code suggestions
- ✅ Fast response times
- ✅ GitHub integration

### Copilot Adaptations in AutoSDLC
- ✅ Compact state files (~500 words)
- ✅ Action plans for autonomy
- ✅ Behavior triggers for proactivity
- ✅ On-demand memory loading
- ✅ Explicit @workspace commands

### Result
AutoSDLC with Copilot is just as powerful as with Claude/Cursor, just with a different interaction pattern!

---

## 📚 Additional Resources

- **Full Setup**: See [SETUP.md](SETUP.md)
- **Complete Guide**: See [ORCHESTRATOR.md](ORCHESTRATOR.md)
- **Memory System**: See `.AutoSDLC/memory/procedural/memory-manager.yaml`
- **Copilot Config**: See `config/copilot-adaptations.yaml`

---

## 💬 Example Session

```
You: @workspace Check copilot-state.md and continue

Copilot: Reading state...
         Resuming work as Backend Developer
         Last action: Completed user registration endpoint
         Current task: TASK-005 - Implement login endpoint
         Ready to continue?

You: yes, continue

Copilot: Executing action plan...
         [Implements login endpoint]
         [Writes tests]
         [Tests pass]
         Task TASK-005 complete. Updated state.
         Ready to move to TASK-006 - Password reset?

You: status

Copilot: Phase: Execution | Gate: Gate 3 - Build
         Agent: Backend Developer
         Progress: 5/12 stories complete
         Current: Sprint 2, Day 3 of 7
         No blockers

You: continue

Copilot: Moving to TASK-006...
         [Continues working autonomously]
```

---

**Happy coding with AutoSDLC and GitHub Copilot!** 🚀

For questions or issues, see [FAQ.md](FAQ.md) or open an issue on GitHub.
