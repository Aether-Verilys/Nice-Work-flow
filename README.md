# Nice Workflows

A copyable GitHub Actions baseline for small repositories. The template keeps routine work in five explicit paths:

- `tests.yml` runs fast, read-only checks on pull requests and manual dispatch.
- `pr-review.yml` reviews ready pull requests targeting `main`, with a debounced `/review` command.
- `publish.yml` validates the version, builds artifacts, creates a draft release, then publishes only after assets are attached.
- `distribute.yml` downloads a published release, validates artifacts, uploads selected destinations, and sends one Feishu result card.
- `.github/actions/feishu-notify` is the shared notification action.

Copy `.github/` into another repository, then replace the marked build and validation commands. Keep credentials in repository secrets and choose destinations with workflow inputs. The reusable contract is:

1. A release tag is stable (`vX.Y.Z`) and matches the source version.
2. Release assets are built from `main`, tested, and validated before publication.
3. Distribution only downloads published release assets; it never packages the working tree.
4. `latest` aliases are changed only after versioned assets succeed.
5. Feishu notifications are sent on publish/distribution success or failure when `FEISHU_WEBHOOK_TOKEN` is configured.

Required secrets are repository-specific. The optional common secrets are `ANTHROPIC_API_KEY`, `ANTHROPIC_BASE_URL`, and `FEISHU_WEBHOOK_TOKEN`.
