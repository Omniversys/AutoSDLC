# Security Review Report: {STORY_ID}

**Reviewed by:** Security Expert
**Date:** {DATE}
**Story:** {STORY_TITLE}
**Reviewer:** {AGENT_NAME}

## Review Summary

**Overall Status:** ✅ APPROVED / ⚠️ APPROVED WITH FIXES / ❌ REJECTED

## OWASP Top 10 Review

### A01:2021 - Broken Access Control
- [ ] Authorization checks present on all protected resources
- [ ] Horizontal access control verified (user can't access other users' data)
- [ ] Vertical access control verified (privilege escalation prevented)
- **Findings:** {findings_or_none}

### A02:2021 - Cryptographic Failures
- [ ] Sensitive data encrypted at rest
- [ ] Sensitive data encrypted in transit (TLS 1.2+)
- [ ] Strong encryption algorithms used (AES-256, RSA-2048+)
- [ ] No hardcoded keys or secrets
- **Findings:** {findings_or_none}

### A03:2021 - Injection
- [ ] All input validated and sanitized
- [ ] Parameterized queries used (no string concatenation)
- [ ] Command injection prevented
- [ ] LDAP injection prevented (if applicable)
- **Findings:** {findings_or_none}

### A04:2021 - Insecure Design
- [ ] Threat model reviewed
- [ ] Security controls designed in from start
- [ ] Business logic vulnerabilities addressed
- **Findings:** {findings_or_none}

### A05:2021 - Security Misconfiguration
- [ ] Secure defaults configured
- [ ] No unnecessary features enabled
- [ ] Security headers configured (CSP, HSTS, X-Frame-Options)
- [ ] Error handling doesn't leak sensitive info
- **Findings:** {findings_or_none}

### A06:2021 - Vulnerable and Outdated Components
- [ ] All dependencies up to date
- [ ] No known high/critical CVEs
- [ ] Dependency scanning passed
- **Findings:** {findings_or_none}

### A07:2021 - Identification and Authentication Failures
- [ ] Strong password requirements
- [ ] Secure password hashing (bcrypt/Argon2)
- [ ] Session management secure
- [ ] MFA supported (if applicable)
- **Findings:** {findings_or_none}

### A08:2021 - Software and Data Integrity Failures
- [ ] Code integrity verified
- [ ] CI/CD pipeline secure
- [ ] Deserialization secure
- **Findings:** {findings_or_none}

### A09:2021 - Security Logging and Monitoring Failures
- [ ] Security events logged
- [ ] No sensitive data in logs
- [ ] Audit trail for critical operations
- **Findings:** {findings_or_none}

### A10:2021 - Server-Side Request Forgery
- [ ] SSRF prevention implemented (if applicable)
- [ ] URL validation on user-provided URLs
- **Findings:** {findings_or_none}

## Additional Security Checks

### Input Validation
- [ ] All external input validated
- [ ] Whitelist validation used
- [ ] Input length limits enforced
- **Findings:** {findings_or_none}

### API Security
- [ ] Rate limiting implemented
- [ ] API authentication required
- [ ] CORS properly configured
- **Findings:** {findings_or_none}

## Vulnerabilities Found

### Critical (Block Deployment)
{list_critical_vulnerabilities_or_none}

### High (Require Fix Before Merge)
{list_high_vulnerabilities_or_none}

### Medium (Fix Recommended)
{list_medium_vulnerabilities_or_none}

### Low (Optional Improvements)
{list_low_vulnerabilities_or_none}

## Security Testing Results

### SAST Scan
- **Tool:** {tool_name}
- **Result:** {pass/fail}
- **Findings:** {findings_summary}

### Dependency Scan
- **Tool:** {tool_name}
- **Critical CVEs:** {count}
- **High CVEs:** {count}
- **Details:** {details}

### Secret Scan
- **Tool:** {tool_name}
- **Secrets Found:** {count}
- **Details:** {details_or_none}

## Recommendations

### Required Before Merge
1. {required_fix_1}
2. {required_fix_2}

### Recommended Improvements
1. {improvement_1}
2. {improvement_2}

### Future Enhancements
1. {enhancement_1}
2. {enhancement_2}

## Approval Decision

**Decision:** ✅ APPROVED / ⚠️ APPROVED WITH CONDITIONS / ❌ REJECTED

**Conditions (if any):**
- {condition_1}
- {condition_2}

**Rationale:**
{explanation_of_decision}

**Security Expert Signature:** — Security Expert
**Date:** {DATE}
