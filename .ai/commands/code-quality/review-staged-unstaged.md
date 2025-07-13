List and review any files in the staging area, both staged and unstaged.
Ensure you look at both new files and modified files.

Check the diff of each file to see what has changed.

Previous review report: $ARGUMENTS

May or may not be added, ignore the previous review if not specified.

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


### Performance

- No N+1 queries
- Efficient algorithms


### Reporting

- Summarize findings in markdown
- Link to relevant docs/standards
- Prioritize issues (high/medium/low)
- Proper async usage


### Documentation

1. Clear README with setup instructions
2. CLAUDE.md is up to date with any new important utils, dependencies etc for future Claude code instances


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
```

