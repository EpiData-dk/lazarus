#!/bin/bash

NEW_VERSION=$(echo "$LAZARUS_VERSION" | tr "." _)
RELEASE="lazarus_$NEW_VERSION"

wget -nc "https://gitlab.com/freepascal.org/lazarus/lazarus/-/archive/$RELEASE/lazarus-$RELEASE.tar.gz"
tar zxf "lazarus-$RELEASE.tar.gz"
mv "lazarus-$RELEASE" "lazarus"