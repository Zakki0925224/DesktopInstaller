#!/usr/bin/env bash


# $1 -> デスクトップ環境名（メッセージに入ります）
# $2 -> インストールコマンド（一行で続けて）
install () {
    (
    # ----------------------------------------
    #echo "20" ; sleep 2
    #echo "#リポジトリを追加中..." ; sleep 2
    # 処理
    #echo "OK" #OKシグナル（TDN処理落ち対策）

    # ----------------------------------------
    #echo "25" ; sleep 1
    #echo "#パッケージの更新中..." ; sleep 1
    # 処理
    #sudo apt-get update -y
    #echo "OK"

    # ----------------------------------------
    #echo "50" ; sleep 1
    #echo "#更新の適用中..." ; sleep 1
    # 処理
    #sudo apt-get upgrade -y
    #echo "OK"

    # ----------------------------------------
    #echo "75" ; sleep 1
    #echo "#デスクトップ環境のインストール中..." ; sleep 1
    # 処理
    #echo "OK"

    # ----------------------------------------
    #echo "100" ; sleep 2
    # ----------------------------------------
    echo "33" ; sleep 1
    echo "#パッケージの更新中" ; sleep 1
    # 処理
    sudo update-manager
    # ----------------------------------------
    echo "66" ; sleep 1
    echo "#パッケージのインストール中" ; sleep 1
    # 処理
    $1
    # ----------------------------------------
    echo "100" ; sleep 1
    ) |
    zenity \
    --progress \
    --title $0 \
    --text "パッケージの更新中..." \
    --percentage=0 \
    --no-cancel \
    --auto-close \
    --width 350 \
    --time-remaining

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

}

install "sudo apt-get install python3 -y"