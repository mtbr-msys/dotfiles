# How To Use

```bash
git clone https://github.com/mtbr-msys/dotfiles.git
cd dotfiles
./setup
./install
```

# How To Update

```bash
cd dotfiles
./update
```

# requirements (Ubuntu)


```bash
sudo apt install zsh git curl wget zip unzip build-essential pkg-config autoconf tzdata locales-all libtiff-dev libxml2-dev libxpm-dev libpam-dev libsqlite3-dev libssl-dev libbz2-dev libcurl4-openssl-dev libpng-dev libonig-dev libreadline-dev libtidy-dev libxslt-dev libzip-dev libffi-dev libyaml-dev
```


and more


# phpenv config

use developer mode

```bash
phpenv install -i development <VERSION>
```

with PECL extention

```bash
export PHP_BUILD_INSTALL_EXTENSION="yaml=2.0.4 redis=5.0.2 apcu=@ imagick=@ pdo_mysql=1.0.2"
```

in low spec machine

```bash
export PHP_BUILD_EXTRA_MAKE_ARGUMENTS=-j1
```
