# Contributing to api-schema-diff

Thank you for your interest in contributing to api-schema-diff! 🎉

This document provides guidelines and instructions for contributing.

## Code of Conduct

Be respectful, considerate, and professional in all interactions.

## How to Contribute

### Reporting Bugs

1. Check if the bug has already been reported in [Issues](https://github.com/teolzr/schema-diff/issues)
2. If not, create a new issue using the bug report template
3. Include:
   - Clear description of the problem
   - Steps to reproduce
   - Expected vs actual behavior
   - Sample schema files (if possible)
   - Environment details (OS, Python version, etc.)

### Suggesting Features

1. Check existing [Issues](https://github.com/teolzr/schema-diff/issues) for similar requests
2. Create a new issue using the feature request template
3. Describe:
   - The problem you're trying to solve
   - Your proposed solution
   - Use cases and examples
   - Alternative approaches you've considered

### Contributing Code

#### Prerequisites

- Python 3.10 or higher
- Git
- Basic understanding of OpenAPI/JSON Schema

#### Development Setup

1. **Fork and clone the repository**

```bash
git clone https://github.com/YOUR_USERNAME/schema-diff.git
cd schema-diff
```

2. **Create a virtual environment**

```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

3. **Install in development mode**

```bash
# Install the package in editable mode
pip install -e .

# Install development dependencies
pip install -r requirements-dev.txt

# Or using optional dependencies
pip install -e ".[dev]"
```

4. **Verify installation**

```bash
pytest
api-schema-diff examples/api-v1.yaml examples/api-v2-breaking.yaml
```

#### Making Changes

1. **Create a feature branch**

```bash
git checkout -b feature/your-feature-name
# or
git checkout -b fix/your-bug-fix
```

2. **Make your changes**

Follow the existing code style and patterns. Key guidelines:
- Use type hints
- Write docstrings for functions and classes
- Keep functions focused and small
- Follow PEP 8 style guide

3. **Write tests**

Add tests for any new functionality in the `tests/` directory:

```bash
# Run tests
pytest

# Run with coverage
pytest --cov=schema_diff --cov-report=html

# Run specific test file
pytest tests/test_your_feature.py
```

4. **Format and lint your code**

```bash
# Format code with Black
black .

# Lint with Ruff
ruff check .

# Type check with MyPy (optional)
mypy schema_diff --ignore-missing-imports
```

5. **Commit your changes**

Write clear, descriptive commit messages:

```bash
git add .
git commit -m "Add feature: description of what you added"
```

Good commit message examples:
- `Fix: Correctly detect removed optional parameters`
- `Add: Support for OpenAPI 2.0 schemas`
- `Docs: Update README with new examples`
- `Refactor: Simplify diff logic for nested objects`

6. **Push and create a Pull Request**

```bash
git push origin feature/your-feature-name
```

Then open a Pull Request on GitHub.

#### Pull Request Guidelines

- Fill out the PR template completely
- Link to any related issues
- Ensure all tests pass
- Keep PRs focused on a single feature or fix
- Update documentation if needed
- Add examples if introducing new features

## Project Structure

```
schema-diff/
├── schema_diff/          # Main package
│   ├── cli.py           # CLI entry point
│   ├── diff.py          # Generic diff logic
│   ├── loader.py        # Schema loading
│   ├── models.py        # Data models
│   ├── rules.py         # Breaking change rules
│   └── openapi/         # OpenAPI-specific logic
│       ├── diff.py
│       ├── json_schema_diff.py
│       ├── normalizer.py
│       └── resolver.py
├── tests/               # Test suite
├── examples/            # Example schemas
└── docs/                # Documentation
```

## Testing Guidelines

### Writing Tests

- Place tests in the `tests/` directory
- Name test files `test_*.py`
- Name test functions `test_*`
- Use descriptive test names that explain what's being tested
- Test both positive and negative cases
- Include edge cases

### Test Structure

```python
def test_feature_name_scenario():
    """Test that feature X does Y when Z."""
    # Arrange - set up test data
    old_schema = {"field": "value"}
    new_schema = {"field": "new_value"}
    
    # Act - perform the action
    result = diff_objects(old_schema, new_schema)
    
    # Assert - verify the result
    assert result.has_breaking_changes()
    assert any(c.path == "field" for c in result.breaking)
```

### Running Tests

```bash
# Run all tests
pytest

# Run with verbose output
pytest -v

# Run specific test
pytest tests/test_diff.py::test_removed_field_is_breaking

# Run with coverage
pytest --cov=schema_diff --cov-report=html
```

## Code Style

We use:
- **Black** for code formatting
- **Ruff** for linting
- **MyPy** for type checking (optional but encouraged)

### Style Guidelines

- Maximum line length: 100 characters (Black default)
- Use type hints for function parameters and return values
- Write docstrings for public functions and classes
- Use descriptive variable names
- Prefer composition over inheritance
- Keep functions small and focused

### Example

```python
from typing import Optional

def find_breaking_change(
    old_value: dict,
    new_value: dict,
    path: str
) -> Optional[Change]:
    """
    Detect breaking changes between two schema values.
    
    Args:
        old_value: The original schema value
        new_value: The new schema value
        path: JSON path to the current location
        
    Returns:
        A Change object if a breaking change is detected, None otherwise
    """
    # Implementation
    pass
```

## Documentation

- Update README.md if adding new features or changing behavior
- Add docstrings to new functions and classes
- Update examples if relevant
- Consider adding to CHANGELOG.md for significant changes

## Release Process

(For maintainers)

1. Update version in `pyproject.toml`
2. Update CHANGELOG.md
3. Create a git tag: `git tag -a v0.2.0 -m "Release v0.2.0"`
4. Push tag: `git push origin v0.2.0`
5. GitHub Actions will automatically build and publish to PyPI

## Getting Help

- Create an issue for bugs or feature requests
- Start a discussion for questions or ideas
- Check existing issues and PRs for similar topics

## Recognition

Contributors will be recognized in:
- GitHub's contributor list
- Release notes for their contributions
- CHANGELOG.md for significant features

Thank you for contributing to api-schema-diff! 🚀

