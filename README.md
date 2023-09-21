Draft code for a target UX to make a Python envrionment using Nix.

Use case: "magic 1 liner to get a Python environment for data science work"

Update lockfile:

```console
$ nix run -L -f default.nix config.lock.refresh
```

Activate Python environment

```console
$ nix develop -L -f default.nix devShell
```
