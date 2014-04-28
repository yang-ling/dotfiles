# Path to your oh-my-zsh configuration.
ZSH=/usr/share/oh-my-zsh/

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#. /home/yangling/MyGitRepo/powerline/powerline/bindings/zsh/powerline.zsh

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
[[ -x ~/.check_jdk.sh ]] && bash ~/.check_jdk.sh

# fortune
[[ -n "$PS1" ]] && fortune 30% tang300 30% song100 40% all | cowsay

# /usr/lib/jvm/jdk is a symbol link. It links to the real JDK.
JAVA_HOME=/usr/lib/jvm/jdk
export JAVA_HOME
JRE_HOME=$JAVA_HOME/jre
PATH=$PATH:$JAVA_HOME/bin
export PATH
CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export CLASSPATH
#Tomcat
export CATALINA_HOME=/home/yangling/Downloads/Tomcat/apache-tomcat-6.0.37

# Maven setting
#export MAVEN_OPTS="-Xmx1024m -XX:MaxPermSize=300m"
export MAVEN_OPTS="-Xmx1024m -Xss10m -XX:MaxPermSize=300m"
export M2_HOME=/opt/maven

# gem install needs this, otherwise warning will happen
PATH=$PATH:/home/yangling/.gem/ruby/2.0.0/bin:/root/.gem/ruby/2.0.0/bin
export GEM_HOME=/home/yangling/.gem/ruby/2.0.0

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
