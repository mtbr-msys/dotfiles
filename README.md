# Dotfiles

Opinionated zsh-centric dotfiles that keep each runtime manager in an
architecture-suffixed directory (for example `~/.pyenv_arm64`). The helper
scripts below automate symlink creation, tool installation, and updates.

## Quick Start

```bash
git clone https://github.com/mtbr-msys/dotfiles.git
cd dotfiles
./setup    # symlink .zshenv/.zshrc/.git* into $HOME
./install  # clone env managers (jenv, nodenv, rbenv, pyenv, phpenv, goenv, etc.)
```

`setup` is safe to rerun; it simply refreshes the symlinks. Running `install`
keeps the local clones up to date by calling `git pull` if they already exist.

## Script Cheat Sheet

| script        | purpose |
| ------------- | ------- |
| `setup`       | Creates symlinks from this repo to `$HOME` for zsh/git config. |
| `install`     | Installs Homebrew on macOS (under `~/.homebrew_<arch>`) and clones each `*env`. |
| `update`      | Pulls the latest commits for every managed runtime (`jenv`, `nodenv`, `ruby-build`, `pyenv`, `php-build`, `goenv`, …). |
| `migrate_arch`| Renames legacy directories (e.g. `~/.pyenv` → `~/.pyenv_<arch>`) so that `.zshenv` can load them automatically. |

## Keeping Toolchains Fresh

```bash
cd ~/dotfiles
./update
```

`update` only runs against runtimes that are already on `PATH`, making it safe on
machines where some toolchains are missing.

## Migrating Existing Environments

If you previously installed the runtimes without an architecture suffix, run:

```bash
cd ~/dotfiles
./migrate_arch
```

Afterward, restart the shell so `.zshenv` picks up the renamed directories.

## Requirements

### Ubuntu packages

```bash
sudo apt install zsh git curl wget zip unzip build-essential pkg-config autoconf tzdata locales-all libtiff-dev libxml2-dev libxpm-dev libpam-dev libsqlite3-dev libssl-dev libbz2-dev libcurl4-openssl-dev libpng-dev libonig-dev libreadline-dev libtidy-dev libxslt-dev libzip-dev libffi-dev libyaml-dev
```

Additional libraries may be needed depending on the language versions you build.

### macOS

`install` bootstraps a standalone Homebrew under `~/.homebrew_<arch>`. Ensure
`curl` and `tar` are available (they are by default) and allow execution of
scripts downloaded from GitHub.

### Wonderful Toolchain (Linux)

The [official Wonderful wiki](https://wonderful.asie.pl/wiki/doku.php?id=getting_started:linux)
documents the SDK bootstrap process. Highlights:

- Needs a reasonably recent Linux distro, x86_64/AArch64 CPU, and base tools (`bash`, `git`, `make`).
- Download the matching bootstrap archive: [`wf-bootstrap-x86_64`](https://wonderful.asie.pl/bootstrap/wf-bootstrap-x86_64.tar.gz) or [`wf-bootstrap-aarch64`](https://wonderful.asie.pl/bootstrap/wf-bootstrap-aarch64.tar.gz).
- Install to `/opt/wonderful` (hard requirement right now):
  ```bash
  sudo mkdir -p /opt/wonderful
  sudo chown -R "$USER" /opt/wonderful
  cd /opt/wonderful && tar xzvf /path/to/wf-bootstrap-<arch>.tar.gz
  /opt/wonderful/bin/wf-pacman -Syu wf-tools   # no sudo
  source /opt/wonderful/bin/wf-env             # exports toolchain paths
  ```
- When done, continue with the [post-install guide](https://wonderful.asie.pl/wiki/doku.php?id=getting_started:finish).
- Troubleshooting: if `wf-pacman` complains about `setting certificate file: /etc/ssl/certs/ca-certificates.crt`, install your distro’s CA bundle (e.g., `sudo apt install ca-certificates` on Debian/Ubuntu).

## PHP Build Tips

Developer-mode build (skips stripping):

```bash
phpenv install -i development <VERSION>
```

Install common PECL extensions during the build:

```bash
export PHP_BUILD_INSTALL_EXTENSION="yaml=2.0.4 redis=5.0.2 apcu=@ imagick=@ pdo_mysql=1.0.2"
```

On low-spec machines, force serial builds:

```bash
export PHP_BUILD_EXTRA_MAKE_ARGUMENTS=-j1
```
