# Contributing Guide

Thanks for contributing! Please read this guide before opening a PR.

---

## Git Standards

### Branch Naming

| Prefix | Use for |
|--------|---------|
| `ft_` | New features — `ft_login_screen` |
| `rf_` | Refactors — `rf_auth_service` |
| `ch_` | Chores (deps, configs, tooling) — `ch_update_packages` |
| `fix_` | Bug fixes — `fix_crash_on_startup` |
| `docs_` | Documentation — `docs_readme` |
| `test_` | Tests — `test_auth_unit` |
| `ci_` | CI/CD changes — `ci_github_actions` |

### Commit Messages

Follow the pattern: `type(scope): Short description`

```
feature(auth): Add Google sign-in support
fix(home): Resolve overflow on small screens
chore(deps): Bump flutter to 3.22.0
refactor(api): Simplify http client setup
docs(readme): Update setup instructions
test(auth): Add unit tests for login flow
style(theme): Apply new color tokens
performance(feed): Lazy load images on scroll
```

**Types:**

| Type          | When to use |
|---------------|-------------|
| `feature`     | New feature |
| `fix`         | Bug fix |
| `chore`       | Maintenance, deps, config |
| `refactor`    | Code change with no behavior change |
| `docs`        | Documentation only |
| `test`        | Adding or fixing tests |
| `style`       | Formatting, no logic change |
| `performance` | Performance improvement |
| `ci`          | CI/CD pipeline changes |

> Keep the subject line under 72 characters. Use the body for context if needed.

---

## Flutter Code Style

Before writing any code, **read through the existing codebase** and match its patterns — folder structure, state management approach, widget composition, naming conventions, and architecture. The goal is consistency: your code should look like it was already there.

When in doubt, follow the [official Dart style guide](https://dart.dev/effective-dart/style).