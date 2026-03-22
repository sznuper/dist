# sznuper/dist

Distribution files for [sznuper](https://github.com/sznuper/sznuper) — install script, systemd service, and VPS E2E tests.

## Install

```sh
curl -fsSL https://raw.githubusercontent.com/sznuper/dist/main/install.sh | sh
```

To pin a specific version:

```sh
curl -fsSL https://raw.githubusercontent.com/sznuper/dist/main/install.sh | VERSION=v0.11.0 sh
```

## Contents

| Path | Description |
|------|-------------|
| `install.sh` | Self-contained install script (downloads binary, creates config, sets up systemd) |
| `systemd/sznuper.service` | Canonical systemd unit file |
| `dev/test-install.sh` | E2E test — provisions a VPS and runs the install script |
| `dev/create-server.sh` | Create a Hetzner VPS for testing |
| `dev/delete-server.sh` | Delete a Hetzner VPS |
| `dev/check-service-inline.sh` | Lint: verify install.sh heredoc matches `systemd/sznuper.service` |
