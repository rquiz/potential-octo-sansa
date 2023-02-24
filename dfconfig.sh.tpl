#!/bin/bash

# usage: ./config.sh
# setup:
#   copy the dfconfig.sh.tpl to home directory (~/)
#   rename to dfconfig.sh
#   fill out the local variables based upon the machine setup
#   source the config to update
 

REPOSPATH="SET GIT REPOS DIR HERE"
DFREPO=potential-octo-sansa

for f in .bashrc .zshrc .vimrc
do
    cd $HOME
    if [ -L $f ];
        then
            echo "$f is already linked"
        else
            echo "loading $f"
            ln -s $REPOSPATH/$DFREPO/$f $HOME/$f
    fi

    # adds configured env vars to zsh
    if [ $f = '.zshrc' ];
        then
            echo "$f gets special updates"
            out=`sed -e "s#REPOSPATH=.*#REPOSPATH=$REPOSPATH#" $f`
            echo "$out" > $f
    fi

    source $f
done

exit 0