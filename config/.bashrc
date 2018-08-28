# lsにデフォルトカラーつける
alias ls='gls --color=auto'

# desktopにあるスクショ抹消
alias clean='rm ~/Desktop/*スクリーン*'

# gitのalias
alias g='git'
alias gclean-local='git branch --merged | grep -v "*" | xargs -I % git branch -d %'
# alias gclean-remote='git branch -a --merged | grep -v master | grep remotes/origin| sed -e "s% *remotes/origin/%%" | xargs -I% git push origin :%'
alias gclean='git pull --all --prune && gclean-local'
alias gclean-speed='git pull --all && git fetch origin --prune & gclean-local & gclean-remote &'

# gitの補完が効くようにする
source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash

# virtualenvがPS1を上書きするのを防ぐ
export VIRTUAL_ENV_DISABLE_PROMPT=1

# プロンプトにvenvとブランチ名を表示する
export GIT_PS1_SHOWDIRTYSTATE=true
# export PS1='\e[36m\e[12m\]($(pyenv version-name)) \[\e[0m\]\033[31m\]$(__git_ps1 [%s])\[\033[00m\] \h\[\033[00m\]:\W \n\$ '
export PS1='\e[36m\e[12m\]($(pyenv version-name)) \[\e[0m\]\033[31m\]$(__git_ps1 [%s])\[\033[00m\] $(pwd) \n\$ '

# dockerのalias
## dockerのdbコンテナのmysqlに接続
alias dmysql='docker exec -it `docker ps -f name=_db -q` mysql -uroot -pdocker'
alias ddbshell='docker exec -it `docker ps -f name=_db -q` bash'
alias dm='dmysql'
alias ddb='dmysql'
## dockerのサービスコンテナのbashに接続
alias dservice='docker exec -it `docker ps -f name=_service_1 -q` bash'
alias ds='dservice'
## dockerのvuejsコンテナのbashに接続
alias dvuejs='docker exec -it `docker ps -f name=_vuejs_1 -q` bash'
alias dv='dvuejs'
## dockerのnuxtコンテナのbashに接続
alias dnuxt='docker exec -it `docker ps -f name=_nuxt_1 -q` bash'
alias dn='dnuxt'
## 停止しているdockerのコンテナを削除
alias dclean='docker rm `docker ps -f "status=exited" -q`'
alias dc='dclean'
## dockerのボリュームを削除 (DBのもなんか消えちゃうのはお約束)
alias dclean-volume='docker volume ls -f "dangling=true" -q | xargs docker volume rm'
## タグ付けされていないnoneイメージを全削除
alias drmi='docker images -f dangling=true -q | xargs docker rmi'
## リポジトリ名で絞り込んで該当するイメージ全部削除
alias drmireponame='docker images | awk "$1 ~ /リポジトリ名/ { print $2 }" | xargs docker rmi'
alias dcom='docker-compose'

alias clean-history='sort ~/.bash_history | uniq > ~/.bash_history.tmp && mv ~/.bash_history.tmp ~/.bash_history'
alias ch='clean-history'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
