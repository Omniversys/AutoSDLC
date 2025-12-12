# AutoSDLC Story Completion Rules Update

**Date:** 2025-10-06
**Reason:** Prevent incomplete stories from being marked as complete
**Issue Found:** Sprint 2 claimed CLI was "100% complete" but most commands were just stubs

---

## What Was Changed

### 1. Updated `AutoSDLC/config/rules.yaml`

Added 4 new strict enforcement rules under `execution_phase`:

#### Rule 1: Mandatory Peer Review
- **Requirement:** Every story MUST be reviewed by a different agent before completion
- **Details:**
  - Implementer agent CANNOT mark their own story as complete
  - Reviewer must be different type (e.g., QA reviews dev work)
  - PM assigns reviewer when story moves to 'review' status
  - Review must be documented in story completion report
- **Enforcement:** Strict
- **Penalty:** Story marked incomplete, must be re-reviewed

#### Rule 2: Verifiable Evidence Required
- **Requirement:** Story completion requires verifiable evidence of 100% completion
- **Details:**
  - NEVER mark story complete based on status reports alone
  - Reviewer MUST read actual code/files to verify completion
  - Reviewer MUST run tests to verify they pass
  - If story says "implement command X", reviewer must verify command works
  - Stub implementations with console.log/TODO are NOT complete
- **7-Step Verification Process:**
  1. Read the story acceptance criteria
  2. Read the actual code files (not status reports)
  3. Run the tests for this story
  4. Test the feature manually if applicable
  5. Verify no stubs/placeholders remain
  6. Document verification results
  7. Only then mark as complete
- **Enforcement:** Strict
- **Penalty:** Story rejected, returned to implementer

#### Rule 3: Definition of Done
- **Requirement:** Definition of Done must be met before story completion
- **Categories:**
  - **Code Implementation:**
    - All functions/classes from story exist (no stubs)
    - Implementation matches acceptance criteria exactly
    - No console.log placeholder messages
    - No 'not yet implemented' or 'TODO' comments
    - Code compiles without errors
    - No TypeScript 'any' types without justification
  - **Testing:**
    - Unit tests written and passing
    - Integration tests if applicable
    - Test coverage meets project threshold
    - Tests actually test the implementation (not mocks only)
    - Reviewer runs tests and sees them pass
  - **Documentation:**
    - TSDoc/JSDoc for all public APIs
    - README updated if needed
    - Examples work when copy-pasted
    - No placeholder sections
  - **Quality:**
    - Linting passes
    - Build succeeds
    - No regression in other tests
    - Follows approved architecture
- **Enforcement:** Strict
- **Penalty:** Story incomplete, must fix deficiencies

#### Rule 4: PM Verification
- **Requirement:** PM must verify story completion evidence before updating status
- **Details:**
  - PM receives completion report from reviewer
  - PM spot-checks by reading actual code
  - PM runs build/tests to verify claims
  - PM only updates status.yaml after verification
  - If evidence is lacking, PM sends back to implementer
- **Enforcement:** Strict
- **Penalty:** Status update rejected, PM must re-verify

### 2. Updated `AutoSDLC/workflows/agile-two-phase.yaml`

Added complete story lifecycle workflow:

#### New Story States
```
todo → in_progress → code_review → testing → done
```

#### Mandatory Transitions
1. **To Code Review:**
   - Developer claims work complete
   - Required: Code committed, tests written, build passes
   - Action: PM assigns different agent as reviewer

2. **To Testing:**
   - Code reviewer approves
   - Required: Reviewer verified code exists (no stubs), ran tests, completed checklist
   - Action: PM assigns QA agent for final verification

3. **To Done:**
   - QA verifies acceptance criteria
   - Required: QA ran tests, verified feature works, PM spot-checked code
   - Action: PM updates status.yaml

#### Rejection Paths
- Code review rejects → back to in_progress
- Testing rejects → back to in_progress
- Must go through review again

#### 3 Quality Gates
1. **Gate Review:** Peer Code Review by different agent
2. **Gate QA:** QA Verification
3. **Gate PM:** PM Final Verification

### 3. Updated `AutoSDLC/ORCHESTRATOR.md`

Added comprehensive "Story Completion Rules" section:
- 3-Gate mandatory process
- Red flags for incomplete stories
- What "100% Complete" means
- PM responsibilities

### 4. Updated `CLAUDE.md`

Added prominent reminder to:
- Read Story Completion Rules before marking any story done
- Load rules.yaml and workflow.yaml
- Follow story completion enforcement process

---

## Will This Prevent Future Occurrences?

### Yes, if followed correctly. Here's why:

#### Prevention Mechanism 1: Peer Review
**Problem:** Developer marks own work as "complete" without verification
**Solution:** Different agent MUST review before completion
**Impact:** Second pair of eyes will catch stub implementations

#### Prevention Mechanism 2: Mandatory Code Reading
**Problem:** Stories marked complete based on status reports, not actual code
**Solution:** Reviewer MUST read actual code files and run tests
**Impact:** Stubs like "console.log('not yet implemented')" will be caught

#### Prevention Mechanism 3: QA Verification
**Problem:** Tests might exist but be empty or skipped
**Solution:** QA MUST run tests and verify they pass
**Impact:** Test quality is verified, not just existence

#### Prevention Mechanism 4: PM Spot-Check
**Problem:** PM updates status.yaml without verifying reality
**Solution:** PM MUST read code and run tests before updating status
**Impact:** Final safety net catches any false completions

#### Prevention Mechanism 5: Explicit Red Flags
**Problem:** Unclear what "complete" means
**Solution:** Documented red flags (e.g., "not yet implemented", TODO comments)
**Impact:** Clear criteria for rejection

#### Prevention Mechanism 6: State Machine
**Problem:** Stories can skip review steps
**Solution:** Mandatory state transitions (must go through code_review → testing)
**Impact:** No shortcuts possible

---

## Example: How CLI Stories Would Be Handled Now

### Old Process (What Happened in Sprint 2):
1. Developer creates `init.ts` with stub: `console.log('not yet implemented')`
2. Developer marks story "STORY-022: musicmcp init" as COMPLETE ❌
3. PM updates status.yaml: "STORY-022 ✅"
4. No one verifies actual code
5. Result: 0% complete story marked as 100% complete

### New Process (With Updated Rules):
1. Developer creates `init.ts` with stub: `console.log('not yet implemented')`
2. Developer moves story to **code_review** (not complete)
3. **PM assigns QA agent as reviewer**
4. QA agent:
   - Reads `packages/cli/src/commands/init.ts`
   - Sees: `console.log(chalk.yellow('init command - not yet implemented'))`
   - **RED FLAG:** Stub implementation detected
   - Runs: `musicmcp init` → sees "not yet implemented" message
   - **REJECTS story** → moves back to in_progress
   - Documents: "Story incomplete - stub implementation found, feature not working"
5. PM sees rejection → asks developer to actually implement it
6. Developer implements real init functionality
7. Goes through review again → this time passes
8. QA verifies feature works
9. PM spot-checks code → sees real implementation
10. **Only then** updates status.yaml as complete ✅

---

## Potential Weaknesses & Mitigations

### Weakness 1: "Rules are ignored"
**Mitigation:** CLAUDE.md now mandates reading rules before ANY story completion

### Weakness 2: "Reviewer might not be thorough"
**Mitigation:** Explicit 7-step verification checklist that must be documented

### Weakness 3: "PM might skip spot-check"
**Mitigation:** Strict enforcement - "PM MUST read code and run tests"

### Weakness 4: "Agents might collude to mark incomplete work done"
**Mitigation:** Review checklist must be documented; user can audit completion reports

### Weakness 5: "Process might be too slow"
**Mitigation:** This is intentional - quality over speed; prevents rework

---

## Enforcement Checklist for PM

Before marking ANY story as complete, PM must verify:

- [ ] Story went through code_review state
- [ ] Code review report exists and documents verification
- [ ] Code review found NO stub implementations
- [ ] Code reviewer ran tests and confirmed passing
- [ ] Story went through testing state
- [ ] QA report exists and documents verification
- [ ] QA ran tests and verified feature works
- [ ] PM read the actual code files
- [ ] PM ran build and tests
- [ ] PM verified no placeholders/stubs exist
- [ ] All Definition of Done items are met
- [ ] Only then update status.yaml

---

## Summary

**Changes Made:**
- 4 new strict rules in rules.yaml
- Complete story lifecycle in workflow.yaml
- 3 mandatory quality gates
- Comprehensive verification checklists
- Updated CLAUDE.md for visibility

**Will It Work?**
Yes, if the PM and reviewing agents follow the process. The multi-gate system with mandatory verification steps creates multiple checkpoints where incomplete work will be caught.

**Key Success Factor:**
The PM must actually read the rules and follow them. The rules are now:
1. Documented in 4 files
2. Marked as MANDATORY in CLAUDE.md
3. Include explicit checklists
4. Define clear red flags

**Result:**
Stories like "CLI commands" that are 30% complete (only stubs) cannot be marked as "100% complete" because:
- Code reviewer will see stubs and reject
- QA will run commands, see "not yet implemented", and reject
- PM will spot-check code, see stubs, and reject

This creates a **fail-safe system** with 3 independent verification points.
