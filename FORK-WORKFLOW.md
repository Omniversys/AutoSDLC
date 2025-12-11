# Fork Workflow Guide

Complete guide for forking AutoSDLC for personal or organizational customizations.

---

## 🤔 Should You Fork?

### Use In-Place Customization (No Fork Needed)

✅ **Customize without forking** if you need:
- Override agent personalities (`config/agents-override.yaml`)
- Adjust workflow timings (`project.yaml`)
- Custom document templates (project `templates/` directory)
- Project-specific rules

**Benefit**: Automatic updates from upstream AutoSDLC

### Fork AutoSDLC If You Need

🔀 **Fork** when you need:
- ✏️ Modify core agent behaviors permanently
- 🏢 Organization-wide workflow customizations
- 🔒 Custom quality gates or approval processes
- 📋 Different default templates
- 🎨 Branded agent personalities
- 🔐 Proprietary additions (internal tools integration)

**Trade-off**: You manage merging upstream updates

---

## 🍴 Individual Developer Fork

### Step 1: Fork on GitHub

1. Go to https://github.com/dondetir/AutoSDLC
2. Click **Fork** button (top right)
3. Select your account as destination
4. Wait for fork to complete

Result: `https://github.com/YOUR-USERNAME/AutoSDLC`

### Step 2: Install from Your Fork

**Linux/Mac:**

```bash
# Using environment variable
AutoSDLC_REPO=https://github.com/YOUR-USERNAME/AutoSDLC.git bash <(curl -fsSL https://raw.githubusercontent.com/dondetir/AutoSDLC/main/install-AutoSDLC.sh)

# Or clone manually
git clone https://github.com/YOUR-USERNAME/AutoSDLC.git .AutoSDLC-framework
cd .AutoSDLC-framework
git remote add upstream https://github.com/dondetir/AutoSDLC.git
git remote -v
# origin    https://github.com/YOUR-USERNAME/AutoSDLC.git (fetch)
# origin    https://github.com/YOUR-USERNAME/AutoSDLC.git (push)
# upstream  https://github.com/dondetir/AutoSDLC.git (fetch)
# upstream  https://github.com/dondetir/AutoSDLC.git (push)
```

**Windows:**

```powershell
# Using environment variable
$env:AutoSDLC_REPO = "https://github.com/YOUR-USERNAME/AutoSDLC.git"
iex (iwr https://raw.githubusercontent.com/dondetir/AutoSDLC/main/install-AutoSDLC.ps1)

# Or clone manually
git clone https://github.com/YOUR-USERNAME/AutoSDLC.git .AutoSDLC-framework
cd .AutoSDLC-framework
git remote add upstream https://github.com/dondetir/AutoSDLC.git
git remote -v
```

### Step 3: Make Your Customizations

```bash
cd .AutoSDLC-framework
git checkout -b custom/my-modifications

# Edit files
vim agents/backend-dev.yaml  # Customize agent behavior
vim config/rules.yaml        # Modify quality rules

git add .
git commit -m "Customize backend dev agent for our stack"
git push origin custom/my-modifications
```

### Step 4: Merge to Your Fork's Main

```bash
# Via GitHub UI: Create PR from custom/my-modifications → main in YOUR fork
# Then merge

# Or locally:
git checkout main
git merge custom/my-modifications
git push origin main
```

### Step 5: Keep Your Fork Updated

**Monthly or before starting new projects:**

```bash
cd .AutoSDLC-framework

# Fetch latest from upstream
git fetch upstream

# See what changed
git log main..upstream/main --oneline

# Update your main branch
git checkout main
git merge upstream/main  # Or: git rebase upstream/main

# Resolve conflicts if any (see troubleshooting below)

# Push updates to your fork
git push origin main
```

**Merge vs Rebase:**
- `git merge upstream/main` - Preserves complete history, creates merge commit
- `git rebase upstream/main` - Cleaner history, replays your changes on top of upstream

---

## 🏢 Organization Fork

### Why Organizations Fork

- **Standardization**: Enforce company-wide workflows
- **Compliance**: Add industry-specific quality gates
- **Integration**: Connect to internal tools (Jira, ServiceNow, etc.)
- **Branding**: Customize agent personalities for company culture
- **Security**: Add security scanning requirements
- **Proprietary IP**: Keep internal customizations private

### Step 1: Create Organization Fork

**As org admin:**

1. Fork https://github.com/dondetir/AutoSDLC to `yourcompany/AutoSDLC`
2. Create `custom` or `company` branch for modifications
3. Set up branch protection on `main` (require PRs, reviews)

```bash
# Clone org fork
git clone git@github.com:yourcompany/AutoSDLC.git AutoSDLC-org
cd AutoSDLC-org

# Add upstream
git remote add upstream https://github.com/dondetir/AutoSDLC.git

# Create customization branch
git checkout -b company/customizations
```

### Step 2: Apply Company Customizations

**Example: Add compliance gates**

```yaml
# config/rules.yaml
quality_gates:
  compliance_check:
    enabled: true
    agents: ["security-expert", "qa-manual"]
    requirements:
      - "SOC2 compliance verified"
      - "GDPR data handling reviewed"
      - "Audit trail generated"
```

**Example: Custom security agent**

```yaml
# agents/security-expert.yaml
personality:
  name: "SecureGuard AI"
  style: "Vigilant and thorough, prioritizes security over speed"
  
  company_specific:
    - "Always check against ACME Corp security policies"
    - "Reference internal security wiki: wiki.acme.com/security"
    - "Escalate high-severity findings to security@acme.com"
```

**Commit changes:**

```bash
git add config/rules.yaml agents/security-expert.yaml
git commit -m "Add ACME Corp compliance and security customizations"
git push origin company/customizations
```

### Step 3: Merge to Org Fork Main

```bash
# Create PR: company/customizations → main
# Require reviews from: Tech Lead, Security Lead

# After approval, merge
git checkout main
git merge company/customizations
git tag v1.0.0-acme
git push origin main --tags
```

### Step 4: Developer Installation from Org Fork

**Internal installation script: `install-acme-AutoSDLC.sh`**

```bash
#!/bin/bash
# ACME Corp AutoSDLC Installation

AutoSDLC_REPO="git@github.com:yourcompany/AutoSDLC.git"

echo "🏢 Installing ACME AutoSDLC"
curl -fsSL https://raw.githubusercontent.com/dondetir/AutoSDLC/main/install-AutoSDLC.sh | \
  AutoSDLC_REPO=$AutoSDLC_REPO bash
```

**Distribute to developers:**

```bash
bash <(curl -fsSL https://your-company.com/install-acme-AutoSDLC.sh)
```

### Step 5: Keep Org Fork Synchronized

**Monthly sync process (automated via CI/CD):**

```bash
# .github/workflows/sync-upstream.yml
name: Sync with Upstream AutoSDLC

on:
  schedule:
    - cron: '0 0 1 * *'  # First day of each month
  workflow_dispatch:      # Manual trigger

jobs:
  sync:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Fetch upstream
        run: |
          git remote add upstream https://github.com/dondetir/AutoSDLC.git
          git fetch upstream
      
      - name: Create PR for upstream changes
        run: |
          git checkout -b sync/upstream-$(date +%Y%m%d)
          git merge upstream/main --no-commit --no-ff || true
          git status
          # Create PR automatically (requires GitHub CLI)
          gh pr create \
            --title "Sync with upstream AutoSDLC" \
            --body "Monthly sync of upstream changes. Review conflicts carefully." \
            --base main \
            --head sync/upstream-$(date +%Y%m%d)
```

**Manual sync (when GitHub Actions unavailable):**

```bash
cd AutoSDLC-org

# Fetch upstream
git fetch upstream

# Create sync branch
git checkout -b sync/upstream-2025-12
git merge upstream/main

# Resolve conflicts (keep company customizations)
# Test thoroughly

# Create PR for team review
git push origin sync/upstream-2025-12
# Open PR on GitHub: sync/upstream-2025-12 → main
```

### Step 6: Contributing Back to Main AutoSDLC

**When to contribute upstream:**
- Bug fixes that benefit everyone
- General improvements (no company-specific logic)
- New workflow types (hotfix, canary deployment, etc.)
- Documentation improvements

**Process:**

```bash
# Work in your org fork
cd AutoSDLC-org
git checkout -b feature/improve-error-handling

# Make changes (generic, not company-specific)
vim agents/pm.yaml

git commit -m "Improve PM error handling for missing status.yaml"

# Push to your org fork
git push origin feature/improve-error-handling

# Create PR to UPSTREAM (dondetir/AutoSDLC)
# Go to GitHub: yourcompany/AutoSDLC → New Pull Request
# Change base repository to: dondetir/AutoSDLC
# Submit PR with clear description
```

---

## 🔄 Sync Strategies

### Strategy 1: Regular Merge (Recommended for Most)

**Pros**: Preserves full history, easier to understand
**Cons**: Merge commits clutter history

```bash
git fetch upstream
git checkout main
git merge upstream/main
git push origin main
```

### Strategy 2: Rebase (Clean History)

**Pros**: Linear history, cleaner git log
**Cons**: Rewrites history, potential conflicts

```bash
git fetch upstream
git checkout main
git rebase upstream/main
# Resolve conflicts if any
git push origin main --force-with-lease  # Careful!
```

### Strategy 3: Cherry-Pick (Selective Updates)

**Pros**: Choose specific upstream commits
**Cons**: More manual work, can miss related changes

```bash
git fetch upstream
git log upstream/main --oneline  # Find commits you want
git cherry-pick abc123           # Apply specific commit
git cherry-pick def456
git push origin main
```

### Strategy 4: Two-Branch System (Enterprise)

**Maintain two branches:**
- `main` - Tracks upstream exactly (auto-sync)
- `company` - Your customizations

```bash
# main branch: mirror of upstream
git checkout main
git fetch upstream
git reset --hard upstream/main
git push origin main --force

# company branch: merge main into it
git checkout company
git merge main
# Resolve conflicts (keep company customizations)
git push origin company

# Developers install from 'company' branch
```

---

## 🆘 Troubleshooting

### Merge Conflicts During Sync

**Symptom:**
```
Auto-merging agents/backend-dev.yaml
CONFLICT (content): Merge conflict in agents/backend-dev.yaml
Automatic merge failed; fix conflicts and then commit the result.
```

**Solution:**

```bash
# Open conflicted file
vim agents/backend-dev.yaml

# You'll see:
<<<<<<< HEAD
  style: "Our company style"
=======
  style: "Upstream style"
>>>>>>> upstream/main

# Choose what to keep:
# - Keep HEAD (your customization)
# - Keep upstream (take their change)
# - Keep both (merge manually)

# After resolving:
git add agents/backend-dev.yaml
git commit -m "Merge upstream, keep company customizations"
git push origin main
```

### Accidentally Pushed to Wrong Remote

**Symptom:**
```
Pushed to upstream instead of origin!
```

**Solution:**

```bash
# You can't undo a push to upstream, but:

# 1. Contact upstream maintainers immediately
# 2. If it's your own fork, force reset:
git reset --hard HEAD~1
git push origin main --force

# 3. Re-add upstream as read-only (requires GitHub permissions)
```

### Fork Out of Sync (Many Commits Behind)

**Symptom:**
```
Your fork is 45 commits behind dondetir:main
```

**Solution:**

```bash
# Major sync
cd .AutoSDLC-framework
git fetch upstream
git checkout main

# See what you'll get
git log main..upstream/main --oneline

# Backup your changes
git checkout -b backup-before-sync

# Sync
git checkout main
git merge upstream/main
# Or if you want clean history: git reset --hard upstream/main

# Test thoroughly before pushing
git push origin main
```

### Installation Script Can't Find Fork

**Symptom:**
```
fatal: repository 'https://github.com/yourname/AutoSDLC.git' not found
```

**Solutions:**

1. **Check fork visibility**: Is it private? Use SSH instead
   ```bash
   AutoSDLC_REPO=git@github.com:yourname/AutoSDLC.git bash install-AutoSDLC.sh
   ```

2. **Check SSH keys**: Ensure GitHub SSH key configured
   ```bash
   ssh -T git@github.com
   # Should say: Hi yourname! You've successfully authenticated
   ```

3. **Use HTTPS with token**: For private repos
   ```bash
   AutoSDLC_REPO=https://YOUR_TOKEN@github.com/yourname/AutoSDLC.git bash install-AutoSDLC.sh
   ```

---

## 📊 Comparison: Fork vs In-Place Customization

| Aspect | In-Place Customization | Fork |
|--------|------------------------|------|
| **Ease of Setup** | ✅ Easiest (no fork needed) | ⚠️ Medium (fork + upstream setup) |
| **Updates** | ✅ Automatic (`git pull`) | ⚠️ Manual (merge upstream) |
| **Customization Scope** | ⚠️ Limited (overrides only) | ✅ Unlimited (any file) |
| **Team Sharing** | ⚠️ Not versioned | ✅ Git-based sharing |
| **Proprietary Changes** | ❌ Public in main repo | ✅ Keep private |
| **Maintenance** | ✅ Low (upstream handles it) | ⚠️ Medium (you sync) |
| **Best For** | Individual developers, small tweaks | Organizations, major customizations |

---

## 🎓 Best Practices

### For Individual Developers

1. ✅ **Start without forking** - Use overrides first
2. ✅ **Fork only when necessary** - Upstream updates are valuable
3. ✅ **Sync monthly** - Don't fall too far behind
4. ✅ **Keep customizations minimal** - Easier to maintain
5. ✅ **Document your changes** - Add README to your fork explaining modifications

### For Organizations

1. ✅ **Use branch protection** - Require reviews for company customizations
2. ✅ **Automate sync checks** - CI/CD job to detect upstream updates
3. ✅ **Tag releases** - `v1.0.0-acme` for stable internal versions
4. ✅ **Separate concerns** - Generic improvements → contribute upstream
5. ✅ **Test before rolling out** - Pilot new upstream changes with one team
6. ✅ **Document customizations** - Maintain `CUSTOMIZATIONS.md` in your fork
7. ✅ **Train developers** - Internal wiki on using org fork vs contributing

### For Both

1. ✅ **Test after sync** - Upstream changes may affect your customizations
2. ✅ **Review changelogs** - Check `CHANGELOG.md` before syncing
3. ✅ **Backup before major sync** - Create branch: `git checkout -b backup`
4. ✅ **Use semantic versioning** - Tag your fork: `v1.2.0-yourorg`
5. ✅ **Contribute back** - Bug fixes and general improvements help everyone

---

## 📚 Additional Resources

- **Main AutoSDLC Repo**: https://github.com/dondetir/AutoSDLC
- **Contributing Guide**: [CONTRIBUTING.md](CONTRIBUTING.md)
- **Setup Guide**: [SETUP.md](SETUP.md)
- **Organizational Memory**: [ORGANIZATIONAL-MEMORY.md](ORGANIZATIONAL-MEMORY.md)
- **GitHub Fork Docs**: https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks

---

## 🆘 Getting Help

- **Questions**: Open GitHub Discussion in main repo
- **Bug in Fork**: Check if it exists in upstream first
- **Sync Issues**: Ask in #AutoSDLC-help (your org Slack/Teams)
- **Contributing**: Review [CONTRIBUTING.md](CONTRIBUTING.md) first

---

**Remember**: Forking gives you control but requires maintenance. Start simple, fork when needed, and contribute back when possible. The AutoSDLC community benefits when improvements flow upstream! 🌊
