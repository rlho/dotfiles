#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# alias
alias cd=cdls
alias gh='cd $(ghq root)/$(ghq list | peco)'
alias br='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'
alias ff=cool-peco-filename-search
alias gbb=cool-peco-git-checkout
# For git pre-commit
alias sed='gsed'

#bind
bindkey '^h' cool-peco-ssh
bindkey '^g' cool-peco-ghq

# Rails
alias be="bundle exec"

# Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

# Go
export GOPATH=$HOME/.go
export PATH=$PATH:/$GO_PATH/bin

# node
export PATH=$HOME/.nodebrew/current/bin:$PATH

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
fpath=(path/to/zsh-completions/src $fpath)

#peco
if [ -f ~/dotfiles/.peco.conf ]; then
    . ~/dotfiles/.peco.conf
fi

# ls
autoload -U compinit
compinit

export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

alias ls="ls -GF"
alias gls="gls --color"

zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'


# 木曽さんのところからパクってきたやつ
# cdすると同時にls
function cdls() {
    \cd $1;
    ls;
}

# ブランチ情報を表示
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="%1(v|%F{green}%1v%f|)"

# === cool-peco init ===
FPATH="$FPATH:/Users/takagiriho/cool-peco"
autoload -Uz cool-peco
cool-peco
# ======================
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

# DB
#mysql.server start

# direnv
export EDITOR=vim
eval "$(direnv hook zsh)"
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
export PATH="/usr/local/opt/php@7.4/bin:$PATH"
export PATH="/usr/local/opt/php@7.4/sbin:$PATH"

#. /usr/local/opt/asdf/libexec/asdf.sh
# node
#export NODE_OPTIONS=--openssl-legacy-provide
unset NODE_OPTIONS
