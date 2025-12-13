# Gate 2: Epics & Stories Summary

**Project:** {project_name}  
**Date:** {date}  
**Status:** {status}  
**FEATURE/Parent Issue:** [{parent_issue_key}: {parent_issue_title}]({parent_issue_url})

---

## Overview

This document provides a complete mapping of all epics and user stories created for the {project_name} project. All stories are tracked in Jira under the {jira_project_key} project and linked to their parent epics and the master FEATURE.

**Total Scope:**
- **{phase_1_name}:** {phase_1_story_count} stories, {phase_1_story_points} story points
- **{phase_2_name}:** {phase_2_story_count} stories, {phase_2_story_points} story points
- **Complete Project:** {total_story_count} stories, {total_story_points} story points

---

## Epic Hierarchy

```
{parent_issue_key} (FEATURE: {parent_issue_title})
├── {epic_1_key} (Epic 1: {epic_1_title}) - {epic_1_points} points
├── {epic_2_key} (Epic 2: {epic_2_title}) - {epic_2_points} points
└── {epic_3_key} (Epic 3: {epic_3_title}) - {epic_3_points} points
```

---

## Epic 1: {epic_1_title}

**Jira Epic:** [{epic_1_key}]({epic_1_url})  
**Parent:** [{parent_issue_key}]({parent_issue_url})  
**Status:** {epic_1_status}  
**Priority:** {epic_1_priority}  
**Total Story Points:** {epic_1_points}

### Description
{epic_1_description}

### User Stories

| Story ID | Title | Story Points | Jira Link |
|----------|-------|--------------|-----------|
| {story_id_1} | {story_title_1} | {story_points_1} | [View]({story_url_1}) |
| {story_id_2} | {story_title_2} | {story_points_2} | [View]({story_url_2}) |

### Key Features
{epic_1_key_features}

### Dependencies
{epic_1_dependencies}

---

## Epic 2: {epic_2_title}

**Jira Epic:** [{epic_2_key}]({epic_2_url})  
**Parent:** [{parent_issue_key}]({parent_issue_url})  
**Status:** {epic_2_status}  
**Priority:** {epic_2_priority}  
**Total Story Points:** {epic_2_points}

### Description
{epic_2_description}

### User Stories

| Story ID | Title | Story Points | Jira Link |
|----------|-------|--------------|-----------|
| {story_id} | {story_title} | {story_points} | [View]({story_url}) |

### Key Features
{epic_2_key_features}

### Dependencies
{epic_2_dependencies}

---

## Epic 3: {epic_3_title}

**Jira Epic:** [{epic_3_key}]({epic_3_url})  
**Parent:** [{parent_issue_key}]({parent_issue_url})  
**Status:** {epic_3_status}  
**Priority:** {epic_3_priority}  
**Total Story Points:** {epic_3_points}

### Description
{epic_3_description}

### User Stories

| Story ID | Title | Story Points | Jira Link |
|----------|-------|--------------|-----------|
| {story_id} | {story_title} | {story_points} | [View]({story_url}) |

### Key Features
{epic_3_key_features}

### Dependencies
{epic_3_dependencies}

---

## Story Dependencies Map

### Epic 1 Dependencies
```
{epic_1_dependency_graph}
```

### Epic 2 Dependencies
```
{epic_2_dependency_graph}
```

### Epic 3 Dependencies
```
{epic_3_dependency_graph}
```

---

## {primary_scope_name} Summary

**Total Stories:** {primary_scope_story_count}  
**Total Story Points:** {primary_scope_story_points}  
**Estimated Duration:** {estimated_duration}

### Critical Path
{critical_path_list}

**Parallel Workstreams:**
{parallel_workstreams_list}

---

## Acceptance Criteria Status

All stories have detailed acceptance criteria defined in Jira. Each story includes:
- User story format (As a... I want... So that...)
- Checkbox-based acceptance criteria
- Story point estimate
- Epic assignment
- Dependency documentation

---

## Next Steps

1. **Gate 2 Approval:** Review and approve this story breakdown
2. **Gate 3:** Solution Architect presents architecture options for:
   {architecture_decision_areas}
3. **Gate 4:** Sprint planning and task breakdown

---

## References

- **PSA:** `docs/PSA.md`
- **Jira Project:** [{jira_project_name}]({jira_project_url})
- **EWO:** [{parent_issue_key}]({parent_issue_url})
- **Workflow:** agile-two-phase (`.AutoSDLC-framework/workflows/agile-two-phase.yaml`)

---

**Document Status:** {document_status}  
**Last Updated:** {last_updated}  
**Prepared By:** Product Owner (AutoSDLC)
