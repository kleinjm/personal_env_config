#!/usr/bin/env sh

set -e
set -o pipefail

DEPENDENCIES_SCRIPTS_PATH=$DOTFILES_DIR/mac/scripts/dependencies
SHARED_DEPENDENCIES_SCRIPTS_PATH=$DOTFILES_DIR/shared/scripts/dependencies

# NOTE: do not use loop or sort list because
# files in the scripts dir are order dependent
#
# H - Enable ! style history substitution
bash $DEPENDENCIES_SCRIPTS_PATH/xcode.sh -H
bash $DEPENDENCIES_SCRIPTS_PATH/zsh.sh -H
bash $DEPENDENCIES_SCRIPTS_PATH/brew.sh -H
bash $DEPENDENCIES_SCRIPTS_PATH/python.sh -H
bash $DEPENDENCIES_SCRIPTS_PATH/ctags.sh -H
bash "$SHARED_DEPENDENCIES_SCRIPTS_PATH"/gems.sh -H
bash $SHARED_DEPENDENCIES_SCRIPTS_PATH/node.sh -H
bash $SHARED_DEPENDENCIES_SCRIPTS_PATH/zsh_autosuggestions.sh -H
bash "$DEPENDENCIES_SCRIPTS_PATH"/downloaded_apps.sh -H
