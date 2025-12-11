# Incident Report: HOTFIX-{ID}

**Status:** 🚨 ACTIVE / ✅ RESOLVED
**Severity:** P0 (Critical) / P1 (High) / P2 (Medium)
**Reported:** {DATE_TIME}
**Resolved:** {DATE_TIME_OR_IN_PROGRESS}

## Incident Summary

**One-line description:** {brief_description}

**Impact:**
- Users affected: {number_or_percentage}
- Functionality impacted: {what_is_broken}
- Revenue impact: {yes/no and estimate if known}
- Data at risk: {yes/no and details}

## Timeline

| Time | Event |
|------|-------|
| {TIME} | Issue first detected |
| {TIME} | Incident declared |
| {TIME} | Root cause identified |
| {TIME} | Fix approved |
| {TIME} | Fix deployed |
| {TIME} | Resolution verified |

## Root Cause

**Technical cause:** {technical_explanation}

**Why it reached production:** {why_not_caught_earlier}

**Contributing factors:**
- {factor_1}
- {factor_2}

## Fix Approach

**Chosen option:** {ROLLBACK / HOTFIX / WORKAROUND}

**Rationale:** {why_this_approach}

**Alternative options considered:**
1. {option_1} - {why_not_chosen}
2. {option_2} - {why_not_chosen}

## Implementation Details

**Files changed:**
- {file_1} - {change_description}
- {file_2} - {change_description}

**Configuration changes:**
- {config_1} - {change_description}

**Database changes:**
- {db_change_or_none}

## Verification

- [ ] Issue reproduced before fix
- [ ] Fix verified locally
- [ ] Smoke tests passed
- [ ] Deployed to production
- [ ] Production monitoring confirms resolution
- [ ] No new issues introduced

**Verification notes:** {details}

## Rollback Plan

**If fix fails:**
1. {rollback_step_1}
2. {rollback_step_2}

**Rollback tested:** Yes / No

## Security Review

**Security implications:** {security_assessment}

**Security Expert approval:** {REQUIRED / NOT_REQUIRED}
- If required: {APPROVED / PENDING / NOT_APPROVED}

## Follow-up Actions

**Immediate (completed):**
- [x] {action_1}
- [x] {action_2}

**Short-term (within 24 hours):**
- [ ] Post-mortem meeting
- [ ] Create proper fix story
- [ ] Update monitoring/alerting

**Long-term (backlog):**
- [ ] {prevention_measure_1}
- [ ] {prevention_measure_2}

## Communication

**Stakeholders notified:**
- {stakeholder_1} - {TIME}
- {stakeholder_2} - {TIME}

**Customer communication:** {yes/no and details}

**Status page updated:** {yes/no and link}

## Lessons Learned (Brief)

**What went well:**
- {positive_1}

**What could improve:**
- {improvement_1}

**Action items:**
- [ ] {action_item_1}
- [ ] {action_item_2}

---

**Incident Commander:** {PM_NAME}
**Last Updated:** {DATE_TIME}
