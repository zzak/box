#!/bin/bash

# exit when any command fails
set -o errexit
# exit when pipes fail
set -o pipefail

VERSION=$(./node_modules/.bin/auto version)

cat error

echo "Trying to bump: $VERSION"

if [ ! -z "$VERSION" ]; then
    yarn auto changelog
    yarn lerna publish --loglevel verbose --yes "$VERSION" -m "$VERSION [skip ci]"
fi
