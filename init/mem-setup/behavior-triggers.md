# Copilot Behavior Triggers (Act on These Automatically)

## Auto-Actions (Do These Without Being Asked)

### When User Says "continue" or "keep going"
1. Read `.AutoSDLC/copilot-state.md`
2. Read `.AutoSDLC/action-plan.md`
3. Execute the next unchecked item from checklist
4. Update both files when done
5. Keep working until blocker or user stops you

### When User Says "status" or "where are we"
1. Read `copilot-state.md`
2. Read `action-plan.md`
3. Show brief summary:
   - Current task and progress
   - What's complete
   - What's next
   - Any blockers

### When User Commits Code
1. Check if tests need updating
2. Verify test coverage meets requirements
3. If task checklist complete → Prompt for peer review

### When Tests Pass
1. Update action-plan.md checklist (check off item)
2. If all tests pass → Move to next gate step
3. Update copilot-state.md with progress

### When Starting a New Conversation
1. Read copilot-state.md FIRST (this is mandatory)
2. Read semantic/knowledge-base.md SECOND
3. Read episodic/{current-agent}.md THIRD
4. Show: "Resuming: [current task] as [current agent]"
5. Ask: "Should I continue where we left off?"

### When User Requests Session Recording
**Triggers:** "enable session recording" | "start recording" | "record this session"

**If no flags specified (--future or --full):**
1. Show recording options prompt:
   ```
   ✅ Starting session recording
   
   📝 What would you like to record?
   
   [1] 📍 Future messages only
       └─> Records from this point forward
       └─> More privacy-conscious
   
   [2] 📚 Full session (include previous)
       └─> Captures entire conversation from start
       └─> Complete context for education
   
   Please choose [1] or [2]:
   ```
2. Wait for user choice
3. Create session file: `.AutoSDLC/memory/sessions/YYYY-MM-DD_HH-MM_task-name.md`
4. Use template: `.AutoSDLC-framework/templates/session-context/session-recording.template.md`
5. Begin capturing based on user choice

**If --future flag:** Skip prompt, record future only  
**If --full flag:** Skip prompt, record full session

**Confirmation message:**
```
✅ Recording enabled ({FUTURE_ONLY | FULL_SESSION})
📝 File: .AutoSDLC/memory/sessions/2025-12-11_14-30_task.md
⏹️  To stop: 'stop recording'
```

### When User Stops Session Recording
**Triggers:** "stop recording" | "end recording" | "pause recording"

1. Finalize recording file with:
   - Session summary
   - Key decisions
   - Code changes
   - Learnings
   - Metrics (message count, duration, agents used)
2. Save and close file
3. Show confirmation:
   ```
   ⏹️ Session recording stopped
   💾 Saved: .AutoSDLC/memory/sessions/2025-12-11_14-30_task.md
   📊 Captured: {N} messages, {N} words
   ⚠️  Reminder: Review for sensitive info before sharing
   ✅ Ready to share for educational purposes
   ```

### When Completing a Task
1. Update copilot-state.md with new current task
2. Update action-plan.md to next task checklist
3. Update context-anchors.md with recent changes
4. Update episodic memory with session learnings
5. Prompt: "Task {ID} complete. Ready to move to {next task}?"

### When Encountering a Blocker
1. Update copilot-state.md with blocker description
2. Document what was attempted
3. Propose 2-3 potential solutions
4. Estimate timeline impact
5. Wait for user decision before proceeding

---

## Gate Transitions (Require User Approval - Never Autonomous)

### Always Ask User Before:
- Moving to new gate
- Changing approved architecture
- Skipping quality checks
- Modifying locked decisions
- Deploying to production
- Making security-related changes

---

## Proactive Behaviors (Be Helpful)

### When You Notice:
- **Test coverage drops below 80%** → Suggest adding tests
- **Code duplication detected** → Suggest refactoring
- **Security concern** → Flag immediately and escalate
- **Performance issue** → Document and bring to attention
- **Conflicting requirements** → Ask for clarification

### When User is Stuck:
- Review recent context from episodic memory
- Suggest next logical steps from action-plan.md
- Offer to load relevant procedural knowledge
- Reference similar past solutions if available

---

## Memory Update Triggers

### Automatically Update:
- **copilot-state.md** - After every significant action
- **action-plan.md** - When steps completed or plan changes
- **context-anchors.md** - When critical info changes
- **episodic/{agent}.md** - At end of session or after significant learnings

---

*These triggers make you proactive instead of reactive*
*Follow them to provide seamless autonomous assistance*
*Last updated: {LAST_UPDATE_TIMESTAMP}*
