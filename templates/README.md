# AutoSDLC Templates

This directory contains three sets of templates optimized for different workflow types.

## Directory Structure

```
templates/
├── minimal/              # For bug fixes and quick tasks
│   ├── bug-report.template.md
│   └── fix-verification.template.md
│
├── moderate/             # For feature development and refactors
│   ├── feature-brief.template.md
│   ├── story-lite.template.md
│   └── design-options.template.md
│
├── comprehensive/        # For new projects (full suite)
│   ├── PSA.template.md
│   ├── epic.template.md
│   ├── story.template.md
│   ├── task.template.md
│   ├── adr.template.md
│   └── proposal.template.md
│
└── session-context/      # Session context formats
    ├── compact.template.md
    ├── moderate.template.md
    └── comprehensive.template.md
```

## Template Loading by Workflow

| Workflow | Mode | Templates Loaded | Token Count |
|----------|------|------------------|-------------|
| Bug Fix | Minimal | minimal/ (2 files) | ~500 tokens |
| Refactor | Moderate | moderate/ (3 files) | ~1,500 tokens |
| Feature Dev | Moderate | moderate/ (3 files) | ~1,500 tokens |
| New Project | Comprehensive | comprehensive/ (all) | ~5,000 tokens |

## Token Reduction

- **Minimal mode:** 90% fewer template tokens vs loading all
- **Moderate mode:** 70% fewer template tokens vs loading all
- **Comprehensive mode:** 0% reduction (needs all templates)

## Usage

Templates are automatically loaded based on workflow selection.
See ORCHESTRATOR.md for details on mode-based template loading.
