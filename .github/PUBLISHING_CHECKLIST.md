# Pre-Publishing Checklist

Before publishing to GitHub and PyPI, verify the following:

## ✅ Code Quality

- [ ] All tests pass: `pytest -v`
- [ ] Code is formatted: `black .`
- [ ] Linting passes: `ruff check .`
- [ ] Package installs correctly: `pip install -e .`
- [ ] CLI works: `api-schema-diff examples/api-v1.yaml examples/api-v2-breaking.yaml`

## ✅ Documentation

- [ ] README.md is complete and accurate
- [ ] LICENSE file is present
- [ ] CONTRIBUTING.md guidelines are clear
- [ ] Example files work correctly
- [ ] Docstrings are present for public APIs

## ✅ Repository Setup

- [ ] `.gitignore` is comprehensive
- [ ] No sensitive data in repository
- [ ] No build artifacts committed (`__pycache__/`, `*.egg-info/`, `dist/`, etc.)
- [ ] No test files in root directory
- [ ] GitHub workflows are configured (`.github/workflows/`)
- [ ] Issue and PR templates are set up

## ✅ Package Configuration

- [ ] `pyproject.toml` has correct metadata:
  - [ ] Version number
  - [ ] Author information
  - [ ] Repository URLs
  - [ ] Dependencies
  - [ ] License
- [ ] Package builds successfully: `python -m build`
- [ ] Package description renders correctly on PyPI test

## ✅ Git Setup

- [ ] Initialize git: `git init`
- [ ] Add remote: `git remote add origin https://github.com/teolzr/schema-diff.git`
- [ ] Stage all files: `git add .`
- [ ] Create initial commit: `git commit -m "Initial commit: schema-diff v0.1.0"`
- [ ] Create main branch: `git branch -M main`
- [ ] Push to GitHub: `git push -u origin main`

## ✅ GitHub Repository Settings

After pushing:

- [ ] Add repository description: "Detect breaking changes between API schemas (OpenAPI / JSON Schema)"
- [ ] **Note:** Repository name is `schema-diff` but PyPI package name is `api-schema-diff`
- [ ] Add topics/tags: `openapi`, `json-schema`, `api`, `diff`, `breaking-changes`, `ci-cd`, `python`
- [ ] Enable GitHub Actions (should be automatic)
- [ ] (Optional) Add repository image/logo
- [ ] (Optional) Enable Discussions
- [ ] (Optional) Add to GitHub Topics

## ✅ Optional: PyPI Publishing Setup

For publishing to PyPI:

1. Create PyPI account: https://pypi.org/account/register/
2. Create API token: https://pypi.org/manage/account/token/
3. Add token to GitHub Secrets:
   - Go to: Settings → Secrets and variables → Actions
   - Add secret: `PYPI_API_TOKEN` = your token
4. Tag a release: `git tag -a v0.1.0 -m "Release v0.1.0"`
5. Push tag: `git push origin v0.1.0`
6. GitHub Actions will automatically publish to PyPI

## ✅ Post-Publishing

- [ ] Verify GitHub Actions workflows run successfully
- [ ] Check that README displays correctly on GitHub
- [ ] Share the project! 🎉
- [ ] (Optional) Submit to awesome lists or Reddit communities

## 🚀 Quick Command Reference

```bash
# Local testing
pytest -v
black .
ruff check .
pip install -e .
api-schema-diff examples/api-v1.yaml examples/api-v2-breaking.yaml

# Git setup (if not already done)
git init
git add .
git commit -m "Initial commit: api-schema-diff v0.1.0"
git branch -M main
git remote add origin https://github.com/teolzr/schema-diff.git
git push -u origin main

# Create release
git tag -a v0.1.0 -m "Release v0.1.0"
git push origin v0.1.0
```

## 📝 Notes

- Build artifacts (`__pycache__/`, `*.egg-info/`, `dist/`, `.venv/`) are gitignored
- The `.github/workflows/` will run automatically on push/PR
- The release workflow needs `PYPI_API_TOKEN` secret configured
