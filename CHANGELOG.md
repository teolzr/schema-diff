# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

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

[Unreleased]: https://github.com/teolzr/schema-diff/compare/v0.1.2...HEAD
[0.1.2]: https://github.com/teolzr/schema-diff/compare/v0.1.1...v0.1.2
[0.1.1]: https://github.com/teolzr/schema-diff/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/teolzr/schema-diff/releases/tag/v0.1.0
