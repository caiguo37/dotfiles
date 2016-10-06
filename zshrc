ZSH=$HOME/.oh-my-zsh # Path to your oh-my-zsh configuration.
ZSH_THEME="sunaku"
# 'muse,nicoulaj,sunaku' 不错

#未启用github插件,会造成卡
plugins=(
brew bundler copydir cp emoji-clock gem git git-extras gitfast heroku lein osx pj pod python rake rbenv ruby tmux tmuxinator xcode z
)

source $ZSH/oh-my-zsh.sh

#使用jj来进入vi-cmd-mode 同时交换delete和backspace键 
#wiki见http://www.macfreek.nl/memory/Backspace_and_Delete_key_reversed

bindkey -v
bindkey -M viins 'jj' vi-cmd-mode
bindkey "^?" backward-delete-char
bindkey "^[[3~" delete-char

export EDITOR=vim

export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

export PATH="$PATH:$HOME/.bin"

export PATH="$(brew --prefix sqlite)/bin:$PATH"
export PATH="$(brew --prefix llvm)/bin:$PATH"

export RBENVROOT=$(brew --prefix rbenv)
export PATH=$RBENVROOT/bin:$RBENVROOT/shims:$PATH

export ANDROID_JAVA_HOME=$(/usr/libexec/java_home)
export ANDROID_HOME=~/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

zmodload zsh/complist
autoload -Uz compinit
compinit

# And set some styles...
zstyle ':completion:*' completer _complete _approximate
zstyle ':completion:*:descriptions' format "- %d -"
zstyle ':completion:*:corrections' format "- %d - (errors %e})"
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true
zstyle ':completion:*' menu select
zstyle ':completion:*' verbose yes
zstyle ':completion:*' rehash yes
zstyle -e ':completion:*:approximate:*' max-errors \
    'reply=( $(( ($#PREFIX + $#SUFFIX) / 3 )) )'

#命令别名
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ls='ls -GF'
alias ll='ls -l'
alias la='ls -a'
alias mm='mvim'
alias vi='mvim -v'
alias vim='mvim -v'
alias td='termdown'
alias fuck='$(thefuck $(fc -ln -1))'
alias msd='mina staging deploy'
alias gpmsd='git push && mina staging deploy'
alias cal='cal | grep --color -EC6 "\b$(date +%e | sed "s/ //g")"'
alias pg-start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg-stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias enableProxy='export http_proxy=http://127.0.0.1:8016 https_proxy=http://127.0.0.1:8016'
alias disableProxy='unset http_proxy https_proxy'

source "$HOME/.zsh_pj.rc"

#路径别名 进入相应的路径时只要 cd ~xxx
hash -d work="$HOME/Documents/workspace/"
hash -d simulator="$HOME/Library/Application Support/iPhone Simulator"
hash -d mldoneky="$HOME/.mldonkey/incoming/files"

#修复tmuxinator 没正确显示names的问题
export DISABLE_AUTO_TITLE=true

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

if [ -f ~/.zsh_private_config ]; then
    source ~/.zsh_private_config
else
    print "404: ~/.zsh_private_config not found."
fi
