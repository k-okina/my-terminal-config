export PATH=/usr/local:/Users/k-okina/.local/bin:$PATH
eval $(gdircolors ~/dircolors/light)

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# tmuxinatorの設定
[[ -s /Users/k-okina/.tmuxinator/scripts/tmuxinator ]] && source /Users/k-okina/.tmuxinator/scripts/tmuxinator
export EDITOR=/usr/bin/vim
export SHELL=/bin/bash

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=$HOME/.composer/vendor/bin:$PATH

export ONE_SIGNAL_APP_ID="2cff8834-aee4-43fa-8eb4-4253341a9291"
export LANG=ja_JP.UTF-8

export HISTCONTROL=ignoredups
export HISTSIZE=9999

function share_history {
  history -a
  history -c
  history -r
}
PROMPT_COMMAND='share_history'

shopt -u histappend

source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc
