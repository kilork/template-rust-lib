#!/bin/bash

set -e

cargo set-version --bump patch
VERSION=`cargo pkgid | cut -d "#" -f2`
cargo update
cargo build

git add .
git commit -m "Release v${VERSION}"
git push

git tag v${VERSION}
git push --tag