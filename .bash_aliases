function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

alias g=git
alias gs='git status'
alias ga='git add'
alias gau='git add -u'
alias gb='git branch'
alias gbr='git branch -r'
alias gc='git commit -v'
alias gco='git checkout'
alias gdt='git difftool'
alias gfa='git fetch --all'
alias gm='git merge'
alias gp='git push origin $(current_branch)'
alias glg='git log --stat'
alias glga='git log --graph --all --decorate --pretty=oneline'
alias glgg='git log --graph'
alias glp='git log -p'
alias gr='git rebase'

alias mci='mvn clean install'
alias mciskip='mvn clean install -Dmaven.test.skip=true'
alias mcislow='mvn clean install -P "slow-test,!fast-test"'
alias mciquick='mvn clean install -P "install-only"'
alias mcidquick='mvn clean install -P "development,install-only"'
alias mc='mvn clean'
alias mce='mvn eclipse:clean eclipse:eclipse'
alias mi='mvn install'
alias miskip='mvn install -Dmaven.test.skip=true'
alias mislow='mvn install -P "slow-test,!fast-test"'
alias miquick='mvn install -P "install-only"'
alias midquick='mvn install -P "development,install-only"'
alias mj='mvn jetty:run -pl front/'

alias avd='~/Downloads/Android_SDK/android-sdk-linux/tools/android avd'

alias ..='cd ..'
alias ~='cd ~'
alias work='cd ~/EclipseWorkspace/workspace-clm-core/clm-core'
