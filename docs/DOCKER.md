# Docker Usage Guide

## Quick Start

```bash
# Pull the latest image
docker pull ghcr.io/teolzr/schema-diff:latest

# Run with local files
docker run --rm \
  -v $(pwd):/workspace \
  ghcr.io/teolzr/schema-diff:latest \
  old.yaml new.yaml
```

---

## Available Images

### GitHub Container Registry (Recommended)

```bash
# Latest stable release
docker pull ghcr.io/teolzr/schema-diff:latest

# Specific version
docker pull ghcr.io/teolzr/schema-diff:v0.1.4

# Latest from main branch
docker pull ghcr.io/teolzr/schema-diff:main
```

### Supported Platforms
- `linux/amd64` (x86_64)
- `linux/arm64` (ARM64/Apple Silicon)

---

## Usage Examples

### Basic Comparison

```bash
docker run --rm \
  -v $(pwd):/workspace \
  ghcr.io/teolzr/schema-diff:latest \
  schema-v1.yaml schema-v2.yaml
```

### JSON Output

```bash
docker run --rm \
  -v $(pwd):/workspace \
  ghcr.io/teolzr/schema-diff:latest \
  old.json new.json \
  --format json
```

### Report-Only Mode (No Failure on Breaking Changes)

```bash
docker run --rm \
  -v $(pwd):/workspace \
  ghcr.io/teolzr/schema-diff:latest \
  api-v1.yaml api-v2.yaml \
  --no-fail-on-breaking
```

### Save Output to File

```bash
docker run --rm \
  -v $(pwd):/workspace \
  ghcr.io/teolzr/schema-diff:latest \
  old.yaml new.yaml \
  --format json > diff-report.json
```

---

## CI/CD Integration

### GitHub Actions

```yaml
name: Schema Breaking Change Detection

on:
  pull_request:
    paths:
      - 'schemas/**'

jobs:
  schema-diff:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0

      - name: Check for breaking changes
        run: |
          docker run --rm \
            -v $(pwd):/workspace \
            ghcr.io/teolzr/schema-diff:latest \
            schemas/old.yaml schemas/new.yaml \
            --format json
```

### GitLab CI

```yaml
schema-diff:
  image: ghcr.io/teolzr/schema-diff:latest
  script:
    - api-schema-diff old.yaml new.yaml --format json
  only:
    changes:
      - schemas/**
```

### CircleCI

```yaml
version: 2.1

jobs:
  schema-check:
    docker:
      - image: ghcr.io/teolzr/schema-diff:latest
    steps:
      - checkout
      - run:
          name: Check schema compatibility
          command: api-schema-diff old.yaml new.yaml
```

### Jenkins

```groovy
pipeline {
    agent {
        docker {
            image 'ghcr.io/teolzr/schema-diff:latest'
        }
    }
    stages {
        stage('Schema Diff') {
            steps {
                sh 'api-schema-diff schemas/v1.yaml schemas/v2.yaml'
            }
        }
    }
}
```

---

## Building Locally

### Build the Image

```bash
# Clone the repo
git clone https://github.com/teolzr/schema-diff.git
cd schema-diff

# Build using helper script
./docker-build.sh

# Or build manually
docker build -t api-schema-diff:local .
```

### Test the Image

```bash
# Run tests
docker run --rm api-schema-diff:local --version

# Test with examples
docker run --rm \
  -v $(pwd)/examples:/workspace \
  api-schema-diff:local \
  api-v1.yaml api-v2-breaking.yaml
```

---

## Advanced Usage

### Custom Working Directory

```bash
docker run --rm \
  -v /path/to/schemas:/schemas \
  -w /schemas \
  ghcr.io/teolzr/schema-diff:latest \
  old.yaml new.yaml
```

### Multiple Schema Directories

```bash
docker run --rm \
  -v $(pwd)/schemas:/schemas:ro \
  -v $(pwd)/output:/output \
  ghcr.io/teolzr/schema-diff:latest \
  /schemas/v1.yaml /schemas/v2.yaml \
  --format json > /output/diff.json
```

### As a Shell Alias

Add to your `~/.bashrc` or `~/.zshrc`:

```bash
alias api-schema-diff='docker run --rm -v $(pwd):/workspace ghcr.io/teolzr/schema-diff:latest'
```

Then use it like the regular CLI:

```bash
api-schema-diff old.yaml new.yaml
```

---

## Docker Compose

Create a `docker-compose.yml`:

```yaml
version: '3.8'

services:
  schema-diff:
    image: ghcr.io/teolzr/schema-diff:latest
    volumes:
      - ./schemas:/workspace
    command: old.yaml new.yaml --format json
```

Run:

```bash
docker-compose run --rm schema-diff
```

---

## Troubleshooting

### Permission Issues

If you get permission errors:

```bash
# Run as current user
docker run --rm \
  --user $(id -u):$(id -g) \
  -v $(pwd):/workspace \
  ghcr.io/teolzr/schema-diff:latest \
  old.yaml new.yaml
```

### File Not Found

Make sure the volume mount is correct:

```bash
# ✅ Correct - mount parent directory
docker run --rm -v $(pwd):/workspace \
  ghcr.io/teolzr/schema-diff:latest \
  schemas/old.yaml schemas/new.yaml

# ❌ Wrong - mount without working directory access
docker run --rm \
  ghcr.io/teolzr/schema-diff:latest \
  schemas/old.yaml schemas/new.yaml
```

### SELinux Issues (Fedora/RHEL)

Add `:z` to the volume mount:

```bash
docker run --rm -v $(pwd):/workspace:z \
  ghcr.io/teolzr/schema-diff:latest \
  old.yaml new.yaml
```

---

## Image Details

- **Base Image**: `python:3.12-slim`
- **Size**: ~50MB (multi-stage build)
- **User**: Runs as non-root user (`schemauser`, UID 1000)
- **Working Directory**: `/workspace`
- **Entrypoint**: `api-schema-diff`

---

## Security

The Docker image:
- Runs as a **non-root user** by default
- Uses **multi-stage builds** to minimize size and attack surface
- Contains only runtime dependencies (no build tools)
- Is automatically scanned for vulnerabilities

---

## Updates

Images are automatically built and published when:
- New tags are created (versioned releases)
- Commits are pushed to `main` (latest)

To always use the latest version:

```bash
docker pull ghcr.io/teolzr/schema-diff:latest
```
