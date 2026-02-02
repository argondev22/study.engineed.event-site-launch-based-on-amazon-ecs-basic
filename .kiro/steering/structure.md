# Project Structure

## Root Directory Organization

```
.
├── .devcontainer/       # Docker DevContainer configuration
├── .github/             # GitHub templates (issues, PRs, workflows)
├── .husky/              # Git hooks configuration
├── .kiro/               # Kiro AI assistant configuration
│   ├── specs/           # Feature specifications
│   └── steering/        # AI guidance documents
├── .vscode/             # VS Code settings and extensions
├── docs/                # Project documentation
├── terraform/           # Infrastructure as Code (if applicable)
├── node_modules/        # npm dependencies (gitignored)
└── tmp/                 # Temporary files (gitignored)
```

## Configuration Files

### Code Style & Quality

- `.editorconfig`: Editor-agnostic formatting (2 spaces, LF, UTF-8)
- `.prettierrc.json`: Prettier configuration (100 char width, no semicolons optional)
- `.prettierignore`: Files excluded from Prettier
- `.markdownlint.jsonc`: Markdown linting rules
- `.yamllint.yml`: YAML linting rules
- `cspell.jsonc`: Spell checking configuration

### Git & Version Control

- `.gitignore`: Comprehensive ignore rules for Node.js + cross-platform
- `.gitattributes`: Git LFS tracking for binary files
- `.commitlintrc.json`: Commit message validation rules

### Development Environment

- `.devcontainer/devcontainer.example.json`: Template for DevContainer setup
- `.vscode/`: VS Code workspace settings and recommended extensions

## File Placement Guidelines

- **Source code**: Place in `src/` directory (to be created per project needs)
- **Documentation**: Use `docs/` for project-specific documentation
- **Infrastructure**: Use `terraform/` for IaC configurations
- **Tests**: Co-locate with source files or use dedicated test directories
- **Configuration**: Keep at root level for tool discoverability

## Naming Conventions

- **Directories**: Use lowercase with hyphens (kebab-case)
- **Config files**: Follow tool conventions (usually dot-prefixed)
- **Documentation**: Use descriptive names in lowercase with hyphens
