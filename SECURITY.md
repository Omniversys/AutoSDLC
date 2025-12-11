# Security Policy

## Reporting a Vulnerability

We take security seriously. If you discover a security vulnerability in AutoSDLC, please report it responsibly.

### How to Report

**Please DO NOT open a public issue for security vulnerabilities.**

Instead, use one of these methods:

1. **Preferred**: Use GitHub's [Security Advisories](https://github.com/Omniversys/AutoSDLC/advisories/new) feature
2. **Alternative**: Email the maintainers directly (check GitHub profiles for contact info)

### What to Include

When reporting a vulnerability, please provide:
- Description of the vulnerability
- Steps to reproduce or proof of concept
- Potential impact
- Suggested fix (if you have one)

### Response Timeline

- **Initial Response**: Within 48 hours
- **Status Update**: Within 7 days
- **Fix Timeline**: Depends on severity
  - Critical: 1-7 days
  - High: 7-30 days
  - Medium/Low: 30-90 days

### Scope

AutoSDLC is a configuration-based framework for Claude Code. Security concerns primarily involve:

#### In Scope
- YAML injection vulnerabilities in templates
- Path traversal in file operations
- Sensitive data exposure in configurations
- Malicious template execution
- Documentation that could lead to insecure usage

#### Out of Scope
- Issues with Claude Code itself (report to Anthropic)
- Issues in user projects (not framework-related)
- Social engineering attacks
- Denial of service against GitHub

### Disclosure Policy

- We will coordinate disclosure timing with the reporter
- We will credit the reporter (unless they prefer anonymity)
- We will publish a security advisory once a fix is available

### Security Updates

Security fixes will be:
- Released as patch versions
- Documented in CHANGELOG.md
- Announced via GitHub Security Advisories
- Backported to supported versions if applicable

## Best Practices for Users

When using AutoSDLC:

1. **Review Templates**: Inspect all templates before using them
2. **Validate Inputs**: Be cautious with user-provided configuration
3. **Keep Updated**: Use the latest version of AutoSDLC
4. **Limit Permissions**: Only grant necessary file system access
5. **Review Generated Files**: Check what agents create before committing

## Supported Versions

| Version | Supported          |
| ------- | ------------------ |
| 1.x.x   | :white_check_mark: |
| < 1.0   | :x:                |

We support the latest major version with security updates.

## Acknowledgments

We appreciate responsible disclosure and will acknowledge security researchers who help us improve AutoSDLC's security.
