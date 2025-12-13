# JIRA Workflow Configuration

**Project:** {project_name}  
**JIRA Project Key:** {jira_project_key}  
**JIRA Project Name:** {jira_project_name}  
**JIRA Project URL:** {jira_project_url}  
**Last Updated:** {date}  
**Learned By:** PM Agent  

---

## Project Access

**Verified Access:** {yes/no}  
**User Permissions:** {permissions_list}  
**Available Issue Types:** {issue_types_list}

---

## Issue Type: Epic

### Available Statuses
{epic_status_list}

### Workflow Transitions

| From Status | To Status | Transition Name | Transition ID | Required Fields |
|-------------|-----------|-----------------|---------------|-----------------|
| {from_status} | {to_status} | {transition_name} | {transition_id} | {fields} |

### Custom Fields
- **Epic Name:** {field_id} - {required/optional}
- **Epic Link:** {field_id} - {required/optional}
- {custom_field_name}: {field_id} - {required/optional}

---

## Issue Type: Story

### Available Statuses
{story_status_list}

### Workflow Transitions

| From Status | To Status | Transition Name | Transition ID | Required Fields |
|-------------|-----------|-----------------|---------------|-----------------|
| {from_status} | {to_status} | {transition_name} | {transition_id} | {fields} |

### Custom Fields
- **Story Points:** {field_id} - {required/optional}
- **Epic Link:** {field_id} - {required/optional}
- **Sprint:** {field_id} - {required/optional}
- {custom_field_name}: {field_id} - {required/optional}

---

## Issue Type: Task

### Available Statuses
{task_status_list}

### Workflow Transitions

| From Status | To Status | Transition Name | Transition ID | Required Fields |
|-------------|-----------|-----------------|---------------|-----------------|
| {from_status} | {to_status} | {transition_name} | {transition_id} | {fields} |

### Custom Fields
- **Story Points:** {field_id} - {required/optional}
- {custom_field_name}: {field_id} - {required/optional}

---

## Issue Type: Sub-task

### Available Statuses
{subtask_status_list}

### Workflow Transitions

| From Status | To Status | Transition Name | Transition ID | Required Fields |
|-------------|-----------|-----------------|---------------|-----------------|
| {from_status} | {to_status} | {transition_name} | {transition_id} | {fields} |

### Custom Fields
- **Parent Link:** {field_id} - {required/optional}
- {custom_field_name}: {field_id} - {required/optional}

---

## Issue Type: Bug

### Available Statuses
{bug_status_list}

### Workflow Transitions

| From Status | To Status | Transition Name | Transition ID | Required Fields |
|-------------|-----------|-----------------|---------------|-----------------|
| {from_status} | {to_status} | {transition_name} | {transition_id} | {fields} |

### Custom Fields
- **Priority:** {field_id} - {required/optional}
- **Severity:** {field_id} - {required/optional}
- {custom_field_name}: {field_id} - {required/optional}

---

## Multi-Project Configuration (Optional)

**Secondary Projects:**

### Project: {secondary_project_key}
- **Name:** {secondary_project_name}
- **URL:** {secondary_project_url}
- **Purpose:** {e.g., "Frontend components", "Infrastructure"}
- **Issue Types:** {available_issue_types}
- **Workflow Reference:** See separate workflow file if significantly different

---

## Offline Mode Queue

**When JIRA MCP is unavailable:**

### Pending Updates
{pending_updates_list}

**Example:**
```yaml
- issue_key: PROJ-123
  action: transition
  from_status: "In Progress"
  to_status: "Done"
  timestamp: 2025-12-13T14:30:00Z
  gate: gate_5
  
- issue_key: PROJ-456
  action: create_subtask
  parent: PROJ-123
  title: "Implement API endpoint"
  timestamp: 2025-12-13T15:00:00Z
  gate: gate_4
```

**Flush Queue:** When MCP becomes available, PM executes all pending updates in chronological order.

---

## Workflow Re-learning Log

**History of workflow discoveries:**

| Date | Trigger | Issue Type | Changes Discovered | Updated By |
|------|---------|------------|-------------------|------------|
| {date} | Initial setup | All | Complete workflow learned | PM |
| {date} | Gate 3 update | Epic | New status "Ready for Review" found | PM |

---

## Notes

- **Workflow Discovery Method:** Test item creation and transition exploration
- **Test Items Created:** {list_of_test_items_with_status}
- **Common Transitions:**
  - Start work: "To Do" → "In Progress"
  - Complete: "In Progress" → "Done"
  - Block: Any → "Blocked" (if available)
  - Reopen: "Done" → "To Do" or "In Progress"

---

**Document Status:** {Active/Archived}  
**Maintained By:** PM Agent  
**Sync Strategy:** Auto-update when new transitions discovered
