# Hotfix Verification: HOTFIX-{ID}

**Verified by:** {QA_AGENT_NAME}
**Date:** {DATE_TIME}
**Fix PR/Commit:** {PR_OR_COMMIT_LINK}

## Pre-Fix State

**Issue reproduced:** ✅ Yes / ❌ No

**Reproduction steps:**
1. {step_1}
2. {step_2}
3. {step_3}

**Observed behavior:** {what_happened}

**Expected behavior:** {what_should_happen}

## Fix Verification

**Fix applied:** ✅ Yes
**Environment:** Local / Staging / Production

**Verification steps:**
1. {verification_step_1}
2. {verification_step_2}
3. {verification_step_3}

**Result:** ✅ Issue RESOLVED / ❌ Issue PERSISTS

**Details:** {verification_details}

## Smoke Testing

**Critical paths tested:**
- [ ] {critical_path_1} - ✅ PASS / ❌ FAIL
- [ ] {critical_path_2} - ✅ PASS / ❌ FAIL
- [ ] {critical_path_3} - ✅ PASS / ❌ FAIL

**New issues found:** {yes/no and details}

## Automated Tests

**Test suite run:** ✅ Yes / ❌ Skipped (time constraint)

**Results:**
- Tests passed: {number}
- Tests failed: {number}
- Tests skipped: {number}

**Failures:** {details_or_none}

## Production Verification (After Deployment)

**Deployed at:** {TIME}

**Monitoring (first 15 minutes):**
- Error rate: {normal/elevated}
- Response time: {normal/degraded}
- User complaints: {none/some/many}

**Issue status:** ✅ RESOLVED / ⚠️ IMPROVED / ❌ PERSISTS

**Production notes:** {observations}

## Rollback Assessment

**Rollback needed:** ✅ Yes / ❌ No

**If Yes, reason:** {why_rollback_needed}

**If No, confidence level:** High / Medium / Low

## QA Approval

**Approval Status:** ✅ APPROVED FOR DEPLOYMENT / ❌ NOT APPROVED

**Conditions:**
- {condition_or_none}

**Concerns:**
- {concern_or_none}

**QA Signature:** — QA Automation
**Date:** {DATE_TIME}
