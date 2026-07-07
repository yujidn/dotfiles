# これは何？

開発環境の vimrc や bashrc などを置いたリポジトリです。 
自分用説明書も兼ねています。 

# 使い方

ホームディレクトリで実行する場合
```
$ git clone https://github.com/yujidn/dotfiles
$ ./dotfiles/dotfile_setup.sh
```
手動でリンクを張る場合 (`ln -s <実体> <リンク>` の順)
```
$ ln -s ~/dotfiles/.bashrc ~/.bashrc
$ ln -s ~/dotfiles/.vimrc ~/.vimrc
```
マシン固有・秘密情報を含む bash 設定は `~/.bashrc.local` (git 管理外) に書く。
存在すれば .bashrc の末尾で自動的に source される。

# vimのショートカット覚書



# tmuxのコマンド覚書

んなもんググれって感じ

## コマンド

```
起動
$ tmux
一覧
$ tmux ls
一覧したものにアタッチ
$ tmux attach -t 0
ry
$ tmux detach -t 0
きる
$ tmux kill-session -t 0
```

## ウィンドウ
新規ウィンドウ : C-b + c   
ウィンドウ切り替え : C-b * 0   
ウィンドウ削除 : C-b + &   

## ペイン分割
水平分割 : C-b + "   
垂直分割 : C-b + %   
ペイン移動 : C-b + q, C-b + o   
ペイン削除 : C-b + x   
