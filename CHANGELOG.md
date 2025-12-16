# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.0.1] - 2025-12-16

### Fixed
- PyPI README badge rendering - badges now display correctly on PyPI package page
- Explicitly set `content-type = "text/markdown"` in pyproject.toml for proper PyPI Markdown rendering

## [1.0.0] - 2025-12-16

### Added
- 🎉 **GitHub Action** - Use in any workflow with `uses: teolzr/schema-diff@v1`
- Composite action implementation (pip-based, fast)
- Example workflows for CI integration
- Manual workflow trigger for testing

### Changed
- Project now production-ready with full CI/CD automation

## [0.1.5] - 2025-12-16

### Added
- Docker image support (GitHub Container Registry)
- Multi-platform Docker images (linux/amd64, linux/arm64)
- Docker workflow for automated builds
- Comprehensive Docker documentation

## [0.1.4] - 2025-12-16

### Added
- Auto-tag workflow for automated version tagging on version bumps
- README badges for PyPI version, Python versions, CI status, license, and code style
- Python 3.13 support and testing
- Dependabot configuration for automated dependency updates
- PyPI classifiers and keywords for better package discoverability

### Changed
- Updated GitHub Actions dependencies (setup-python, cache, action-gh-release)
- Improved project metadata in pyproject.toml

## [0.1.3] - 2025-12-16

### Added
- Pre-commit hooks with Black and Ruff
- Version flag: `api-schema-diff --version`

## [0.1.2] - 2025-12-16

### Added
- Add pre-commit hooks for automatic code formatting and linting
- Prevent CI failures with automated Black and Ruff checks

### Fixed
- Code formatting issues

## [0.1.1] - 2025-12-16

### Added
- Add `--version` flag to display version information

### Changed
- Update CLI help text to reflect package name

## [0.1.0] - 2025-12-16

### Added
- Initial release of api-schema-diff
- OpenAPI 3.x schema comparison
- Generic JSON/YAML schema comparison
- CLI with text and JSON output formats
- Breaking change detection for:
  - Removed paths and operations
  - Removed or changed parameters
  - Request/response schema changes
  - Type changes
  - Required field changes
- Non-breaking change detection for additions
- CI/CD friendly exit codes
- Comprehensive test suite
- Example schemas and documentation
- GitHub Actions CI/CD workflows
- Development tooling (Black, Ruff, MyPy, pytest)
- Comprehensive documentation and contribution guidelines

[Unreleased]: https://github.com/teolzr/schema-diff/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/teolzr/schema-diff/compare/v0.1.5...v1.0.0
[0.1.5]: https://github.com/teolzr/schema-diff/compare/v0.1.4...v0.1.5
[0.1.4]: https://github.com/teolzr/schema-diff/compare/v0.1.3...v0.1.4
[0.1.3]: https://github.com/teolzr/schema-diff/compare/v0.1.2...v0.1.3
[0.1.2]: https://github.com/teolzr/schema-diff/compare/v0.1.1...v0.1.2
[0.1.1]: https://github.com/teolzr/schema-diff/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/teolzr/schema-diff/releases/tag/v0.1.0
