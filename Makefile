# ==================== Makefile for STM32 Biometric AI ====================
# Ultra-modern Python development workflow with Hatch

.PHONY: help install dev test lint format type-check clean docs build publish all

# Colors for output
CYAN := \033[0;36m
GREEN := \033[0;32m
YELLOW := \033[0;33m
RED := \033[0;31m
NC := \033[0m # No Color

help:  ## 📖 Show this help message
	@echo "$(CYAN)STM32 Biometric AI - Development Commands$(NC)"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "  $(GREEN)%-20s$(NC) %s\n", $$1, $$2}'
	@echo ""

# ==================== Installation ====================

install:  ## 📦 Install package in production mode
	@echo "$(CYAN)Installing package...$(NC)"
	pip install -e .

dev:  ## 🛠️  Install package in development mode with all dependencies
	@echo "$(CYAN)Installing development environment...$(NC)"
	pip install -e ".[dev,docs,ml,viz]"
	pre-commit install
	@echo "$(GREEN)✅ Development environment ready!$(NC)"

setup-pre-commit:  ## 🔧 Setup pre-commit hooks
	@echo "$(CYAN)Setting up pre-commit hooks...$(NC)"
	pre-commit install --install-hooks
	pre-commit install --hook-type commit-msg
	@echo "$(GREEN)✅ Pre-commit hooks installed!$(NC)"

# ==================== Testing ====================

test:  ## 🧪 Run tests
	@echo "$(CYAN)Running tests...$(NC)"
	hatch run test

test-cov:  ## 📊 Run tests with coverage report
	@echo "$(CYAN)Running tests with coverage...$(NC)"
	hatch run test-cov
	@echo "$(GREEN)Coverage report: htmlcov/index.html$(NC)"

test-parallel:  ## ⚡ Run tests in parallel
	@echo "$(CYAN)Running tests in parallel...$(NC)"
	hatch run test-parallel

test-unit:  ## 🎯 Run unit tests only
	@echo "$(CYAN)Running unit tests...$(NC)"
	pytest tests/unit/ -v

test-integration:  ## 🔗 Run integration tests only
	@echo "$(CYAN)Running integration tests...$(NC)"
	pytest tests/integration/ -v -m integration

test-watch:  ## 👁️  Run tests in watch mode
	@echo "$(CYAN)Running tests in watch mode...$(NC)"
	pytest-watch tests/ -v

# ==================== Code Quality ====================

lint:  ## 🔍 Run linter (Ruff)
	@echo "$(CYAN)Running Ruff linter...$(NC)"
	hatch run lint

lint-fix:  ## 🔧 Run linter with auto-fix
	@echo "$(CYAN)Running Ruff with auto-fix...$(NC)"
	ruff check python tests --fix

format:  ## 🎨 Format code with Black and Ruff
	@echo "$(CYAN)Formatting code...$(NC)"
	hatch run format
	ruff format python tests
	@echo "$(GREEN)✅ Code formatted!$(NC)"

format-check:  ## ✅ Check code formatting
	@echo "$(CYAN)Checking code formatting...$(NC)"
	hatch run format-check

type-check:  ## 🔬 Run type checker (MyPy)
	@echo "$(CYAN)Running MyPy type checker...$(NC)"
	hatch run type-check

check-all:  ## 🚀 Run all checks (format, lint, type-check, test)
	@echo "$(CYAN)Running all checks...$(NC)"
	hatch run all
	@echo "$(GREEN)✅ All checks passed!$(NC)"

pre-commit:  ## 🔄 Run pre-commit hooks on all files
	@echo "$(CYAN)Running pre-commit hooks...$(NC)"
	pre-commit run --all-files

pre-commit-update:  ## ⬆️  Update pre-commit hooks
	@echo "$(CYAN)Updating pre-commit hooks...$(NC)"
	pre-commit autoupdate

# ==================== Documentation ====================

docs:  ## 📚 Build documentation
	@echo "$(CYAN)Building documentation...$(NC)"
	hatch run docs:build
	@echo "$(GREEN)Documentation: docs/_build/html/index.html$(NC)"

docs-serve:  ## 🌐 Serve documentation locally
	@echo "$(CYAN)Serving documentation at http://localhost:8000$(NC)"
	hatch run docs:serve

docs-clean:  ## 🧹 Clean documentation build
	@echo "$(CYAN)Cleaning documentation...$(NC)"
	rm -rf docs/_build

# ==================== Build & Publish ====================

build:  ## 📦 Build package
	@echo "$(CYAN)Building package...$(NC)"
	python -m build
	@echo "$(GREEN)✅ Package built: dist/$(NC)"

build-check:  ## ✅ Check built package
	@echo "$(CYAN)Checking package...$(NC)"
	twine check dist/*

publish-test:  ## 🚀 Publish to TestPyPI
	@echo "$(YELLOW)Publishing to TestPyPI...$(NC)"
	twine upload --repository testpypi dist/*

publish:  ## 🚀 Publish to PyPI
	@echo "$(RED)Publishing to PyPI...$(NC)"
	@read -p "Are you sure? [y/N] " -n 1 -r; \
	echo; \
	if [[ $$REPLY =~ ^[Yy]$$ ]]; then \
		twine upload dist/*; \
		echo "$(GREEN)✅ Published to PyPI!$(NC)"; \
	fi

# ==================== Cleaning ====================

clean:  ## 🧹 Clean build artifacts
	@echo "$(CYAN)Cleaning build artifacts...$(NC)"
	rm -rf build/ dist/ *.egg-info
	rm -rf .pytest_cache .ruff_cache .mypy_cache
	rm -rf htmlcov/ .coverage coverage.xml
	find . -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true
	find . -type f -name "*.pyc" -delete
	find . -type f -name "*.pyo" -delete
	@echo "$(GREEN)✅ Cleaned!$(NC)"

clean-all: clean docs-clean  ## 🧹 Clean everything
	@echo "$(CYAN)Cleaning everything...$(NC)"
	rm -rf .hatch/
	rm -rf .venv/ venv/
	@echo "$(GREEN)✅ Everything cleaned!$(NC)"

# ==================== Development ====================

shell:  ## 🐚 Start IPython shell with package loaded
	@echo "$(CYAN)Starting IPython shell...$(NC)"
	hatch run ipython

notebook:  ## 📓 Start Jupyter notebook
	@echo "$(CYAN)Starting Jupyter notebook...$(NC)"
	jupyter notebook

repl:  ## 🔄 Start Python REPL with package loaded
	@echo "$(CYAN)Starting Python REPL...$(NC)"
	hatch run python

# ==================== CI/CD ====================

ci:  ## 🤖 Run CI pipeline locally
	@echo "$(CYAN)Running CI pipeline...$(NC)"
	@$(MAKE) format-check
	@$(MAKE) lint
	@$(MAKE) type-check
	@$(MAKE) test-cov
	@echo "$(GREEN)✅ CI pipeline passed!$(NC)"

# ==================== Git Hooks ====================

commit:  ## 💬 Interactive commit with commitizen
	@echo "$(CYAN)Creating commit...$(NC)"
	cz commit

bump-patch:  ## 🔖 Bump patch version
	@echo "$(CYAN)Bumping patch version...$(NC)"
	hatch version patch

bump-minor:  ## 🔖 Bump minor version
	@echo "$(CYAN)Bumping minor version...$(NC)"
	hatch version minor

bump-major:  ## 🔖 Bump major version
	@echo "$(CYAN)Bumping major version...$(NC)"
	hatch version major

# ==================== Utilities ====================

deps-update:  ## ⬆️  Update all dependencies
	@echo "$(CYAN)Updating dependencies...$(NC)"
	pip install --upgrade pip
	pip install --upgrade -e ".[dev,docs,ml,viz]"
	pre-commit autoupdate

deps-list:  ## 📋 List installed dependencies
	@echo "$(CYAN)Installed dependencies:$(NC)"
	pip list

deps-tree:  ## 🌳 Show dependency tree
	@echo "$(CYAN)Dependency tree:$(NC)"
	pip install pipdeptree
	pipdeptree

security:  ## 🔒 Run security checks
	@echo "$(CYAN)Running security checks...$(NC)"
	bandit -r python/ -c pyproject.toml
	safety check

stats:  ## 📊 Show project statistics
	@echo "$(CYAN)Project Statistics:$(NC)"
	@echo "Python files: $$(find python -name '*.py' | wc -l)"
	@echo "Test files: $$(find tests -name '*.py' | wc -l)"
	@echo "Lines of code: $$(find python -name '*.py' -exec cat {} \; | wc -l)"
	@echo "Lines of tests: $$(find tests -name '*.py' -exec cat {} \; | wc -l)"

# Default target
.DEFAULT_GOAL := help
