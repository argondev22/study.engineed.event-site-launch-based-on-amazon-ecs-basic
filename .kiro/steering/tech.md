# Technology Stack

## Build System & Package Management

- **Package Manager**: npm
- **Node.js**: Required for development tooling

## Development Tools

### Code Quality & Formatting

- **Prettier** (v3.6.2): Code formatting
- **markdownlint-cli2** (v0.19.0): Markdown linting
- **EditorConfig**: Cross-editor consistency

### Git Workflow

- **Husky** (v9.1.7): Git hooks automation
- **Commitlint** (v20.1.0): Commit message validation
- **Git LFS**: Large file management

### Linting Configuration

- **YAML**: yamllint with 2-space indentation, 120 char line limit
- **Markdown**: Relaxed rules (no line length limit, HTML allowed)
- **Commit Messages**: Conventional Commits format (English only)

## Common Commands

### Setup

```bash
npm install              # Install dependencies
git lfs install          # Initialize Git LFS (one-time)
git lfs pull             # Pull LFS-tracked files
```

### Code Quality

```bash
npm run format           # Format all files with Prettier + markdownlint
npm run format:check     # Check formatting without changes
npm run format:markdown  # Format markdown files only
npm run lint:markdown    # Lint markdown files
```

### Git Hooks

Husky automatically runs on:

- `commit-msg`: Validates commit message format
- `pre-commit`: Can be configured for additional checks

## Commit Message Convention

All commit messages must:

- Be written in **English**
- Follow Conventional Commits format
- Use one of these types: `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`, `revert`, `deps`, `docker`
- Have max 100 character header
- Not end subject with period

Example: `feat: add user authentication module`
