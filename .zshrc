# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="fino" # Left, 2 rows, git:display branch name, full path, user, rvm ruby version. (like)

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.oh-my-zsh/custom/plugins/

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Usage
# node: node-doc <api-name> will open api document by browser
plugins=(colorize command-not-found common-aliases encode64 extract gem git git-extras git-prompt golang gradle history history-substring-search iwhois mvn meteor node npm python rsync sudo systemadmin systemd tmux tmuxinator aws)


zstyle ':completion::complete:*' cache-path $HOME/.oh-my-zsh/cache/

compctl -g "*.pdf *(-/)" printpdf

# User configuration
#. /home/yangling/MyGitRepo/powerline/powerline/bindings/zsh/powerline.zsh

export PATH=$PATH:$HOME/bin:/usr/local/bin

# Enable color on man page
man() {
    env LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
        man "$@"
}

# set vi keybinding
#set -o vi

# Make sure JDK is 1.6
#[[ -x ~/.check_jdk.sh ]] && bash ~/.check_jdk.sh

# fortune
_SHOW_FORTUNE=0
[[ -n "$PS1" ]] && [[ "$TERM" == "xterm" ]] && { _SHOW_FORTUNE=1; }
[[ -n "$PS1" ]] && [[ "$TERM" == "screen" ]] && { _SHOW_FORTUNE=1; }
#_SHOW_DOGE=`echo $RANDOM % 2 | bc`
# Don't want doge now.
_SHOW_DOGE=0
[[ $_SHOW_FORTUNE -eq 1 ]] && [[ $_SHOW_DOGE -ne 1 ]] && fortune 30% tang300 30% song100 40% all | cowsay
[[ $_SHOW_DOGE -eq 1 ]] && doge

#export TERM="xterm-256color"

# /usr/lib/jvm/jdk is a symbol link. It links to the real JDK.
# Note: in /etc/profile.d/jre.sh, there is a link to real JDK, so I needn't make own link.
# Now archlinux uses archlinux-java to manage java
JAVA_HOME=/usr/lib/jvm/default
export JAVA_HOME
JRE_HOME=$JAVA_HOME/jre
PATH=$PATH:$JAVA_HOME/bin
export PATH
CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export CLASSPATH
#Tomcat
export CATALINA_HOME=/home/yangling/Downloads/Tomcat/apache-tomcat-7.0.67

# Maven setting
#export MAVEN_OPTS="-Xmx1024m -XX:MaxPermSize=300m"
export MAVEN_OPTS="-Xmx1024m -Xss10m -XX:MaxPermSize=300m"
export M2_HOME=/opt/maven

# GO Settings
GOPATH="$HOME/go"
export GOPATH
export PATH="$PATH:$GOPATH/bin"

# Ranger
RANGER_LOAD_DEFAULT_RC=false

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

[[ -f "/usr/bin/convertmp4.sh" ]] && source "/usr/bin/convertmp4.sh"

export EDITOR="es"
# https://github.com/tmuxinator/tmuxinator
export DISABLE_AUTO_TITLE=true

export TERMINAL=/usr/bin/terminator

export XDG_CONFIG_HOME=$HOME/.config

export GNUPGHOME=$XDG_CONFIG_HOME/gnupg

GPG_TTY=$(tty)
export GPG_TTY

export NOTMUCH_CONFIG=$XDG_CONFIG_HOME/notmuch/notmuch-config

# === Work Config ===
[[ -s "$HOME/Work/work-config.sh" ]] && source "$HOME/Work/work-config.sh"

# To activate zsh-syntax-highlighting, a Fish-shell-like syntax highlighting.
[[ -s /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source $ZSH/oh-my-zsh.sh

#rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

#pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
