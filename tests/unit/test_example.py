"""Example unit tests for STM32 Biometric AI package.

This module demonstrates best practices for writing tests with pytest.
"""

import pytest


class TestExample:
    """Example test class demonstrating pytest features."""

    def test_basic_assertion(self) -> None:
        """Test basic assertion - always passes."""
        assert True

    def test_arithmetic(self) -> None:
        """Test basic arithmetic operations."""
        assert 1 + 1 == 2
        assert 10 - 5 == 5
        assert 3 * 4 == 12
        assert 15 / 3 == 5

    @pytest.mark.parametrize(
        ("input_value", "expected"),
        [
            (0, 0),
            (1, 1),
            (2, 4),
            (3, 9),
            (4, 16),
            (-1, 1),
            (-2, 4),
        ],
    )
    def test_square_parametrized(self, input_value: int, expected: int) -> None:
        """Test square function with multiple parameters."""
        assert input_value**2 == expected

    def test_list_operations(self) -> None:
        """Test list operations."""
        test_list = [1, 2, 3, 4, 5]
        assert len(test_list) == 5
        assert sum(test_list) == 15
        assert max(test_list) == 5
        assert min(test_list) == 1

    def test_string_operations(self) -> None:
        """Test string operations."""
        test_string = "STM32 Biometric AI"
        assert test_string.startswith("STM32")
        assert "Biometric" in test_string
        assert len(test_string) == 18


class TestExceptionHandling:
    """Test exception handling."""

    def test_zero_division(self) -> None:
        """Test that division by zero raises ZeroDivisionError."""
        with pytest.raises(ZeroDivisionError):
            _ = 1 / 0

    def test_type_error(self) -> None:
        """Test that adding string to int raises TypeError."""
        with pytest.raises(TypeError):
            _ = "string" + 123  # type: ignore[operator]

    def test_value_error(self) -> None:
        """Test that invalid conversion raises ValueError."""
        with pytest.raises(ValueError):
            int("not a number")


@pytest.fixture
def sample_data() -> list[int]:
    """Provide sample data for tests.

    Returns:
        List of integers for testing.
    """
    return [1, 2, 3, 4, 5]


def test_with_fixture(sample_data: list[int]) -> None:
    """Test using a fixture.

    Args:
        sample_data: Sample data from fixture.
    """
    assert len(sample_data) == 5
    assert sum(sample_data) == 15


@pytest.mark.slow
def test_slow_operation() -> None:
    """Example of a slow test (marked with @pytest.mark.slow)."""
    # This would be a slow operation
    assert True


@pytest.mark.unit
def test_unit_example() -> None:
    """Example of a unit test (marked with @pytest.mark.unit)."""
    assert True
