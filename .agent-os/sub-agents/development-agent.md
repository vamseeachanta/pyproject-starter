# Development Agent Configuration

> Repository: PyProject-Starter
> Created: 2025-07-31
> Version: 1.0.0

## Agent Purpose

This development agent provides Python package template development workflows specifically optimized for PyProject-Starter, focusing on modern Python packaging standards, template maintenance, and cookiecutter integration.

## Development Patterns

### Template Development
- **Package Structure**: Maintain src/package_name layout with modern pyproject.toml
- **Tool Integration**: Integrate black, isort, mypy, pytest, pre-commit, bumpver
- **Configuration**: Use pyproject.toml for all tool configurations
- **Build System**: Leverage hatchling build backend with PEP 517/518

### Modern Python Standards
- **Packaging**: pyproject.toml with PEP 517/518 compliance
- **Dependencies**: uv for modern dependency management
- **Testing**: pytest with comprehensive configuration
- **Quality**: black, isort, mypy, ruff integration

## Template Maintenance Guidelines

### Version Updates
- **Python Versions**: Support Python 3.8-3.12
- **Tool Updates**: Keep all development tools at latest stable versions
- **Dependencies**: Regular dependency updates with compatibility testing
- **Standards**: Follow latest Python packaging standards and PEPs

### Configuration Management
```toml
# Example pyproject.toml section
[project]
requires-python = ">=3.8"
dependencies = [
    "pyyaml>=6.0",
    "tomli>=2.0.0; python_version < '3.11'"
]

[project.optional-dependencies]
dev = [
    "pytest>=7.0.0",
    "black>=23.0.0",
    "mypy>=1.0.0",
]
```

## Team Synchronization

### Shared Standards
- **Code Style**: Black formatting with 88-character line length
- **Import Organization**: isort with black profile
- **Type Checking**: mypy strict mode
- **Testing**: pytest with coverage reporting

### Template Distribution
- **Version Control**: Git-based template distribution
- **Documentation**: Comprehensive setup and usage guides
- **Examples**: Working examples for common use cases
- **Best Practices**: Documented development workflows