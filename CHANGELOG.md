# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Initial release of schema-diff
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

## [0.1.0] - 2025-01-XX

### Added
- Initial release

[Unreleased]: https://github.com/teolzr/schema-diff/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/teolzr/schema-diff/releases/tag/v0.1.0

