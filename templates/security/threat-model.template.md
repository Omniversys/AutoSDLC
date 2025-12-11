# Threat Model: {FEATURE_ID}

**Date:** {DATE}
**Security Expert:** {AGENT_NAME}
**Feature:** {FEATURE_NAME}

## Overview

### Feature Description
{brief_description_of_feature}

### Assets to Protect
- {asset_1} (e.g., user credentials, payment data, PII)
- {asset_2}
- {asset_3}

### Trust Boundaries
{describe_where_data_crosses_trust_boundaries}

## Architecture Diagram

```
{ascii_diagram_or_description}
```

## Entry Points

| Entry Point | Authentication Required | Input Validation | Notes |
|-------------|------------------------|------------------|-------|
| {endpoint_1} | Yes/No | {validation_method} | {notes} |
| {endpoint_2} | Yes/No | {validation_method} | {notes} |

## STRIDE Threat Analysis

### Spoofing Identity
- **Threat:** {threat_description}
- **Likelihood:** High/Medium/Low
- **Impact:** High/Medium/Low
- **Risk:** {likelihood × impact}
- **Mitigation:** {mitigation_strategy}

### Tampering with Data
- **Threat:** {threat_description}
- **Likelihood:** High/Medium/Low
- **Impact:** High/Medium/Low
- **Risk:** {likelihood × impact}
- **Mitigation:** {mitigation_strategy}

### Repudiation
- **Threat:** {threat_description}
- **Likelihood:** High/Medium/Low
- **Impact:** High/Medium/Low
- **Risk:** {likelihood × impact}
- **Mitigation:** {mitigation_strategy}

### Information Disclosure
- **Threat:** {threat_description}
- **Likelihood:** High/Medium/Low
- **Impact:** High/Medium/Low
- **Risk:** {likelihood × impact}
- **Mitigation:** {mitigation_strategy}

### Denial of Service
- **Threat:** {threat_description}
- **Likelihood:** High/Medium/Low
- **Impact:** High/Medium/Low
- **Risk:** {likelihood × impact}
- **Mitigation:** {mitigation_strategy}

### Elevation of Privilege
- **Threat:** {threat_description}
- **Likelihood:** High/Medium/Low
- **Impact:** High/Medium/Low
- **Risk:** {likelihood × impact}
- **Mitigation:** {mitigation_strategy}

## Risk Summary

### High Risk Threats
1. {threat_1} - {mitigation_required}
2. {threat_2} - {mitigation_required}

### Medium Risk Threats
1. {threat_1} - {mitigation_recommended}
2. {threat_2} - {mitigation_recommended}

### Low Risk Threats
1. {threat_1} - {accept_or_monitor}

## Residual Risks

After all mitigations:
- {residual_risk_1}
- {residual_risk_2}

## Security Stories Created

- [ ] STORY-{ID}: {mitigation_story_1}
- [ ] STORY-{ID}: {mitigation_story_2}

## Approval

**Security Expert Approval:** {APPROVED/REJECTED}
**Date:** {DATE}
**Notes:** {any_additional_notes}
