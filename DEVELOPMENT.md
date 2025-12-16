# Development Workflow

## Branch Strategy

This project uses a **Git Flow** branching model:

```
develop (dev work) → main (releases) → auto-deploy to PyPI
```

### Branches

- **`main`**: Production-ready releases only
  - Protected branch
  - Only updated via PR from `develop`
  - Triggers automatic: tag creation → PyPI publish → Docker build → GitHub Release

- **`develop`**: Active development
  - Default branch for all development work
  - All feature branches merge here first
  - Tested and validated before merging to `main`

---

## 🚀 Development Process

### 1. **Daily Development** (on `develop`)

```bash
# Make sure you're on develop
git checkout develop
git pull origin develop

# Make your changes
# ... edit files ...

# Commit changes
git add .
git commit -m "feat: add new feature"

# Push to develop
git push origin develop
```

### 2. **Preparing a Release** (develop → main)

When ready to release a new version:

```bash
# 1. Update version in pyproject.toml
# Change: version = "1.0.4" → version = "1.0.5"

# 2. Update CHANGELOG.md
# Add new version section with changes

# 3. Commit version bump
git add pyproject.toml CHANGELOG.md
git commit -m "chore: bump version to 1.0.5"
git push origin develop

# 4. Create Pull Request: develop → main
# Go to GitHub and create PR
# Review changes, ensure CI passes

# 5. Merge PR to main
# This automatically triggers:
#   ✅ Tag creation (v1.0.5)
#   ✅ PyPI publish
#   ✅ Docker image build
#   ✅ GitHub Release
```

### 3. **After Release**

```bash
# Switch back to develop for next development cycle
git checkout develop
git pull origin develop
```

---

## 🔄 Automatic Release Process

When you **merge to `main`** with a version change:

1. **Workflow Detects**: Version change in `pyproject.toml`
2. **Creates Tag**: `v1.0.5` automatically
3. **Builds Package**: Python wheel + source distribution
4. **Publishes to PyPI**: Using Trusted Publishing
5. **Builds Docker**: Multi-platform images to GHCR
6. **Creates Release**: GitHub release with notes

**Total time**: ~5-7 minutes

---

## 📋 Release Checklist

Before merging `develop → main`:

- [ ] Version bumped in `pyproject.toml`
- [ ] `CHANGELOG.md` updated with changes
- [ ] All tests passing (`pytest`)
- [ ] Code formatted (`black`, `ruff`)
- [ ] Pre-commit hooks passing
- [ ] CI passing on develop branch
- [ ] Docker builds successfully (if applicable)
- [ ] Documentation updated (if needed)

---

## 🛠️ Local Development

### Setup

```bash
# Clone and setup
git clone https://github.com/teolzr/schema-diff.git
cd schema-diff
git checkout develop

# Create virtual environment
python -m venv .venv
source .venv/bin/activate  # On Windows: .venv\Scripts\activate

# Install in editable mode with dev dependencies
pip install -e ".[dev]"

# Install pre-commit hooks
pre-commit install
```

### Testing

```bash
# Run tests
pytest

# Run with coverage
pytest --cov=schema_diff

# Format code
black .
ruff check --fix .

# Run pre-commit checks manually
pre-commit run --all-files
```

### Testing CLI locally

```bash
# After pip install -e .
api-schema-diff examples/api-v1.yaml examples/api-v2.yaml

# Or directly
python -m schema_diff.cli examples/api-v1.yaml examples/api-v2.yaml
```

---

## 🔒 Branch Protection Rules (Recommended)

### For `main` branch:

- [x] Require pull request before merging
- [x] Require approvals (1)
- [x] Require status checks to pass (CI)
- [x] Require branches to be up to date
- [ ] Require signed commits (optional)
- [x] Do not allow bypassing the above settings

### For `develop` branch:

- [x] Require pull request before merging (for team projects)
- [x] Require status checks to pass (CI)

---

## 🎯 Versioning

We follow [Semantic Versioning](https://semver.org/):

- **MAJOR** (1.0.0 → 2.0.0): Breaking changes
- **MINOR** (1.0.0 → 1.1.0): New features (backward compatible)
- **PATCH** (1.0.0 → 1.0.1): Bug fixes (backward compatible)

### When to bump:

- **Bug fix**: Patch version (1.0.4 → 1.0.5)
- **New feature**: Minor version (1.0.5 → 1.1.0)
- **Breaking change**: Major version (1.1.0 → 2.0.0)

---

## 📚 Additional Resources

- [Contributing Guide](CONTRIBUTING.md) (if exists)
- [Release Guide](RELEASE_GUIDE.md) (if exists)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [PyPI Trusted Publishers](https://docs.pypi.org/trusted-publishers/)

