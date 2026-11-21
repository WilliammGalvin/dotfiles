#!/usr/bin/env sh
set -e
cd "$(dirname "$0")"

for pkg in */; do
  pkg="${pkg%/}"
  echo "stowing $pkg"
  stow --restow "$pkg"
done
