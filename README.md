eggplant :eggplant: - Script Suite for NAS
========

scritps/sync_github_repositories.sh
-----------------------------------

`sync_github_repositories.sh` syncs GitHub repositories into local.
It is invoked by scheduled services such as systemd.

### Environment Variables

- `GITHUB_LOGIN_NAME` (mandatory) - an user name of GitHub
- `GITHUB_TOKEN` (mandatory) - an access token, which has access scopes to fetch private and public repositories
- `GITHUB_BASE_DIR` (mandatory) - a directory to clone repositories
