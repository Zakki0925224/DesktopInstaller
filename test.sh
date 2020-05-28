#!/usr/bin/env bash

(
    # ----------------------------------------
    echo "25" ; sleep 2
    echo "#リポジトリを追加中..." ; sleep 2
    # 処理
    echo "OK"

    # ----------------------------------------
    echo "50" ; sleep 2
    echo "#パッケージの更新中..." ; sleep 2
    # 処理
    sudo apt-get update -y
    echo "OK"

    # ----------------------------------------
    echo "60" ; sleep 2
    echo "#更新の適用中..." ; sleep 2
    # 処理
    sudo apt-get upgrade -y
    echo "OK"

    # ----------------------------------------
    echo "75" ; sleep 2
    echo "#DDEのインストール中..." ; sleep 2
    # 処理
    echo "OK"

    # ----------------------------------------
    echo "100" ; sleep 2
) |
zenity \
--progress \
--title $0 \
--text "リポジトリを追加中..." \
--percentage=0 \
--no-cancel \
--auto-close \
--width 350

if [ $? = 1 ]; then
    zenity \
    --error \
    --text "更新がキャンセルされました。"
fi

zenity \
--info \
--title $0 \
--text "インストールが完了しました。" \
--width 350