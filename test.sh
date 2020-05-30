#!/usr/bin/env bash

test () {
    ($@) |
    zenity \
    --progress \
    --title $0 \
    --text "デスクトップ環境のインストール中です..." \
    --pulsate \
    --auto-close \
    --no-cancel
}

test sudo add-apt-repository -y ppa:leaeasy/dde && sudo apt-get -y update && sudo apt-get -y install dde dde-file-manager deepin-gtk-theme