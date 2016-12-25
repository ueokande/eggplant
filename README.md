eggplant :eggplant: - Script Suite for NAS
========

Project and File Structure Policy
---------------------------------

```
/ <project root>
  |- bin
  |- sibin
  `- etc
```

The scripts are places in `bin` or `sbin`.

The scripts executed from command-line are placed in `bin`.  Assume that
environment variable `PATH` includes `bin`.  `bin` contains the script designed
for using hand working or checking statuses.

By contract, `sbin` contains scripts not executed by command-line, e.g. another
scripts, or system.  The scripts invoked by a service of systemd also placed in
`sbin`.  Note that environment variable `PATH` must not include `sbin`.  The
scripts in `sbin` do not have to input parameters and output errors user-friendly,
but it must exit immediately when given parameters or environment variables lacks.

scritps/sync_github_repositories.sh
-----------------------------------

`sync_github_repositories.sh` syncs GitHub repositories into local.
It is invoked by scheduled services such as systemd.

### Environment Variables

- `GITHUB_LOGIN_NAME` (mandatory) - an user name of GitHub
- `GITHUB_TOKEN` (mandatory) - an access token, which has access scopes to fetch private and public repositories
- `GITHUB_BASE_DIR` (mandatory) - a directory to clone repositories
