#!/usr/bin/env bash

set -e

_BASE_DIR=$(pwd)

# Common Funcstions
echoHeader()
{
    # Blue, underline
    echo -e "\033[0;34;4m${1}\033[0m"
}
echoSection()
{
    echo -e "\033[47;30m${1}\033[0m"
}
echoInfo()
{
    # Green
    echo -e "\033[0;32m${1}\033[0m"
}
echoError()
{
    # Red
    echo -e "\033[0;31m${1}\033[0m"
}
# Common Funcstions End

check()
{
    echo "Check dot files installation"
    echo "PWD is $_BASE_DIR"

    # bash_aliases
    [[ -h ~/.bash_aliases ]] || { echoError "No .bash_aliases found in ~/";  }
    # .bashrc
    [[ -h ~/.bashrc ]] || { echoError "No .bashrc found in ~/";  }
    # .editorconfig
    [[ -h ~/.editorconfig ]] || { echoError "No .editorconfig found in ~/";  }
    # .inputrc
    [[ -h ~/.inputrc ]] || { echoError "No .inputrc found in ~/";  }
    # linux_setting.vim
    [[ -h ~/linux_setting.vim ]] || { echoError "No .linux_setting.vim found in ~/";  }
    # pacman.conf
    [[ -h /etc/pacman.conf ]] || { echoError "No pacman.conf found in /etc"; }
    # .tmux.conf
    [[ -d ~/.byobu ]] || { echoError "You may not install byobu"; }
    [[ -h ~/.byobu/.tmux.conf ]] || { echoError "No .tmux.conf found in ~/.byobu"; }
    # .vimrc
    [[ -h ~/.vimrc ]] || { echoError "No .vimrc found in ~/"; }
    # .vrapperrc
    [[ -h ~/.vrapperrc ]] || { echoError "No .vrapperrc found in ~/"; }
    # .xprofile
    [[ -h ~/.xprofile ]] || { echoError "No .xprofile found in ~/"; }
    # .zshrc
    [[ -h ~/.zshrc ]] || { echoError "No .zshrc found in ~/"; }
    # .gitconfig
    [[ -h ~/.gitconfig ]] || { echoError "No .gitconfig found in ~/"; }
    # .gitignore_global
    [[ -h ~/.gitignore_global ]] || { echoError "No .gitconfig found in ~/"; }
    # .newsbeuter's config and url
    [[ -d ~/.newsbeuter ]] || { echoError "You may not install newsbeuter"; }
    [[ -h ~/.newsbeuter/config ]] || { echoError "No config found in ~/.newsbeuter"; }
    [[ -h ~/.newsbeuter/url ]] || { echoError "No url found in ~/.newsbeuter"; }
    # common-aliases.plugin.zsh
    [[ -d ~/.oh-my-zsh ]] || { echoError "You may not install oh-my-zsh"; }
    [[ -h ~/.oh-my-zsh/custom/plugins/common-aliases.plugin.zsh ]] || { echoError " No common-aliases.plugin.zsh found in ~/.oh-my-zsh/custom/plugins"; }
    # TODO rainbow
    # SSH Key on KDE
    [[ -h ~/.kde4/Autostart/autostart.sh ]] || { echoError "No autostart.sh found in ~/.kde4/Autostart";}
    [[ -h ~/.kde4/env/env-pre-autostart.sh ]] || { echoError "No env-pre-autostart.sh found in ~/.kde4/env";}
    [[ -h ~/.kde4/shutdown/shutdown.sh ]] || { echoError "No shutdown.sh found in ~/.kde4/shutdown";}
    # vim spell
    [[ -h ~/.vim/spell/en.utf-8.add ]] || { echoError "No en.utf-8.add found in ~/.vim/spell"; }
}

doln()
{
    sourceFile=$1
    targetFile=$2
    [[ -f $sourceFile ]] || { echoError "$sourceFile does not exist!"; exit 1; }
    ln -sf $sourceFile $targetFile
    echoInfo "${sourceFile} --> ${targetFile}"
}

install()
{
    echoHeader "Install dot files"

    # bash_aliases
    doln ${_BASE_DIR}/.bash_aliases ~/.bash_aliases
    # .bashrc, using archlinux
    doln ${_BASE_DIR}/.bashrc_kde_arch ~/.bashrc
    # .editorconfig
    doln ${_BASE_DIR}/.editorconfig ~/.editorconfig
    # .inputrc
    doln ${_BASE_DIR}/.inputrc ~/.inputrc
    # linux_setting.vim
    doln ${_BASE_DIR}/linux_setting.vim ~/linux_setting.vim
    # .vimrc
    doln ${_BASE_DIR}/.vimrc ~/.vimrc
    # .vrapperrc
    doln ${_BASE_DIR}/.vrapperrc ~/.vrapperrc
    # .xprofile
    doln ${_BASE_DIR}/.xprofile ~/.xprofile
    # .zshrc
    doln ${_BASE_DIR}/.zshrc ~/.zshrc
    # .gitconfig
    doln ${_BASE_DIR}/GitFile/.gitconfig ~/.gitconfig
    # .gitignore_global
    doln ${_BASE_DIR}/GitFile/.gitignore_global ~/.gitignore_global
    # vim spell
    [[ -d ~/.vim/spell ]] || { mkdir -p ~/.vim/spell; }
    doln ${_BASE_DIR}/vim/spell/en.utf-8.add ~/.vim/spell/en.utf-8.add

    # .tmux.conf
    if [[ -d ~/.byobu ]]; then
        doln ${_BASE_DIR}/.tmux.conf ~/.byobu/.tmux.conf
    else
        echoError "You may not install byobu at first";
    fi
    # .newsbeuter's config and url
    if [[ -d ~/.newsbeuter ]]; then
        doln ${_BASE_DIR}/newsbeuter/config ~/.newsbeuter/config
    else
        echoError "You may not install newsbeuter at first";
    fi
    # common-aliases.plugin.zsh
    if [[ -d ~/.oh-my-zsh ]]; then
        [[ -d ~/.oh-my-zsh/custom/plugins ]] || { mkdir -p ~/.oh-my-zsh/custom/plugins; }
        doln ${_BASE_DIR}/oh-my-zsh/custom/plugins/common-aliases.plugin.zsh ~/.oh-my-zsh/custom/plugins/common-aliases.plugin.zsh
    else
        echoError "You may not install oh-my-zsh at first";
    fi
    # SSH Key on KDE
    if [[ -d ~/.kde4 ]]; then
        doln ${_BASE_DIR}/ssh/autostart.sh ~/.kde4/Autostart/autostart.sh
        doln ${_BASE_DIR}/ssh/env-pre-autostart.sh ~/.kde4/env/env-pre-autostart.sh
        doln ${_BASE_DIR}/ssh/shutdown.sh ~/.kde4/shutdown/shutdown.sh
    else
        echoError "You are not using KDE"
    fi

    # pacman.conf
    [[ -h /etc/pacman.conf ]] || { echoError "No pacman.conf found in /etc. You'd better manually install it"; }

    echoHeader "Install dot files finished"
}

## Main
case $1 in
  '-c') check;;
  '-i') install;;
  *)           echo "$(basename $0): unknown option '$@'"; exit 1;;
esac
