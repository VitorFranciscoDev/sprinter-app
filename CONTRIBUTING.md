# Contributing Guide

Thanks for contributing to Sprinter. This guide keeps branch names, commits, and Flutter changes consistent across the project.

## Before You Start

1. Pull the latest changes from the main development branch.
2. Read the surrounding code before editing. Match the existing folder structure, naming, widget composition, state management, and domain/infrastructure boundaries.
3. Make sure the Sprinter API is available when your change depends on backend behavior.
4. Keep changes focused. Avoid unrelated formatting, refactors, or generated-file churn in the same pull request.

## Branch Naming

Use a short prefix followed by a descriptive snake_case name.

| Prefix | Use for | Example |
| --- | --- | --- |
| `ft_` | New features | `ft_login_screen` |
| `rf_` | Refactors | `rf_auth_service` |
| `ch_` | Chores, dependencies, configs, tooling | `ch_update_packages` |
| `fx_` | Bug fixes | `fx_crash_on_startup` |
| `dc_` | Documentation | `dc_readme` |
| `ts_` | Tests | `ts_auth_unit` |
| `ci_` | CI/CD changes | `ci_github_actions` |

## Commit Messages

Use this format:

```text
type(scope): Short description
```

Examples:

```text
feature(auth): Add Google sign-in support
fix(home): Resolve overflow on small screens
chore(deps): Bump Flutter dependencies
refactor(api): Simplify HTTP client setup
docs(readme): Update setup instructions
test(auth): Add unit tests for login flow
style(theme): Apply new color tokens
performance(feed): Lazy load images on scroll
ci(workflow): Add Flutter analyze step
```

Keep the subject line under 72 characters. Use the commit body for context, tradeoffs, or migration notes when needed.

Allowed types:

| Type | When to use |
| --- | --- |
| `feature` | User-facing or developer-facing feature |
| `fix` | Bug fix |
| `chore` | Maintenance, dependencies, config |
| `refactor` | Code change with no intended behavior change |
| `docs` | Documentation only |
| `test` | Adding or fixing tests |
| `style` | Formatting or visual style with no logic change |
| `performance` | Performance improvement |
| `ci` | CI/CD pipeline changes |

## Flutter Code Style

- Follow the existing architecture: domain rules/use cases, infrastructure repositories/services, and presentation screens/components.
- Prefer small widgets and shared components when a pattern already exists.
- Keep UI state in the presentation layer, currently using `ChangeNotifier` and `provider`.
- Put API calls behind repository or web service classes instead of calling HTTP directly from widgets.
- Read build-time configuration from `BuildFlags` instead of hardcoding environment-specific values.
- Keep localization strings in ARB files when text needs to be translated.
- Follow the official [Effective Dart style guide](https://dart.dev/effective-dart/style) when local patterns do not answer a question.

## Local Checks

Before opening a pull request, run:

```bash
flutter analyze
flutter test
```

If your change touches generated localization output, run the Flutter tooling that regenerates those files and review the generated diff carefully.
