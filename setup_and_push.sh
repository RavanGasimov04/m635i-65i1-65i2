#!/usr/bin/env bash
# setup_and_push.sh
# Run this script to initialize a git repo and push to GitHub.
# Usage: bash setup_and_push.sh <your-github-username> <your-repo-name>
#
# Example:
#   bash setup_and_push.sh mehdiyevcs m635i-65i1-65i2

set -euo pipefail

GITHUB_USER="${1:-mehdiyevcs}"
REPO_NAME="${2:-m635i-65i1-65i2}"
BRANCH_NAME="feature/devops-security-pipeline"

echo "══════════════════════════════════════════"
echo "  DevOps Pipeline Setup & Push to GitHub"
echo "══════════════════════════════════════════"
echo ""

# ── Step 1: Initialize git repo ──────────────────────────────────────────────
echo "[1/6] Initializing git repository..."
git init
git config user.name "DevOps Pipeline Bot"
git config user.email "devops@example.com"
echo "      ✓ Git initialized"

# ── Step 2: Stage all files ───────────────────────────────────────────────────
echo "[2/6] Staging all files..."
git add .
echo "      ✓ Files staged:"
git status --short

# ── Step 3: Initial commit ────────────────────────────────────────────────────
echo "[3/6] Creating initial commit..."
git commit -m "feat: add DevOps security CI/CD pipeline

- CI: lint, secret scan, Dockerfile check, dependency CVE scan, IaC validation
- CD: build & package, security gate, staging deploy, production rolling update
- Artifacts: security report, release tarball, deployment report
- Specialty: DevOps / DevSecOps"
echo "      ✓ Commit created"

# ── Step 4: Create feature branch ─────────────────────────────────────────────
echo "[4/6] Creating feature branch: $BRANCH_NAME..."
git checkout -b "$BRANCH_NAME"
echo "      ✓ Branch created"

# ── Step 5: Set remote origin ─────────────────────────────────────────────────
echo "[5/6] Adding remote origin..."
git remote add origin "https://github.com/$GITHUB_USER/$REPO_NAME.git"
echo "      ✓ Remote set to: https://github.com/$GITHUB_USER/$REPO_NAME.git"

# ── Step 6: Push branch ───────────────────────────────────────────────────────
echo "[6/6] Pushing branch to GitHub..."
echo ""
echo "  ⚠️  You will be prompted for your GitHub credentials."
echo "  Use your GitHub username and a Personal Access Token (PAT) as password."
echo "  Create a PAT at: https://github.com/settings/tokens"
echo ""
git push -u origin "$BRANCH_NAME"

echo ""
echo "══════════════════════════════════════════"
echo "  ✅ Branch pushed successfully!"
echo ""
echo "  Next steps:"
echo "  1. Go to: https://github.com/$GITHUB_USER/$REPO_NAME"
echo "  2. Click 'Compare & pull request'"
echo "  3. Create the PR → CI pipeline will run automatically"
echo "══════════════════════════════════════════"
