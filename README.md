# DevOps Security CI/CD Pipeline

> A GitHub Actions CI/CD pipeline built from a **DevOps Engineer** perspective.  
> The pipeline focuses on **security scanning, configuration validation, and safe deployment** — the core of a real DevOps workflow.

---

## 📁 Project Structure

```
.
├── .github/
│   └── workflows/
│       ├── ci.yml          ← CI pipeline (runs on Pull Request)
│       └── cd.yml          ← CD pipeline (runs on push to main)
├── src/
│   └── main.py             ← Application source code
├── tests/
│   └── test_main.py        ← Unit tests
├── scripts/
│   └── deploy.sh           ← Deployment helper script
└── README.md
```

---

## 🔄 CI vs CD — What's the Difference?

| | CI — Continuous Integration | CD — Continuous Deployment |
|---|---|---|
| **Trigger** | Pull Request | Push to `main` |
| **Goal** | Catch issues before merge | Build and ship to production |
| **Output** | Pass/Fail status on PR | Deployed release package |
| **Speed** | Fast (seconds to minutes) | Can be slower (staging → prod) |
| **Who benefits** | Developer | End users |

---

## ⚙️ CI Pipeline — `ci.yml`

**Trigger:** `pull_request` to `main` or `develop`

### Jobs

#### 1. 🔍 `lint_and_validate`
- Checks out the repository
- Installs `yamllint`
- Lints all YAML files (workflow configs, Kubernetes manifests, etc.)
- Runs `ShellCheck` on all shell scripts
- Prints runner environment info

#### 2. 🛡️ `security_scan` *(depends on `lint_and_validate`)*
- **Secret detection** — Scans code for hardcoded passwords, API keys, AWS secrets
- **Dockerfile lint** — Checks for security anti-patterns (`:latest` tag, running as root)
- **Dependency CVE scan** — Uses `safety` to check Python packages against known vulnerabilities
# m635i-65i1-65i2
