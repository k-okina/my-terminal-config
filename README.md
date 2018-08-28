# 最小コマンドで俺の設定ファイルを移植する
## はじめに
私はterminalはdark、vimはlightの組み合わせが好きです。
また、keyrepeatと、各OSやディストリビューションによってデフォで設定されているKeyDelayを無くすととても気持ちよくterminalを操作できます。

## terminal + tmux + some settings vs iterm + tmux + some settings
筆者は、初めはitermを利用していましたが、keyrepeatを早くした場合key入力がitermの画面出力速度を上回ってしまい、ラグを感じるのがストレスになったのでデフォで入っているterminalを現在利用しています。また、tmuxを利用し複数ペインを操作するのが普段の使い方になってitermの機能を使わなくなったのも理由です。

## 移植する設定ファイル
* .vim
* .vimrc
* .tmux.conf
* .dircolors-solarized

# vim tmux solarized の設定ファイルを移植
## 以下のコマンドを入力
```
$ cp -r /path/to/this/repo/config/.* ~/
$ cp -r /path/to/this/repo/dircolors ~/dircolors
```

## MACのterminalをsolarizedにする
1. メニューバー ＞ ターミナル ＞ 環境設定
2. タブ ＞ 設定
3. プロファイル下部 ＞ 歯車ボタン ＞ 読み込む
4. このリポジトリのterminal-colorsディレクトリにあるsolarizedを選択してプロファイルにロードする（dark, light はお好みで）
5. プロファイルをデフォルトに設定する

# lsの表示を見やすく、かっこよくする
## Mac
### GNU版lsを導入
```
$ brew install coreutils
```

### インストールしたGNU版lsを標準で使うよう.bashrcへaliasを追加する
```
alias ls='gls --color=auto'
```

### 色の設定を読み込ませるため.bash_profileへ以下を追加する
```
eval $(gdircolors ~/dircolors/light)
```

## GNU版のlsが導入されているUnix系
### 色の設定を読み込ませるため.bash_profileへ以下を追加する (ここでは私の好きなlightを設定していますが、darkとuniversalもあるのでよかったら試してください)
```
eval $(dircolors ~/dircolors/light)
```

# vimの設定反映
## vimを起動し、vimの設定を読み込ませる
```
:source ~/.vimrc
```

# tmuxの設定反映
```
tmux source ~/.tmux.conf
```

# MacでKeyRepeat時の連続入力速度とKeyRepeatの開始速度を変更
### 設定についての詳細はリンク先を参照
### http://skygrid.co.jp/jojakudoctor/mac-key-repeat/
```
$ defaults write -g KeyRepeat -int 1
$ defaults write -g InitialKeyRepeat -int 14
```

# install brew packages
```
$ brew list
augeas                          gettext                         icu4c                           lzlib                           perl                            redis                           tmux
autoconf                        gflags                          jpeg                            mongodb                         pkg-config                      rocksdb                         unrar
awscli                          ghc                             libarchive                      mysql                           pyenv                           ruby                            vim
boost                           ghkw                            libevent                        nginx                           pyenv-virtualenv                sl                              xz
cabal-install                   git                             libmagic                        node                            python                          sleuthkit                       yara
composer                        git-now                         librdkafka                      nodebrew                        python@2                        snappy                          yarn
coreutils                       glog                            libyaml                         openssl                         rapidjson                       speedtest-cli                   zlib
fzf                             gnu-getopt                      lldpd                           osquery                         readline                        sqlite                          zstd
gdbm                            haskell-stack                   lz4                             pcre                            reattach-to-user-namespace      thrift
```

# 超便利な control + r での履歴検索の導入方法
```
https://github.com/junegunn/fzf#using-homebrew-or-linuxbrew
```

# 最後に
ここでは紹介しませんが、fzfを導入するのを強くおすすめします。
また、このドキュメントとリポジトリは完成していません。
随時メンテをしていきます。
