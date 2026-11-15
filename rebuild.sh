#!/bin/sh

# Rebuilds the plugin against latest bob.jar. Needs JDK >= 25.

set -eu; jar=webp_import/plugins/share/defold-webp-import-plugin.jar

[ -f bob.jar ] || curl -fsSL -o bob.jar https://github.com/defold/defold/releases/latest/download/bob.jar

rm -rf .build; mkdir -p .build "${jar%/*}"

javac --release 25 -cp bob.jar -d .build pluginsrc/com/defold/extension/pipeline/webp/*.java

jar cf "$jar" -C .build .; rm -rf .build bob.jar
