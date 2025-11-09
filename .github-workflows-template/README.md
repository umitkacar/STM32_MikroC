# 🤖 GitHub Actions CI/CD Workflow Template

## 📋 Overview

This directory contains the GitHub Actions CI/CD workflow template for the STM32 Biometric AI project.

**Note:** Due to GitHub App permissions, this workflow cannot be automatically installed. You need to manually add it to your repository.

## 🚀 Installation

### Option 1: Manual Installation

1. Create the workflows directory:
   ```bash
   mkdir -p .github/workflows
   ```

2. Copy the workflow file:
   ```bash
   cp .github-workflows-template/ci.yml .github/workflows/
   ```

3. Commit and push:
   ```bash
   git add .github/workflows/ci.yml
   git commit -m "feat: add GitHub Actions CI/CD workflow"
   git push
   ```

### Option 2: GitHub Web Interface

1. Go to your repository on GitHub
2. Click "Actions" tab
3. Click "New workflow"
4. Click "set up a workflow yourself"
5. Copy the contents of `ci.yml` from this template directory
6. Commit the file

## 🎯 What This Workflow Does

### Multi-Job Pipeline

1. **🎨 Code Quality** - Runs pre-commit hooks on all files
2. **🔍 Lint** - Checks code with Ruff linter
3. **🔬 Type Check** - Validates types with MyPy
4. **🧪 Test** - Matrix testing across:
   - Python 3.10, 3.11, 3.12
   - Ubuntu, Windows, macOS
5. **🔒 Security** - Scans with Bandit and Safety
6. **📚 Documentation** - Builds Sphinx docs
7. **📦 Build** - Validates package build
8. **✅ All Checks** - Final status check

### Features

- ✅ Parallel job execution for faster CI
- ✅ Caching for dependencies and pre-commit hooks
- ✅ Codecov integration for coverage reports
- ✅ Artifact uploads (coverage reports, docs, packages)
- ✅ Comprehensive matrix testing
- ✅ Scheduled weekly runs
- ✅ Manual workflow dispatch

## 🔧 Configuration

### Secrets Required

For full functionality, add these secrets to your GitHub repository:

- `CODECOV_TOKEN` - For coverage reporting (optional)

### Branch Protection

The workflow runs on:
- Push to `main`, `develop`, `claude/**` branches
- Pull requests to `main`, `develop`
- Manual trigger
- Weekly schedule (Monday 00:00 UTC)

## 📊 Workflow Status Badges

Add this to your README.md:

```markdown
![CI/CD](https://github.com/yourusername/STM32_MikroC/workflows/🚀%20CI/CD%20Pipeline/badge.svg)
```

## 🛠️ Local CI Testing

Before pushing, test the CI pipeline locally:

```bash
# Run all checks
make ci

# Or individually
make format-check
make lint
make type-check
make test-cov
```

## 📝 Customization

### Modify Python Versions

Edit the matrix in `ci.yml`:

```yaml
matrix:
  python-version: ['3.10', '3.11', '3.12', '3.13']  # Add/remove versions
```

### Add/Remove Operating Systems

```yaml
matrix:
  os: [ubuntu-latest, windows-latest, macos-latest]  # Modify as needed
```

### Adjust Coverage Threshold

In `pyproject.toml`:

```toml
[tool.coverage.report]
fail_under = 80  # Adjust threshold
```

## 🚀 Performance Tips

1. **Cache hits** - The workflow caches pip packages and pre-commit hooks
2. **Parallel jobs** - All jobs run in parallel when possible
3. **Matrix optimization** - Reduce matrix size for faster CI
4. **Conditional steps** - Some steps only run on Ubuntu + Python 3.12

## 🐛 Troubleshooting

### Workflow fails on push

- Check branch protection rules
- Ensure secrets are configured
- Review workflow logs in Actions tab

### Tests fail in CI but pass locally

- Check Python version compatibility
- Verify all dependencies are in `pyproject.toml`
- Review OS-specific issues

### Codecov upload fails

- Add `CODECOV_TOKEN` secret
- Or set `fail_ci_if_error: false` (already configured)

## 📚 Resources

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Workflow Syntax](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions)
- [Codecov Documentation](https://docs.codecov.com/)

## 🤝 Contributing

When modifying the workflow:

1. Test locally with `make ci`
2. Update this README if needed
3. Test on a feature branch first
4. Document any new requirements

---

**Note:** This workflow follows 2024-2025 best practices for Python CI/CD pipelines.
