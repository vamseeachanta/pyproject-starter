
# pyproject_starter

Standardized Python package template for rapid library development. This repository focuses on streamlining source code creation and tool ecosystem setup for maintainable, testable, and distributable Python libraries.

## Summary

Writing good code solves business problems and makes solutions reusable. Adding tests ensures reliability and enables packaging for team or open source use. This repo provides a proven process and guidelines for building Python libraries, now using the `pyproject_starter` structure and best practices.

A developer will want to go through this process in a seamless manner. This article and repo will define a proven process and provide guidelines to write a python library.



## Repository Highlights

- Package name: `pyproject_starter` (PyPI: [pyproject-starter](https://pypi.org/project/pyproject-starter/))
- Source directory: `src/pyproject_starter/`
- Modern Python packaging with `pyproject.toml`, `hatchling`, and `bumpver`
- Automated testing and linting via GitHub Actions and pre-commit hooks
- Example code, tests, and CI/CD workflows included


## TODO

- Convert template to cookiecutter for easy reuse
- Expand GitHub Actions for full test/coverage automation


For data science project guidance, see [AI Assistant Data Science Guidance](docs/guidance/ai_assistant_data_science_guidance.md)


## Usage

Recommended practices for developing Python libraries:

![Package Development Flowchart](docs/diagrams/package_development.svg)

See: [How to publish a Python package to PyPI](https://realpython.com/pypi-publish-python-package/)

### Modern workflow

| Step | Description | Commands | Reference |
|---|---|---|---|
| 1 | Create project structure | Follow PEP8 guidelines | [FreeCodeCamp Guide](https://www.freecodecamp.org/news/build-your-first-python-package/) |
| 2 | Ensure package compliance | Add `__init__.py` to all modules | [FreeCodeCamp Guide](https://www.freecodecamp.org/news/build-your-first-python-package/) |
| 3 | Add `pyproject.toml` and use bumpver/build | `pip install bumpver`, `bumpver update --patch`, `pip install build`, `python -m build` | [RealPython Guide](https://realpython.com/pypi-publish-python-package/) |
| 4 | Upload to PyPI with twine | `twine upload dist/*` | [RealPython Guide](https://realpython.com/pypi-publish-python-package/) |


For legacy setup.py instructions, see [using setup.py](docs/tooling/using_setuppy.md)



## CI/CD

Streamlined automation for Python packages:

- Use cookiecutter for template generation
- GitHub Actions for testing, coverage, and deployment

References:

- [cookiecutter-pypackage](https://github.com/audreyfeldroy/cookiecutter-pypackage)
- [cookiecutter-pypackage tutorial](https://cookiecutter-pypackage.readthedocs.io/en/latest/tutorial.html)
- [cookiecutter on PyPI](https://pypi.org/project/cookiecutter/)
- [cookiecutter-python-package](https://github.com/boromir674/cookiecutter-python-package)
- [Data science project example](https://youtu.be/ugGu8fHWFog)



### GitHub Actions

- [Build and test Python](https://docs.github.com/en/actions/automating-builds-and-tests/building-and-testing-python)
- [Python GitHub Actions article](https://hynek.me/articles/python-github-actions/)
- [CI/CD with GitHub Actions](https://jacobtomlinson.dev/posts/2021/testing-and-continuous-integration-for-python-packages-with-github-actions/)
- [Continuous integration with Python](https://github.com/ksator/continuous-integration-with-python)
- [Automate Python testing with GitHub Actions](https://medium.com/swlh/automate-python-testing-with-github-actions-7926b5d8a865)




## Testing a Package Locally

### Using pyproject.toml (Recommended)

Editable install for local development:

- Change to the directory with `pyproject.toml`
- Run: `python -m pip install -e .`
- This uses the files in your working directory for import and testing

### Using conda-build (Optional)

- Install conda-build: `conda install conda-build`
- Build package: `conda develop .`
- [Conda build docs](https://docs.conda.io/projects/conda-build/en/latest/user-guide/tutorials/build-pkgs.html)




## Writing Tests

-- Write tests using pytest

- Example structure:
  - [luddite](https://github.com/jumptrading/luddite)
  - All tests in `test_package.py`
  - `pytest.ini` for configuration
  - [GitHub test workflow example](https://github.com/jumptrading/luddite/blob/master/.github/workflows/tests.yml)
- [tox documentation](https://tox.wiki/en/latest/)



### References

- [Build your first Python package](https://www.freecodecamp.org/news/build-your-first-python-package/)
- [Python packaging tutorial](https://python-packaging-tutorial.readthedocs.io/en/latest/setup_py.html)
- [Python packaging docs](https://packaging.python.org/)
- [Contributing to pandas](https://pandas.pydata.org/docs/development/contributing.html#contributing)
- [RealPython PyPI guide](https://realpython.com/pypi-publish-python-package/)
- [python-blueprint](https://github.com/johnthagen/python-blueprint)
