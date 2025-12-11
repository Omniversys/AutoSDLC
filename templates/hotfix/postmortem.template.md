# Postmortem: HOTFIX-{ID}

**Date:** {DATE}
**Incident:** {INCIDENT_TITLE}
**Duration:** {DURATION_MINUTES} minutes
**Severity:** {P0/P1/P2}
**Author:** {PM_NAME}

## Executive Summary

{2-3_sentence_summary_of_incident_and_resolution}

## Impact

- **Users affected:** {number_or_percentage}
- **Duration:** {time_from_start_to_resolution}
- **Revenue impact:** {dollar_amount_or_estimate}
- **Data impact:** {any_data_loss_or_corruption}
- **Reputation impact:** {customer_complaints_media_coverage}

## Timeline (Detailed)

| Time (UTC) | Event | Who |
|------------|-------|-----|
| {TIME} | {event_description} | {person_or_system} |
| {TIME} | {event_description} | {person_or_system} |
| {TIME} | {event_description} | {person_or_system} |

## Root Cause Analysis

### What Happened

{detailed_technical_explanation}

### Why It Happened

**Immediate cause:** {proximate_cause}

**Contributing factors:**
1. {factor_1}
2. {factor_2}
3. {factor_3}

### Why It Wasn't Caught Earlier

**Testing gap:** {what_tests_were_missing}

**Monitoring gap:** {what_alerts_were_missing}

**Process gap:** {what_process_failed}

## What Went Well

1. {positive_1}
2. {positive_2}
3. {positive_3}

## What Didn't Go Well

1. {issue_1}
2. {issue_2}
3. {issue_3}

## Where We Got Lucky

{things_that_could_have_been_worse}

## Action Items

### Prevent Recurrence

| Action | Owner | Due Date | Priority | Status |
|--------|-------|----------|----------|--------|
| {action_1} | {owner} | {date} | High | Not Started |
| {action_2} | {owner} | {date} | Medium | Not Started |

### Improve Detection

| Action | Owner | Due Date | Priority | Status |
|--------|-------|----------|----------|--------|
| {action_1} | {owner} | {date} | High | Not Started |
| {action_2} | {owner} | {date} | Medium | Not Started |

### Improve Response

| Action | Owner | Due Date | Priority | Status |
|--------|-------|----------|----------|--------|
| {action_1} | {owner} | {date} | High | Not Started |
| {action_2} | {owner} | {date} | Medium | Not Started |

## Proper Fix

**Hotfix was:** Full fix / Temporary workaround

**If temporary, proper fix required:**
- [ ] Story created: {STORY_ID}
- [ ] Scheduled for: {SPRINT_OR_DATE}
- [ ] Description: {proper_fix_description}

## Communication

**Internal notification:** {who_was_notified_and_when}

**Customer notification:** {yes/no and details}

**Public postmortem:** {yes/no and reason}

## Lessons Learned

### Technical Lessons

1. {lesson_1}
2. {lesson_2}

### Process Lessons

1. {lesson_1}
2. {lesson_2}

### Team Lessons

1. {lesson_1}
2. {lesson_2}

## Blameless Culture Note

{reminder_that_this_was_a_system_failure_not_individual_failure}

---

**Meeting held:** {DATE}
**Attendees:** {list_of_attendees}
**Documented by:** {PM_NAME}
