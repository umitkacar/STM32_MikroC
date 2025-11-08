"""Pytest configuration and shared fixtures.

This module contains pytest configuration and fixtures that are shared across
all test modules.
"""

import sys
from pathlib import Path
from typing import Generator

import pytest


# Add python package to path
python_dir = Path(__file__).parent.parent / "python"
sys.path.insert(0, str(python_dir))


@pytest.fixture(scope="session")
def project_root() -> Path:
    """Get project root directory.

    Returns:
        Path to project root.
    """
    return Path(__file__).parent.parent


@pytest.fixture(scope="session")
def python_src() -> Path:
    """Get python source directory.

    Returns:
        Path to python source.
    """
    return Path(__file__).parent.parent / "python"


@pytest.fixture(scope="session")
def test_data_dir(project_root: Path) -> Path:
    """Get test data directory.

    Args:
        project_root: Project root path.

    Returns:
        Path to test data directory.
    """
    data_dir = project_root / "tests" / "data"
    data_dir.mkdir(exist_ok=True)
    return data_dir


@pytest.fixture(autouse=True)
def reset_test_state() -> Generator[None, None, None]:
    """Reset any global state before each test.

    This fixture runs automatically before each test to ensure clean state.
    """
    # Setup
    yield
    # Teardown
    pass


@pytest.fixture
def temp_dir(tmp_path: Path) -> Path:
    """Provide a temporary directory for tests.

    Args:
        tmp_path: Pytest's built-in tmp_path fixture.

    Returns:
        Path to temporary directory.
    """
    return tmp_path


# Configure pytest markers
def pytest_configure(config: pytest.Config) -> None:
    """Configure pytest with custom markers.

    Args:
        config: Pytest configuration object.
    """
    config.addinivalue_line("markers", "slow: marks tests as slow")
    config.addinivalue_line("markers", "fast: marks tests as fast")
    config.addinivalue_line("markers", "unit: unit tests")
    config.addinivalue_line("markers", "integration: integration tests")
    config.addinivalue_line("markers", "hardware: tests requiring hardware")
    config.addinivalue_line("markers", "algorithms: algorithm tests")
