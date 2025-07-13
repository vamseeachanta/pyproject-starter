Quick refactoring checklist for Python code:

**Automated Checks:**
- Run `ruff check --fix` for linting and style
- Run `mypy` for type safety
- Run `radon cc .` for cyclomatic complexity

**Manual Review:**
1. Functions >20 lines or with deep nesting—suggest decomposition
2. Files >500 lines—suggest splitting into modules
3. Missing Pydantic v2 models for I/O—add models with `ConfigDict`, `field_validator`
4. Cross-feature imports—flag and suggest refactoring to vertical slices
5. Classes with multiple responsibilities—split into focused classes
6. Missing type hints—add type hints to all functions/classes

**Code Example:**
```python
# Before
def process(data):
    # ... 50 lines ...

# After
def process(data):
    result = step_one(data)
    result = step_two(result)
    return result
```

**Reporting:**
- For each issue, provide location, reason, code fix, and priority
- Save a `refactor_plan.md` in PRPs/ai_docs (do not overwrite existing files)

**Tip:** Document refactor decisions in code comments for future maintainers.