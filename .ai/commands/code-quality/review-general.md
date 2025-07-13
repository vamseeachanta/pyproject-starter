# Code Review

Please perform a comprehensive code review of the current changes or specified files.

## Review Scope
$ARGUMENTS

## Review Process

1. **Understand Changes**
   - If reviewing staged changes: `git diff --staged`
   - If reviewing specific files: Read the specified files
   - If reviewing a PR: `gh pr view $ARGUMENTS --json files,additions,deletions`
   - If reviewing a local directory: `git diff $ARGUMENTS`
   - If reviewing the entire codebase: `git diff origin/main`

## Review Focus Areas

### Code Quality Checklist
- Type hints on all functions and classes
- Pydantic v2 models for data validation
- No print() statements (use logging)
- Proper error handling
- Following PEP 8
- Docstrings following Google style

### Pydantic v2 Patterns
- Use `ConfigDict` not `class Config`
- Use `field_validator` not `@validator`
- Use `model_dump()` not `dict()`
- Use `Annotated` types where appropriate

### Security
- Input validation on all endpoints
- No SQL injection vulnerabilities
- Passwords properly hashed
- No hardcoded secrets
- Run `pip-audit` or `safety` for dependency checks

### Structure
- Unit tests co-located with code in `tests/`
- Each feature self-contained (models, service, tools)
- Shared components only for multi-feature use
- Future improvements (e.g., multiple AI providers) in `src/shared/ai_providers/`
- Integration tests in `tests/integration/`

### Linting & Automation
- Run `ruff check --fix` and `mypy`
- Use pre-commit hooks for linting/formatting

### Testing
- New code has tests
- Edge cases covered
- Mock external dependencies
- Run `pytest --cov` for coverage

### Reporting
- Summarize findings in markdown
- Link to relevant docs/standards
- Prioritize issues (high/medium/low)

**Example Pydantic v2 Model:**
```python
from pydantic import BaseModel, ConfigDict, field_validator

class User(BaseModel):
    model_config = ConfigDict()
    name: str
    age: int

    @field_validator('age')
    def check_age(cls, v):
        if v < 0:
            raise ValueError('Age must be positive')
        return v
```
   - New code has tests
   - Edge cases covered
   - Mocking external dependencies

7. **Performance**
   - No N+1 queries
   - Efficient algorithms
   - Proper async usage

8. **Documentation**
   - Clear README with setup instructions
   - CLAUDE.md is up to date with any new important utils, dependencies etc for future cluade code instances

## Review Output

Create a concise review report with:

```markdown
# Code Review #[number]

## Summary
[2-3 sentence overview]

## Issues Found

### 🔴 Critical (Must Fix)
- [Issue with file:line and suggested fix]

### 🟡 Important (Should Fix)
- [Issue with file:line and suggested fix]

### 🟢 Minor (Consider)
- [Improvement suggestions]

## Good Practices
- [What was done well]

## Test Coverage
Current: X% | Required: 80%
Missing tests: [list]
Save report to PRPs/code_reviews/review[#].md (check existing files first)

