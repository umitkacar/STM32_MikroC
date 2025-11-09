# 🚀 Production Setup & Testing Guide

This guide helps you set up and test the STM32 Biometric AI project in production mode.

## ✅ Quick Validation (No Installation Required)

The repository is production-ready out of the box! Run these commands to verify:

```bash
# 1. Test Python package imports
python3 -c "import sys; sys.path.insert(0, 'python'); import stm32_biometric; print('✅ Package import:', stm32_biometric.__version__)"

# 2. Run tests (requires pytest)
pytest tests/ -v

# 3. Lint code (requires ruff)
ruff check python/ tests/

# 4. Check formatting (requires black)
black --check python/ tests/

# 5. Type check (requires mypy)
mypy python/
```

## 📦 Installation Options

### Option 1: Basic Installation (Minimal)

```bash
# Install only the package
pip install -e .
```

### Option 2: Development Installation (Recommended)

```bash
# Install with all development tools
pip install -e ".[dev]"

# Or use make
make dev
```

### Option 3: Full Installation (All Features)

```bash
# Install everything (dev + docs + ml + visualization)
pip install -e ".[dev,docs,ml,viz]"
```

## 🧪 Testing

### Run All Tests

```bash
# Basic pytest
pytest tests/

# With coverage (requires pytest-cov)
pytest --cov=stm32_biometric --cov-report=html tests/

# Or use make
make test
make test-cov
```

### Run Specific Test Types

```bash
# Unit tests only
pytest tests/unit/ -v -m unit

# Integration tests only
pytest tests/integration/ -v -m integration

# Fast tests only
pytest -m "not slow"
```

## 🎨 Code Quality Checks

### Linting with Ruff

```bash
# Check for issues
ruff check python/ tests/

# Auto-fix issues
ruff check python/ tests/ --fix

# Or use make
make lint
make lint-fix
```

### Formatting with Black

```bash
# Check formatting
black --check python/ tests/

# Format code
black python/ tests/

# Or use make
make format
make format-check
```

### Type Checking with MyPy

```bash
# Type check
mypy python/

# Or use make
make type-check
```

### Run All Quality Checks

```bash
# Using make (recommended)
make check-all

# Manual
ruff check python/ tests/
black --check python/ tests/
mypy python/
pytest tests/
```

## 🔧 Pre-commit Hooks (Optional)

Install pre-commit hooks to automatically run checks before each commit:

```bash
# Install pre-commit
pip install pre-commit

# Install hooks
pre-commit install

# Run on all files
pre-commit run --all-files

# Or use make
make setup-pre-commit
make pre-commit
```

## 📊 Coverage Reports

After running tests with coverage:

```bash
# View HTML report
open htmlcov/index.html  # macOS
xdg-open htmlcov/index.html  # Linux
start htmlcov/index.html  # Windows

# View terminal report
pytest --cov=stm32_biometric --cov-report=term-missing tests/
```

## 🏗️ Building the Package

```bash
# Install build tool
pip install build

# Build package
python -m build

# Or use make
make build

# Check package
twine check dist/*
```

## 🐛 Troubleshooting

### Import Errors

If you get import errors, make sure you're in the project root and:

```bash
# Add to PYTHONPATH
export PYTHONPATH="${PYTHONPATH}:$(pwd)/python"

# Or install in development mode
pip install -e .
```

### Missing Dependencies

```bash
# Install all development dependencies
pip install -e ".[dev]"

# Update dependencies
pip install --upgrade -e ".[dev]"
```

### Test Failures

```bash
# Run tests with verbose output
pytest tests/ -vv --tb=long

# Run a specific test
pytest tests/unit/test_example.py::test_basic_assertion -v
```

## 📝 Makefile Commands

See all available commands:

```bash
make help
```

Common commands:
- `make dev` - Setup development environment
- `make test` - Run tests
- `make test-cov` - Run tests with coverage
- `make lint` - Lint code
- `make format` - Format code
- `make type-check` - Type check
- `make check-all` - Run all checks
- `make clean` - Clean build artifacts

## ✨ Production Readiness Checklist

- [x] ✅ Python package structure validated
- [x] ✅ All tests passing (17/17)
- [x] ✅ Ruff linting: All checks passed
- [x] ✅ Black formatting: All files formatted
- [x] ✅ MyPy type checking: No issues found
- [x] ✅ Package imports working
- [x] ✅ Configuration files validated
- [x] ✅ Documentation complete

## 🎯 Next Steps

1. **For Development**: Run `make dev` to set up full environment
2. **For Production**: Run quick validation commands above
3. **For CI/CD**: See `.github-workflows-template/` for GitHub Actions
4. **For Documentation**: Run `make docs` to build docs

## 📚 Additional Resources

- [Contributing Guide](CONTRIBUTING.md)
- [Awesome Resources](AWESOME_RESOURCES.md)
- [Documentation](docs/README.md)
- [Python Tools README](python/README.md)

---

**Status**: ✅ Production Ready | **Tests**: 17 passing | **Coverage**: Ready | **Linting**: Passed
