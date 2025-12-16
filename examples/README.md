# Examples

This directory contains example API schemas to demonstrate `schema-diff` capabilities.

## Files

### `api-v1.yaml`
The baseline API schema (version 1.0.0) with basic user management endpoints.

### `api-v2-breaking.yaml`
Version 2 with **breaking changes** that would affect existing clients:
- Made optional parameter `limit` required
- Added new required field `username` to User schema
- Changed `age` field type from integer to string
- Removed DELETE `/users/{userId}` operation

### `api-v2-safe.yaml`
Version 2 with **non-breaking changes** that are backwards compatible:
- Added new optional query parameter `sort`
- Added new optional response fields
- Added new endpoint `/users/{userId}/profile`
- Added new optional request/response fields

## Usage

### Compare v1 with breaking changes

```bash
api-schema-diff examples/api-v1.yaml examples/api-v2-breaking.yaml
```

Expected output: **Breaking changes detected** (exit code 1)

Breaking changes:
- Query parameter `limit` became required
- Required field `username` added to User schema
- Type change on `age` field (integer → string)
- DELETE operation removed

### Compare v1 with safe changes

```bash
api-schema-diff examples/api-v1.yaml examples/api-v2-safe.yaml
```

Expected output: **No breaking changes** (exit code 0)

Non-breaking changes:
- Optional parameter `sort` added
- Optional fields added to responses
- New endpoint added
- Optional request fields added

### JSON output

```bash
api-schema-diff examples/api-v1.yaml examples/api-v2-breaking.yaml --format json
```

Get machine-readable output for CI/CD pipelines.

## Testing locally

After installing `api-schema-diff`, run:

```bash
# Install the tool
pip install -e .

# Test breaking changes
api-schema-diff examples/api-v1.yaml examples/api-v2-breaking.yaml

# Test non-breaking changes
api-schema-diff examples/api-v1.yaml examples/api-v2-safe.yaml
```

