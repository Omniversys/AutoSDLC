# Changelog

All notable changes to AutoSDLC will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [V1.0]

### Added (2025-12-10)
- **Fork Workflow Documentation**: Complete guide for forking and customizing AutoSDLC
  - `FORK-WORKFLOW.md`: Comprehensive fork workflow guide
  - Individual developer fork workflow (setup, customization, sync)
  - Organization fork workflow (setup, team distribution, upstream sync)
  - Sync strategies (merge, rebase, cherry-pick, two-branch system)
  - Contributing back to main repo from forks
  - Troubleshooting fork-related issues
  - Comparison: fork vs in-place customization
- **Installation Script Enhancements**: Support for custom repository URLs
  - `AutoSDLC_REPO` environment variable support in both install scripts
  - Install from forked repositories: `AutoSDLC_REPO=https://github.com/yourorg/AutoSDLC.git`
  - Automatic upstream remote configuration for forks
  - Repository source displayed during installation
- **Organizational Memory System**: Multi-tier memory architecture (Organization → Team → User → Project)
  - `ORGANIZATIONAL-MEMORY.md`: Comprehensive enterprise memory architecture documentation
  - `ORG-SETUP-GUIDE.md`: Step-by-step organizational deployment guide
  - Four-tier memory hierarchy with inheritance and override semantics
  - Git-based collaboration for team and organization memories
  - Memory promotion/demotion commands (export up, import down hierarchy)
  - Access control with role-based permissions
  - Automatic pattern detection and context-aware loading
  - Memory analytics and health monitoring
- Installation scripts for automated AutoSDLC deployment (`install-AutoSDLC.sh` for Linux/Mac, `install-AutoSDLC.ps1` for Windows)
- **Per-Developer Installation Model**: Framework installed locally per developer, not committed to project repos
- **Global Installation Support**: Option to install AutoSDLC once and symlink/junction to multiple projects
- **Memory System Architecture**: Three-tier cognitive memory model (semantic, episodic, procedural)
  - Semantic memory: Project knowledge base and glossary
  - Episodic memory: Agent-specific session experiences (9 agent logs)
  - Procedural memory: Learned skills, user preferences, and memory management rules
- **GitHub Copilot Support**: Full integration with compact state files and on-demand memory loading
  - copilot-state.md: Current context (~200 words)
  - action-plan.md: Task checklist (~300 words)
  - context-anchors.md: Critical information
  - behavior-triggers.md: Automatic behaviors
- **Architecture Documentation**: Comprehensive ARCHITECTURE.md with system design and Mermaid diagrams
- **Visual Workflow Guide**: Enhanced WORKFLOW-VISUAL-GUIDE.md with 15 Mermaid diagrams
  - Complete workflow selection flowcharts
  - Memory integration diagrams
  - Multi-agent coordination sequences
  - Quality gate flows
  - State management diagrams

### Changed (2025-12-09)
- **README.md**: Updated Quick Start with per-developer installation workflow and team setup instructions
- **SETUP.md**: Complete rewrite with platform-specific instructions (Linux/Mac/Windows)
- **OVERVIEW.md**: Added memory system architecture and GitHub Copilot support
- **Deployment Model**: Changed from single AutoSDLC/ directory to .AutoSDLC-framework/ (hidden, gitignored)
- **Entry Points**: Updated paths from ./AutoSDLC/ to ./.AutoSDLC-framework/
- **Tool Support**: Expanded from Claude/Cursor to include GitHub Copilot as first-class citizen

### Documentation (2025-12-09)
- Installation troubleshooting guide (Windows symlink/junction issues, path problems)
- Team workflow documentation (first developer vs. other team members)
- Memory system access patterns and loading strategies
- Global vs. per-project installation comparison
- Platform-specific setup instructions with code examples
- Visual architecture diagrams for system overview and memory model

### Technical (2025-12-09)
- Installation scripts handle both hidden directory and global install strategies
- Automatic .gitignore configuration
- Windows junction support (no admin required) alongside symlinks
- Cross-platform compatibility for all installation methods
- Memory files optimized for different AI assistant context windows

### Planned
- Example projects and templates
- Additional agent types (Security Engineer, Data Engineer)
- Integration guides for popular frameworks
- Video tutorials

