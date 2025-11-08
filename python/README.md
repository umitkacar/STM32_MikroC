# 🐍 Python Tools for STM32 Biometric AI

<div align="center">

![Python Version](https://img.shields.io/badge/python-3.10%2B-blue?style=for-the-badge&logo=python)
![Hatch](https://img.shields.io/badge/built%20with-hatch-orange?style=for-the-badge)
![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg?style=for-the-badge)
![Linting: Ruff](https://img.shields.io/badge/linting-ruff-red?style=for-the-badge)
![Type Checked: mypy](https://img.shields.io/badge/type%20checked-mypy-blue?style=for-the-badge)

</div>

## 📋 Overview

Python tools and utilities for training, testing, and deploying biometric recognition models on STM32 microcontrollers.

## 🚀 Quick Start

### Installation

```bash
# Install in development mode
make dev

# Or manually
pip install -e ".[dev]"
pre-commit install
```

### Running Tests

```bash
# Run all tests
make test

# Run with coverage
make test-cov

# Run in parallel
make test-parallel
```

### Code Quality

```bash
# Format code
make format

# Lint code
make lint

# Type check
make type-check

# Run all checks
make check-all
```

## 📁 Project Structure

```
python/
├── stm32_biometric/          # Main package
│   ├── algorithms/           # ML algorithms (PCA, LDA, DCVA)
│   ├── utils/                # Utility functions
│   ├── hardware/             # Hardware abstraction
│   └── gui/                  # GUI components
├── tests/                    # Test suite
│   ├── unit/                 # Unit tests
│   └── integration/          # Integration tests
└── scripts/                  # Helper scripts
```

## 🛠️ Development Tools

### Hatch Commands

```bash
# Run tests
hatch run test

# Run tests with coverage
hatch run test-cov

# Lint code
hatch run lint

# Format code
hatch run format

# Type check
hatch run type-check

# Run all checks
hatch run all
```

### Make Commands

See `make help` for all available commands.

## 📊 Testing

Tests are written with pytest and include:

- ✅ Unit tests for individual components
- 🔗 Integration tests for system-level validation
- 📈 Code coverage reporting
- ⚡ Parallel test execution

### Running Specific Tests

```bash
# Unit tests only
make test-unit

# Integration tests only
make test-integration

# Tests with specific marker
pytest -m algorithms
```

## 🎨 Code Style

This project uses:

- **Black** for code formatting (100 char line length)
- **Ruff** for linting (ultra-fast Python linter)
- **MyPy** for type checking
- **isort** for import sorting

All enforced via pre-commit hooks.

## 🔧 Pre-commit Hooks

Pre-commit hooks automatically run on every commit:

```bash
# Install hooks
make setup-pre-commit

# Run manually
make pre-commit

# Update hooks
make pre-commit-update
```

## 📚 Documentation

Build documentation:

```bash
make docs
```

Serve locally:

```bash
make docs-serve
```

## 🔒 Security

Security checks with Bandit and Safety:

```bash
make security
```

## 📦 Building & Publishing

```bash
# Build package
make build

# Check package
make build-check

# Publish to TestPyPI
make publish-test

# Publish to PyPI
make publish
```

## 🤝 Contributing

See [CONTRIBUTING.md](../CONTRIBUTING.md) for guidelines.

## 📜 License

MIT License - see [LICENSE](../LICENSE) for details.
