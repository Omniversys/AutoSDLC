# Gate 2: Epics & Stories Summary

**Project:** Room-readiness AI Agent  
**Date:** 2025-12-11  
**Status:** Complete - Pending Approval  
**EWO:** [CAAD-7: Conference Room AI Agent](https://crestroneng.atlassian.net/browse/CAAD-7)

---

## Overview

This document provides a complete mapping of all epics and user stories created for the Room-readiness AI Agent project. All stories are tracked in Jira under the CAAD project and linked to their parent epics and the master EWO.

**Total Scope:**
- **PoC Scope (Epics 1 & 2):** 12 stories, 94 story points
- **Post-PoC (Epic 3):** 7 stories, 102 story points
- **Complete Project:** 19 stories, 196 story points

---

## Epic Hierarchy

```
CAAD-7 (EWO: Conference Room AI Agent)
├── CAAD-8 (Epic 1: Core Inference & Scoring) - 44 points
├── CAAD-10 (Epic 2: Infrastructure & Deployment) - 50 points
└── CAAD-9 (Epic 3: Post-PoC Enhancements & Integration) - 102 points
```

---

## Epic 1: Core Inference & Scoring

**Jira Epic:** [CAAD-8](https://crestroneng.atlassian.net/browse/CAAD-8)  
**Parent:** [CAAD-7](https://crestroneng.atlassian.net/browse/CAAD-7)  
**Status:** Not Started  
**Priority:** High  
**Total Story Points:** 44

### Description
Build the complete AI inference pipeline from image capture through scoring. Includes both cloud and edge inference paths, security framework, and data persistence for the PoC.

### User Stories

| Story ID | Title | Story Points | Jira Link |
|----------|-------|--------------|-----------|
| CAAD-11 | Image Capture Pipeline | 5 | [View](https://crestroneng.atlassian.net/browse/CAAD-11) |
| CAAD-12 | Cloud Inference Engine - Model Integration | 8 | [View](https://crestroneng.atlassian.net/browse/CAAD-12) |
| CAAD-13 | Cloud Inference Engine - Scoring Logic | 5 | [View](https://crestroneng.atlassian.net/browse/CAAD-13) |
| CAAD-14 | Edge Inference Engine | 13 | [View](https://crestroneng.atlassian.net/browse/CAAD-14) |
| CAAD-15 | Data Persistence Layer | 5 | [View](https://crestroneng.atlassian.net/browse/CAAD-15) |
| CAAD-16 | Security & Privacy Framework | 8 | [View](https://crestroneng.atlassian.net/browse/CAAD-16) |

### Key Features
- Image capture with vacancy detection triggers
- Cloud-based inference using Azure AI (VLM/CV models)
- Edge/on-device inference for privacy-preserving processing
- Factor-specific scoring: cleanliness, chairs, cables, markers/erasers
- Weighted composite score computation
- Baseline image comparison capability
- Secure data persistence with encryption
- Azure AD/Entra authentication and RBAC
- Face redaction/blur for privacy

### Dependencies
- None (can begin immediately after Gate 2 approval)

---

## Epic 2: Infrastructure & Deployment

**Jira Epic:** [CAAD-10](https://crestroneng.atlassian.net/browse/CAAD-10)  
**Parent:** [CAAD-7](https://crestroneng.atlassian.net/browse/CAAD-7)  
**Status:** Not Started  
**Priority:** High  
**Total Story Points:** 50

### Description
Establish the evaluation framework, deployment infrastructure, and operational capabilities for both cloud and edge inference paths. Includes model evaluation, infrastructure setup, CI/CD pipelines, and administrative tooling.

### User Stories

| Story ID | Title | Story Points | Jira Link |
|----------|-------|--------------|-----------|
| CAAD-17 | Model Evaluation Framework | 8 | [View](https://crestroneng.atlassian.net/browse/CAAD-17) |
| CAAD-18 | Performance Benchmarking | 5 | [View](https://crestroneng.atlassian.net/browse/CAAD-18) |
| CAAD-19 | Cloud Infrastructure Setup | 8 | [View](https://crestroneng.atlassian.net/browse/CAAD-19) |
| CAAD-20 | Edge Infrastructure & Deployment Tooling | 13 | [View](https://crestroneng.atlassian.net/browse/CAAD-20) |
| CAAD-21 | Configuration & Administration Interface | 8 | [View](https://crestroneng.atlassian.net/browse/CAAD-21) |
| CAAD-22 | CI/CD Pipeline & Monitoring | 8 | [View](https://crestroneng.atlassian.net/browse/CAAD-22) |

### Key Features
- Model evaluation framework with human-labeled dataset
- Comparative analysis of VLM vs CV models
- Performance benchmarking (latency, throughput, resources)
- Azure AI services and compute infrastructure
- Edge deployment infrastructure and hardware assessment
- Configuration and administration UI
- Room baseline and parameter management
- CI/CD pipelines for model deployment
- Monitoring, observability, and alerting

### Dependencies
- Epic 1 components (for model evaluation and benchmarking)
- Can run in parallel with Epic 1 for infrastructure setup

---

## Epic 3: Post-PoC Enhancements & Integration

**Jira Epic:** [CAAD-9](https://crestroneng.atlassian.net/browse/CAAD-9)  
**Parent:** [CAAD-7](https://crestroneng.atlassian.net/browse/CAAD-7)  
**Status:** Future (Deferred)  
**Priority:** Low  
**Total Story Points:** 102

### Description
Production-ready features including advanced analytics, XiO Cloud integration, automated alerting, and enhanced security/governance capabilities. This epic is deferred to post-PoC phase.

### User Stories

| Story ID | Title | Story Points | Jira Link |
|----------|-------|--------------|-----------|
| CAAD-23 | Advanced Analytics & Insights Engine | 13 | [View](https://crestroneng.atlassian.net/browse/CAAD-23) |
| CAAD-24 | XiO Cloud Alerting Integration | 13 | [View](https://crestroneng.atlassian.net/browse/CAAD-24) |
| CAAD-25 | Outlook/Teams API Integration | 8 | [View](https://crestroneng.atlassian.net/browse/CAAD-25) |
| CAAD-26 | Production Data Governance Framework | 13 | [View](https://crestroneng.atlassian.net/browse/CAAD-26) |
| CAAD-27 | Enhanced Privacy Features | 13 | [View](https://crestroneng.atlassian.net/browse/CAAD-27) |
| CAAD-28 | Multi-Tenant Architecture | 21 | [View](https://crestroneng.atlassian.net/browse/CAAD-28) |
| CAAD-29 | Mobile Facilities App | 21 | [View](https://crestroneng.atlassian.net/browse/CAAD-29) |

### Key Features
- Advanced analytics dashboards and insights
- Historical trend tracking and predictive analytics
- XiO Cloud integration for automated alerting
- SLA-backed remediation workflow automation
- Outlook/Teams API integration for context-aware alerts
- Production-grade data governance and compliance
- Advanced privacy-preserving ML techniques (federated learning, differential privacy)
- Multi-tenant deployment capabilities
- Mobile app for facilities teams

### Dependencies
- Epic 1 and Epic 2 must be complete
- Requires XiO Cloud API access
- Requires Microsoft Graph API access
- Post-PoC phase only

---

## Story Dependencies Map

### Epic 1 Dependencies
```
CAAD-11 (Image Capture)
    ↓
CAAD-12 (Cloud Inference - Models) ← Independent
    ↓
CAAD-13 (Cloud Inference - Scoring) ← Depends on CAAD-12
    
CAAD-14 (Edge Inference) ← Independent
    
CAAD-15 (Data Persistence) ← Depends on CAAD-13, CAAD-14
    ↓
CAAD-16 (Security & Privacy) ← Depends on CAAD-15
```

### Epic 2 Dependencies
```
CAAD-19 (Cloud Infrastructure) ← Independent (can run in parallel with Epic 1)
    
CAAD-12, CAAD-14 (from Epic 1)
    ↓
CAAD-17 (Model Evaluation) ← Depends on CAAD-12, CAAD-14
    ↓
CAAD-18 (Performance Benchmarking) ← Depends on CAAD-12, CAAD-14
    
CAAD-14 (from Epic 1)
    ↓
CAAD-20 (Edge Infrastructure) ← Depends on CAAD-14
    
CAAD-15 (from Epic 1)
    ↓
CAAD-21 (Config & Admin Interface) ← Depends on CAAD-15
    
CAAD-19, CAAD-20
    ↓
CAAD-22 (CI/CD & Monitoring) ← Depends on CAAD-19, CAAD-20
```

### Epic 3 Dependencies
```
CAAD-15 (from Epic 1)
    ↓
CAAD-23 (Advanced Analytics) ← Depends on CAAD-15
    
CAAD-13, CAAD-15 (from Epic 1)
    ↓
CAAD-24 (XiO Cloud Integration) ← Depends on CAAD-13, CAAD-15
    ↓
CAAD-25 (Outlook/Teams Integration) ← Depends on CAAD-24
    
CAAD-15, CAAD-16 (from Epic 1)
    ↓
CAAD-26 (Data Governance) ← Depends on CAAD-15, CAAD-16
    
CAAD-14, CAAD-16 (from Epic 1)
    ↓
CAAD-27 (Enhanced Privacy) ← Depends on CAAD-14, CAAD-16
    
CAAD-15, CAAD-16, CAAD-21 (from Epics 1 & 2)
    ↓
CAAD-28 (Multi-Tenant) ← Depends on CAAD-15, CAAD-16, CAAD-21
    
CAAD-13, CAAD-15, CAAD-24 (from Epics 1 & 3)
    ↓
CAAD-29 (Mobile App) ← Depends on CAAD-13, CAAD-15, CAAD-24
```

---

## PoC Scope Summary (Epics 1 & 2)

**Total Stories:** 12  
**Total Story Points:** 94  
**Estimated Duration:** 3-4 weeks (assuming 2-3 developers)

### Critical Path
1. CAAD-11 (Image Capture) - 5 pts
2. CAAD-12 (Cloud Inference - Models) - 8 pts
3. CAAD-13 (Cloud Inference - Scoring) - 5 pts
4. CAAD-17 (Model Evaluation) - 8 pts
5. CAAD-18 (Performance Benchmarking) - 5 pts
6. CAAD-15 (Data Persistence) - 5 pts
7. CAAD-16 (Security & Privacy) - 8 pts

**Parallel Workstreams:**
- Edge path: CAAD-14 (13 pts) → CAAD-20 (13 pts)
- Infrastructure: CAAD-19 (8 pts) → CAAD-22 (8 pts)
- Admin: CAAD-21 (8 pts)

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
   - Cloud vs Edge deployment strategy
   - VLM vs CV model selection approach
   - Data persistence architecture
   - Security framework design
3. **Gate 4:** Sprint planning and task breakdown

---

## References

- **PSA:** `docs/PSA.md`
- **Jira Project:** [CAAD - Crestron Advanced Engineering Team](https://crestroneng.atlassian.net/browse/CAAD)
- **EWO:** [CAAD-7](https://crestroneng.atlassian.net/browse/CAAD-7)
- **Workflow:** agile-two-phase (`.AutoSDLC-framework/workflows/agile-two-phase.yaml`)

---

**Document Status:** Complete  
**Last Updated:** 2025-12-11  
**Prepared By:** Product Owner (AutoSDLC)
