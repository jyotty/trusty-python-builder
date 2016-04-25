#!/usr/bin/env bash

set -e

sudo apt-get update
sudo apt-get install -y \
  autotools-dev      \
  blt-dev            \
  bzip2              \
  dpkg-dev           \
  g++-multilib       \
  gcc-multilib       \
  libbluetooth-dev   \
  libbz2-dev         \
  libexpat1-dev      \
  libffi-dev         \
  libffi6            \
  libffi6-dbg        \
  libgdbm-dev        \
  libgpm2            \
  libncursesw5-dev   \
  libreadline-dev    \
  libsqlite3-dev     \
  libssl-dev         \
  libtinfo-dev       \
  mime-support       \
  net-tools          \
  netbase            \
  python-crypto      \
  python-mox3        \
  python-pil         \
  python-ply         \
  quilt              \
  tk-dev             \
  zlib1g-dev

sudo apt-get install -y ruby2.0 ruby2.0-dev

sudo gem2.0 update --system
sudo gem2.0 install fpm --no-ri --no-rdoc

sudo -u vagrant -H gpg --import /srv/python/pubkeys.txt
