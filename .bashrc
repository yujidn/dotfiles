# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# ls / grep の色付け (macOS)
export CLICOLOR=1
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /opt/homebrew/etc/profile.d/bash_completion.sh ]; then
    . /opt/homebrew/etc/profile.d/bash_completion.sh
  elif [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export EDITOR=vim

# Ctrl-S での画面フリーズを無効化
stty stop undef

# direnv
command -v direnv >/dev/null 2>&1 && eval "$(direnv hook bash)"

# git settings
[ -f ~/git/contrib/completion/git-prompt.sh ] && source ~/git/contrib/completion/git-prompt.sh
[ -f ~/git/contrib/completion/git-completion.bash ] && source ~/git/contrib/completion/git-completion.bash
# git-prompt.sh が無い環境でもプロンプトが壊れないようにする
type __git_ps1 >/dev/null 2>&1 || __git_ps1() { :; }
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[36m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '

# PATH
export PATH="$PATH:$HOME/bin"
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"
export CMAKE_PREFIX_PATH="$CMAKE_PREFIX_PATH:/usr/local/Cellar/"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/yujinunome/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/yujinunome/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/yujinunome/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/yujinunome/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

export PATH="/Applications/Android Studio.app/Contents/MacOS:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/Downloads/google-cloud-sdk/path.bash.inc" ]; then . "$HOME/Downloads/google-cloud-sdk/path.bash.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/Downloads/google-cloud-sdk/completion.bash.inc" ]; then . "$HOME/Downloads/google-cloud-sdk/completion.bash.inc"; fi

[ -f ~/.token ] && export GITHUB_TOKEN="$(cat ~/.token)"
export GITHUB_USER_NAME=yujidn

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.bash 2>/dev/null || :

# マシン固有・秘密情報を含む設定 (git 管理外)
[ -f ~/.bashrc.local ] && source ~/.bashrc.local
