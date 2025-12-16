# Security Policy

## Supported Versions

We release patches for security vulnerabilities in the following versions:

| Version | Supported          |
| ------- | ------------------ |
| 0.1.x   | :white_check_mark: |
| < 0.1.0 | :x:                |

## Reporting a Vulnerability

We take the security of `api-schema-diff` seriously. If you discover a security vulnerability, please follow these steps:

### 1. **Do Not** Open a Public Issue

Please do not create a public GitHub issue for security vulnerabilities, as this could put users at risk.

### 2. Report Privately

Please report security vulnerabilities by emailing: **security@lazar.dev**

Or use GitHub's private vulnerability reporting:
1. Go to the [Security tab](https://github.com/teolzr/schema-diff/security)
2. Click "Report a vulnerability"
3. Fill out the form with details

### 3. What to Include

When reporting a vulnerability, please include:

- **Description** of the vulnerability
- **Steps to reproduce** the issue
- **Potential impact** of the vulnerability
- **Suggested fix** (if you have one)
- **Your contact information** for follow-up

### 4. What to Expect

- **Acknowledgment**: We'll acknowledge your report within 48 hours
- **Updates**: We'll keep you informed about our progress
- **Timeline**: We aim to release a fix within 7 days for critical issues
- **Credit**: We'll credit you in the security advisory (if you wish)

## Security Best Practices

When using `api-schema-diff`:

### For Users

- ✅ Always use the latest version
- ✅ Install from official PyPI: `pip install api-schema-diff`
- ✅ Verify package integrity
- ✅ Review schema files before processing
- ⚠️ Don't process untrusted schema files from unknown sources

### For Contributors

- ✅ Follow secure coding practices
- ✅ Run security checks: `pip install safety && safety check`
- ✅ Keep dependencies up to date
- ✅ Review code for potential vulnerabilities
- ✅ Use pre-commit hooks to catch issues early

## Known Security Considerations

### Schema Processing

- **Input Validation**: We validate schema structure before processing
- **Resource Limits**: Large schemas are processed efficiently without excessive memory use
- **No Code Execution**: The tool only analyzes schemas, never executes code

### Dependencies

Our security depends on:
- `typer` - CLI framework
- `rich` - Terminal formatting
- `pyyaml` - YAML parsing

We monitor these dependencies for security updates via Dependabot.

## Security Updates

Security updates are released as patch versions (e.g., 0.1.1 → 0.1.2) and announced via:

- GitHub Security Advisories
- PyPI release notes
- CHANGELOG.md

To stay updated:

```bash
# Check your installed version
pip show api-schema-diff

# Upgrade to the latest version
pip install --upgrade api-schema-diff
```

## Acknowledgments

We appreciate the security research community and will acknowledge researchers who responsibly disclose vulnerabilities (with their permission).

---

**Last Updated**: December 16, 2025

