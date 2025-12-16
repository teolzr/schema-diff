# Build stage
FROM python:3.12-slim AS builder

WORKDIR /build

# Install build dependencies
RUN pip install --no-cache-dir build

# Copy project files
COPY pyproject.toml README.md ./
COPY schema_diff/ ./schema_diff/

# Build wheel
RUN python -m build --wheel

# Runtime stage
FROM python:3.12-slim

LABEL org.opencontainers.image.source="https://github.com/teolzr/schema-diff"
LABEL org.opencontainers.image.description="Detect breaking changes between API schemas (OpenAPI / JSON Schema)"
LABEL org.opencontainers.image.licenses="MIT"

WORKDIR /app

# Copy wheel from builder
COPY --from=builder /build/dist/*.whl /tmp/

# Install the package
RUN pip install --no-cache-dir /tmp/*.whl && \
    rm /tmp/*.whl

# Create a non-root user
RUN useradd -m -u 1000 schemauser && \
    chown -R schemauser:schemauser /app

USER schemauser

WORKDIR /workspace

# Set entrypoint
ENTRYPOINT ["api-schema-diff"]

# Default command (show help)
CMD ["--help"]
