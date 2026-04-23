#!/usr/bin/env bash
# deploy.sh — Simulated deployment helper script
# Used by the CD pipeline to perform deployment steps

set -euo pipefail

APP_NAME="${1:-devops-security-toolkit}"
VERSION="${2:-1.0.0}"
ENV="${3:-staging}"

echo "══════════════════════════════════════"
echo "  Deploying $APP_NAME v$VERSION"
echo "  Target environment: $ENV"
echo "══════════════════════════════════════"

# Step 1: Pre-flight checks
echo "[1/4] Running pre-flight checks..."
if [ ! -d "./dist" ]; then
  echo "ERROR: dist/ directory not found. Run build first."
  exit 1
fi
echo "      ✓ dist/ directory exists"

# Step 2: Copy files to deployment target
echo "[2/4] Copying files to deployment target..."
mkdir -p "/tmp/deploy/$APP_NAME"
cp -r ./dist/* "/tmp/deploy/$APP_NAME/" 2>/dev/null || true
echo "      ✓ Files copied"

# Step 3: Restart service (simulated)
echo "[3/4] Restarting service (simulated)..."
sleep 1
echo "      ✓ Service restarted"

# Step 4: Health check
echo "[4/4] Health check..."
sleep 1
echo "      ✓ Service healthy on port 8080"

echo ""
echo "✅ Deployment of $APP_NAME v$VERSION to $ENV — COMPLETE"
