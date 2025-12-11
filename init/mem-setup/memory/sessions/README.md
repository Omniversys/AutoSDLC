# Session Recordings

This directory contains recorded AI development sessions for **educational purposes**.

---

## 📁 What's Stored Here

Session recordings capture the complete interaction between you and the AI development team, including:

- User requests and questions
- AI agent responses and solutions
- Code changes and implementations
- Decision-making processes
- Architecture discussions
- Problem-solving approaches

---

## 🔒 Privacy & Security

**IMPORTANT:**
- ✅ Recordings are **LOCAL ONLY** (automatically gitignored)
- ✅ **NEVER committed** to your repository
- ✅ Safe to share manually for educational purposes
- ⚠️ May contain project-specific details - review before sharing
- ⚠️ Check for sensitive information (API keys, credentials, etc.)

---

## 📝 How to Use Session Recording

### Enable Recording

**Future messages only (default):**
```
"Enable session recording"
```

**Full session (include previous messages):**
```
"Enable session recording --full"
```

### Stop Recording

```
"Stop recording"
```

The AI will save the session and provide a summary.

---

## 📂 File Naming Convention

Sessions are automatically named with timestamps and task descriptions:

```
2025-12-11_14-30_feature-authentication.md
2025-12-11_16-45_bug-fix-login.md
2025-12-12_09-15_refactor-api-handlers.md
```

Format: `YYYY-MM-DD_HH-MM_task-description.md`

---

## 🎓 Educational Use

These recordings are valuable for:

- **Training new developers** - Show real-world AI-assisted development
- **Team knowledge sharing** - Document complex problem-solving
- **Process improvement** - Review and refine workflows
- **Documentation** - Capture architectural decisions and rationale
- **Case studies** - Demonstrate AutoSDLC capabilities

---

## 📊 Example Session Structure

Each recording includes:

1. **Session Summary** - Overview and outcomes
2. **Transcript** - Complete conversation with timestamps
3. **Key Decisions** - Important choices made
4. **Code Changes** - Files created/modified/deleted
5. **Learnings** - What worked, challenges, insights
6. **Metrics** - Message count, duration, agents used

---

## 🗂️ Organization Tips

As your recordings grow, consider organizing them:

```
sessions/
├── 2025-12/                    # Monthly folders
│   ├── authentication/         # By feature area
│   │   ├── 2025-12-11_14-30_jwt-implementation.md
│   │   └── 2025-12-12_10-15_oauth-integration.md
│   └── bug-fixes/
│       └── 2025-12-11_16-45_login-error.md
└── archive/                    # Older sessions
    └── 2025-11/
```

---

## 🧹 Maintenance

**Automatic Cleanup:**
- Recordings are gitignored by default
- Not synced to repository
- Stored only on your local machine

**Manual Cleanup:**
- Review recordings periodically
- Archive or delete old sessions
- Export important sessions for team sharing

---

## ⚠️ Before Sharing Sessions

Always review recordings before sharing to ensure:

- [ ] No API keys or credentials
- [ ] No sensitive business logic
- [ ] No personal information
- [ ] No proprietary code (if applicable)
- [ ] Appropriate context for audience

---

## 🔗 Related Documentation

- [ORCHESTRATOR.md](../../ORCHESTRATOR.md) - Session recording instructions
- [Memory System](../README.md) - How memory works in AutoSDLC
- [Templates](../../../templates/session-context/) - Recording format templates

---

*Session recordings help preserve knowledge and accelerate learning. Use them responsibly and share generously within your team!*
