# $1: compress file name
# $2: actual file name
function tarxz()
{
    [[ $# -eq 2 ]] || { echo "Need 2 parameters."; return 1; }
    tar -cvf $1.tar $2 && xz -9 -v -T 4 $1.tar
}

# $1: compress file name
# $2: actual file name
# $3: -a text or not
function tarenc()
{
    [[ $# -eq 2 ]] || [[ $# -eq 3 ]] || { echo "Need 2 or 3 parameters."; return 1; }
    tarxz "$1" "$2" && gpg -c -v $3 --cipher-algo AES256 "${1}.tar.xz" && rm "${1}.tar.xz"
}

# Encrypt files and delete original file.
# $1: -a, isText flag, optional
# $2: file name
function aes256r()
{
    [[ $# -eq 1 ]] || [[ $# -eq 2 ]] || { echo "Need 1 or 2 parameters."; return 1; }
    isText=0
    while [ -n "$1" ] ; do
        case "$1" in
            "-a")
                isText=1
                ;;
            *)
                theFileName="$1"
                ;;
        esac
        shift
    done
    if [ $isText -eq 1 ]; then
        gpg -c -v -a --cipher-algo AES256 $theFileName && rm $theFileName
    else
        gpg -c -v --cipher-algo AES256 $theFileName && rm $theFileName
    fi
}

# Decrypt file and delete original file.
function gpgr()
{
    gpg $1 && rm $1
}

function toc()
{
    md-toc-filter $1 > /tmp/tocmd && mv -f /tmp/tocmd $1
}

alias mypwd='pwd | xclip -i -selection c'

alias aes256='gpg -c -v --cipher-algo AES256'

alias xo='xdg-open'

alias tjoinp='tmux join-pane -h -s :. -t :-1'

# git
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
alias gla="git log --graph --all --color --pretty='%x09%h %<(20)%cn %s %Cred%d%Creset'"
alias glgg='git log --graph'
alias glp='git log -p'
alias gr='git remote'
alias glone="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias glstruct="git log --graph --simplify-by-decoration --pretty=format:'%Cred%h%Creset-%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias gsl='git stash list'
alias gss='git stash save'
alias gsp='git stash pop'
alias gsa='git stash apply'
alias gitoptimize='rm -rf .git/refs/original/ && git reflog expire --all --expire=now && git gc --prune=now && git gc --aggressive --prune=now'
alias glistskip='git ls-files -v | grep "^S"'
alias gpf='bash ~/MyGitRepo/Little/myfork/git-related/git-push-force.bash'
alias gsu='git submodule sync --recursive && git submodule update --init --recursive'

alias rmvn='rainbow --config=mvn3 -- mvn -e'
alias mci='rainbow --config=mvn3 -- mvn clean install -e'
#alias mciskip='mvn clean install -Dmaven.test.skip=true'
# maven.test.skip will skip compiling test cases, while skipTests only skip running test cases.
alias mciskip='rainbow --config=mvn3 -- mvn clean install -DskipTests=true -e'
alias mcislow='rainbow --config=mvn3 -- mvn clean install -P "slow-test,!fast-test"'
alias mciquick='rainbow --config=mvn3 -- mvn clean install -P "install-only"'
alias mcidquick='rainbow --config=mvn3 -- mvn clean install -P "development,install-only"'
alias mc='rainbow --config=mvn3 -- mvn clean'
alias mce='rainbow --config=mvn3 -- mvn eclipse:clean eclipse:eclipse'
alias mced='mvn eclipse:clean eclipse:eclipse -DdownloadJavadocs=true -DdownloadSources=true'
alias mi='rainbow --config=mvn3 -- mvn install -e'
alias miskip='rainbow --config=mvn3 -- mvn install -Dmaven.test.skip=true -e'
alias mislow='rainbow --config=mvn3 -- mvn install -P "slow-test,!fast-test"'
alias miquick='rainbow --config=mvn3 -- mvn install -P "install-only"'
alias midquick='rainbow --config=mvn3 -- mvn install -P "development,install-only"'
alias mj='rainbow --config=mvn3 -- mvn jetty:run -pl front/'
alias mb='rainbow --config=mvn3 -- mvn exec:java -pl batch-server/'

alias mdr="rainbow --config=mvn3 -- mvn dependency:resolve"
alias mdt="rainbow --config=mvn3 -- mvn dependency:tree"
alias mda="rainbow --config=mvn3 -- mvn dependency:analyze"

alias avd='~/Downloads/Android_SDK/android-sdk-linux/tools/android avd'

alias ..='cd ..'
alias ~='cd ~'
alias work='cd ~/EclipseWorkspace/workspace-globalpayroll/global-payroll/'

# pacmatic/yaourt aliases
alias pac="sudo /usr/bin/pacmatic -S"     # default action    - install one or more packages
alias pacn="sudo /usr/bin/pacmatic -S --needed"     # default action    - install one or more packages, ignore up to date packages.
alias pacdep="sudo /usr/bin/pacmatic -S --asdeps"     # default action, as dependency    - install one or more packages, as dependency
alias yao="/usr/bin/yaourt -S"         # default yaourt action - install one or more packages including AUR
alias pacu="sudo /usr/bin/pacmatic -Syu"      # '[u]pdate'        - upgrade all packages to their newest version
alias pacy="sudo /usr/bin/pacmatic -Syy"      # '[u]pdate database'        - upgrade all database.
alias pacyu="sudo /usr/bin/pacmatic -Syyu"      # '[u]pdate [r]epos'        - update repos and upgrade all packages to their newest version
alias pacdl="sudo /usr/bin/pacmatic -Syuw" # only download, no upgrade.
alias yaou="/usr/bin/yaourt -Syua --devel"      # '[u]pdate'        - upgrade all packages to their newest version
alias pacr="sudo /usr/bin/pacmatic -Rcnsu"       # '[r]emove'        - uninstall one or more packages
alias pacs="/usr/bin/pacmatic -Ss"        # '[s]earch'        - search for a package using one or more keywords
alias yaos="/usr/bin/yaourt -Ss"       # '[y]aourt [s]earch'   - search for a package or a PKGBUILD using one or more keywords
alias paci="/usr/bin/pacmatic -Si"        # '[i]nfo'      - show information about a package
alias yaoi="/usr/bin/yaourt -Si"        # '[i]nfo'      - show information about a package
alias pacg="/usr/bin/pacmatic -Sg"        # '[g]roup'      - show information about a group
alias yaog="/usr/bin/yaourt -Sg"        # '[g]roup'      - show information about a group
alias pacqs="/usr/bin/pacmatic -Qs"        # '[s]earch'        - search for a package using one or more keywords
alias yaoqs="/usr/bin/yaourt -Qs"       # '[y]aourt [s]earch'   - search for a package or a PKGBUILD using one or more keywords
alias pacqi="/usr/bin/pacmatic -Qi"        # '[i]nfo'      - show information about a package
alias yaoqi="/usr/bin/yaourt -Qi"        # '[i]nfo'      - show information about a package
alias pacqg="/usr/bin/pacmatic -Qg"        # '[g]roup'      - show information about a group
alias yaoqg="/usr/bin/yaourt -Qg"        # '[g]roup'      - show information about a group
alias pacqn="/usr/bin/pacmatic -Qn"        # '[n]ative'      - show information about native packages
alias pacqm="/usr/bin/pacmatic -Qm"        # 'foreign'      - show information about foreign packages
alias paclo="/usr/bin/pacmatic -Qdt"      # '[l]ist [o]rphans'    - list all packages which are orphaned
alias pacc="sudo /usr/bin/pacmatic -Sc"      # '[c]lean cache'   - delete all not currently installed package files
alias pacca="sudo /usr/bin/pacmatic -Scc"      # '[c]lean [a]ll cache'   - delete all not currently installed package files
alias paclf="/usr/bin/pacmatic -Ql"       # '[l]ist [f]iles'  - list all files installed by a given package
alias pacqo="/usr/bin/pacmatic -Qo"       # '[o]wn file'  - list the package which owns target file
alias yaoexpl="/usr/bin/yaourt -D --asexplicit" # 'mark as [expl]icit'  - mark one or more packages as explicitly installed
alias yaoimpl="/usr/bin/yaourt -D --asdeps" # 'mark as [impl]icit'  - mark one or more packages as non explicitly installed

# '[r]emove [o]rphans' - recursively remove ALL orphaned packages
alias pacro="/usr/bin/pacmatic -Qtdq > /dev/null && sudo /usr/bin/pacmatic -Rs \$(/usr/bin/pacmatic -Qtdq | sed -e ':a;N;$!ba;s/\n/ /g')"

# Install AUR package
alias aur="makepkg -s -i -r -c --needed"
alias aurdep="makepkg -s -i -r -c --needed --asdeps"

# Optimize arch
alias archoptimize='sudo /usr/bin/pacman -Sc && sudo pacman-optimize && sync'

# aria2
alias a2="aria2c -j5 -x5 -m5 -k1M -s5"
alias a2limit="aria2c -j5 -x5 -m5 -k1M -s5 --max-overall-download-limit=200K"
# Torrent download: a2t /path/to/torrent
# Refer to http://sourceforge.net/apps/trac/aria2/wiki/UsageExample#BitTorrentDownload
alias a2t="aria2c -u40k"

# pacnew and pacsave file
#alias pacnew='sudo find / -regextype posix-extended -regex ".+\.pac(new|save|orig)" 2> /dev/null'
alias pacnew='sudo find / -regextype posix-extended -regex ".+\.pac(new|save|orig)"'
alias pacnewnohome='sudo find / -path /home/yangling -prune -o -regextype posix-extended -regex ".+\.pac(new|save|orig)" -print'
# Grep
alias grp='grep -rniI --color --exclude-dir=.bzr --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn --exclude-dir=build --exclude-dir=dist --exclude-dir=target '
alias findsource='find . -type d \( -path "**/*/target" -o -path "**/*/.git" -o -path "**/*/.svn" -o -path "**/*/build" \) -prune -o -type f '

# systemctrl
alias sysen="sudo /usr/bin/systemctl enable"
alias sysstart="sudo /usr/bin/systemctl start"
alias sysstop="sudo /usr/bin/systemctl stop"
alias sysds="sudo /usr/bin/systemctl disable"

alias watchfind="sudo watch readlink -f /proc/$(pidof find)/cwd"

# ack
alias ack="/usr/bin/vendor_perl/ack"

#you-get for youtube
alias you-get-tube="you-get -x 127.0.0.1:8087"
# ping
alias ping="rainbow --config=ping -- ping -c 3"

alias psg="ps -ef | grep -v grep | grep"
