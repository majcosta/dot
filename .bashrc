#!/usr/bin/env bash
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

for cfg in "$HOME"/.bashrc.d/*.bash; do
    [ -f "$cfg" ] && source "$cfg"
done

PS1='[\u \w]\$ '

export MSVC_SDK=$HOME/msvc

export _JAVA_AWT_WM_NONREPARENTING=1 # for swaywm
export PATH=$HOME/.local/bin:$HOME/.bin:$HOME/dev/arcanist/bin:$HOME/msvc/bin/x86:$PATH
