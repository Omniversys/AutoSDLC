# Contributing to AutoSDLC

Thank you for your interest in contributing to AutoSDLC! This framework helps manage AI-driven software development projects with a structured workflow.

## How to Contribute

### Reporting Bugs

If you find a bug, please open an issue using the bug report template. Include:
- Clear description of the issue
- Steps to reproduce
- Expected vs actual behavior
- Environment details (Claude Code version, OS)

### Suggesting Features

We welcome feature suggestions! Please open a feature request issue with:
- Clear description of the proposed feature
- Use case and problem it solves
- Any implementation ideas

### Contributing Code

1. **Fork the Repository**
   ```bash
   git clone https://github.com/Omniversys/AutoSDLC
   cd AutoSDLC
   ```

2. **Create a Feature Branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Make Your Changes**
   - Follow the existing YAML and Markdown style
   - Keep changes focused and atomic
   - Test your changes with Claude Code

4. **Commit Your Changes**
   ```bash
   git commit -m "Add feature: brief description"
   ```
   - Use clear, descriptive commit messages
   - Follow conventional commits format if possible

5. **Push and Create a Pull Request**
   ```bash
   git push origin feature/your-feature-name
   ```
   - Fill out the PR template completely
   - Link any related issues
   - Describe what you changed and why

### Code Style Guidelines

- **YAML Files**: Use 2-space indentation, follow existing structure
- **Markdown Files**: Use clear headings, code blocks, and formatting
- **Templates**: Maintain consistency with existing templates
- **Configuration**: Document all new configuration options

### Testing

Before submitting a PR:
- Test your changes with Claude Code in a real project
- Verify YAML syntax is valid
- Check that documentation is accurate
- Ensure no breaking changes (or document them clearly)

### Review Process

1. Maintainers will review your PR
2. Address any feedback or requested changes
3. Once approved, your PR will be merged
4. You'll be credited in the CHANGELOG

## Development Setup

AutoSDLC is a configuration-based framework, so no build process is needed:

1. Clone the repository
2. Make changes to YAML/Markdown files
3. Test by using AutoSDLC in a Claude Code project
4. Validate YAML syntax: `yamllint **/*.yaml`

## Questions?

- Check the [FAQ](FAQ.md) first
- Open a discussion on GitHub
- Review existing issues and PRs

## Code of Conduct

Please read and follow our [Code of Conduct](CODE_OF_CONDUCT.md).

## License

By contributing, you agree that your contributions will be licensed under the MIT License.
