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
alias glone="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias glstruct="git log --graph --simplify-by-decoration --pretty=format:'%Cred%h%Creset-%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias gsl='git stash list'
alias gss='git stash save'
alias gsp='git stash pop'
alias gsa='git stash apply'

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
alias mb='mvn exec:java -pl batch-server/'

alias avd='~/Downloads/Android_SDK/android-sdk-linux/tools/android avd'

alias ..='cd ..'
alias ~='cd ~'
alias work='cd ~/EclipseWorkspace/workspace-clm-core/clm-core'

# pacman/yaourt aliases
alias pac="sudo /usr/bin/pacman -S"     # default action    - install one or more packages
alias pacn="sudo /usr/bin/pacman -S --needed"     # default action    - install one or more packages, ignore up to date packages.
alias pacdep="sudo /usr/bin/pacman -S --asdeps"     # default action, as dependency    - install one or more packages, as dependency
alias yao="/usr/bin/yaourt -S"         # default yaourt action - install one or more packages including AUR
alias pacu="sudo /usr/bin/pacman -Syu"      # '[u]pdate'        - upgrade all packages to their newest version
alias pacy="sudo /usr/bin/pacman -Sy"      # '[u]pdate database'        - upgrade all database.
alias pacur="sudo /usr/bin/pacman -Syyu"      # '[u]pdate [r]epos'        - update repos and upgrade all packages to their newest version
alias yaou="/usr/bin/yaourt -Syua"      # '[u]pdate'        - upgrade all packages to their newest version
alias pacr="sudo /usr/bin/pacman -Rcnsu"       # '[r]emove'        - uninstall one or more packages
alias pacs="/usr/bin/pacman -Ss"        # '[s]earch'        - search for a package using one or more keywords
alias yaos="/usr/bin/yaourt -Ss"       # '[y]aourt [s]earch'   - search for a package or a PKGBUILD using one or more keywords
alias paci="/usr/bin/pacman -Si"        # '[i]nfo'      - show information about a package
alias yaoi="/usr/bin/yaourt -Si"        # '[i]nfo'      - show information about a package
alias pacg="/usr/bin/pacman -Sg"        # '[g]roup'      - show information about a group
alias yaog="/usr/bin/yaourt -Sg"        # '[g]roup'      - show information about a group
alias pacqs="/usr/bin/pacman -Qs"        # '[s]earch'        - search for a package using one or more keywords
alias yaoqs="/usr/bin/yaourt -Qs"       # '[y]aourt [s]earch'   - search for a package or a PKGBUILD using one or more keywords
alias pacqi="/usr/bin/pacman -Qi"        # '[i]nfo'      - show information about a package
alias yaoqi="/usr/bin/yaourt -Qi"        # '[i]nfo'      - show information about a package
alias pacqg="/usr/bin/pacman -Qg"        # '[g]roup'      - show information about a group
alias yaoqg="/usr/bin/yaourt -Qg"        # '[g]roup'      - show information about a group
alias pacqn="/usr/bin/pacman -Qn"        # '[n]ative'      - show information about native packages
alias pacqm="/usr/bin/pacman -Qm"        # 'foreign'      - show information about foreign packages
alias paclo="/usr/bin/pacman -Qdt"      # '[l]ist [o]rphans'    - list all packages which are orphaned
alias pacc="sudo /usr/bin/pacman -Sc"      # '[c]lean cache'   - delete all not currently installed package files
alias pacca="sudo /usr/bin/pacman -Scc"      # '[c]lean [a]ll cache'   - delete all not currently installed package files
alias paclf="/usr/bin/pacman -Ql"       # '[l]ist [f]iles'  - list all files installed by a given package
alias yaoexpl="/usr/bin/yaourt -D --asexplicit" # 'mark as [expl]icit'  - mark one or more packages as explicitly installed
alias yaoimpl="/usr/bin/yaourt -D --asdeps" # 'mark as [impl]icit'  - mark one or more packages as non explicitly installed

# '[r]emove [o]rphans' - recursively remove ALL orphaned packages
alias pacro="/usr/bin/pacman -Qtdq > /dev/null && sudo /usr/bin/pacman -Rs \$(/usr/bin/pacman -Qtdq | sed -e ':a;N;$!ba;s/\n/ /g')"

# aria2
alias a2="aria2c -j5 -x5 -m5 -k1M -s5"
alias a2limit="aria2c -j5 -x5 -m5 -k1M -s5 --max-overall-download-limit=200K"

# pacnew and pacsave file
#alias pacnew='sudo find / -regextype posix-extended -regex ".+\.pac(new|save|orig)" 2> /dev/null'
alias pacnew='sudo find / -regextype posix-extended -regex ".+\.pac(new|save|orig)"'

# systemctrl
alias sysen="sudo /usr/bin/systemctl enable"
alias sysstart="sudo /usr/bin/systemctl start"
alias sysstop="sudo /usr/bin/systemctl stop"
alias sysds="sudo /usr/bin/systemctl disable"
