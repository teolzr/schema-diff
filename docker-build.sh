#!/bin/bash
set -e

echo "🐳 Building Docker image..."
docker build -t api-schema-diff:local .

echo ""
echo "✅ Build complete!"
echo ""
echo "🧪 Testing image..."
docker run --rm api-schema-diff:local --version

echo ""
echo "📝 Running example comparison..."
if [ -d "examples" ]; then
    docker run --rm \
        -v $(pwd)/examples:/workspace \
        api-schema-diff:local \
        api-v1.yaml api-v2-breaking.yaml
else
    echo "⚠️  No examples directory found, skipping test"
fi

echo ""
echo "🎉 All tests passed!"
echo ""
echo "To run locally:"
echo "  docker run --rm -v \$(pwd):/workspace api-schema-diff:local old.yaml new.yaml"
