# Advanced Aliases.
# Use with caution
#

alias ll='ls -lh'      #long list
alias gdt='git difftool'
alias gsu='git submodule sync --recursive && git submodule update --init --recursive --remote'
# gsu has been taken, so change General Screenshot Utility to Common Screenshot Utility
alias csu='/usr/bin/gsu'

# zsh is able to auto-do some kungfoo
# depends on the SUFFIX :)
if [ ${ZSH_VERSION//\./} -ge 420 ]; then
  # open browser on urls
  _browser_fts=(htm html de org net com at cx nl se dk dk php)
  for ft in $_browser_fts ; do alias -s $ft=google-chrome-stable ; done

  _editor_fts=(cpp cxx cc c hh h inl asc txt TXT tex)
  for ft in $_editor_fts ; do alias -s $ft=gvim ; done

  _image_fts=(jpg jpeg png gif mng tiff tif xpm)
  for ft in $_image_fts ; do alias -s $ft=gwenview; done

  _media_fts=(ape avi flv mkv mov mp3 mpeg mpg ogg ogm rm wav webm)
  for ft in $_media_fts ; do alias -s $ft=smplayer ; done

  #read documents
  alias -s pdf=okular

  #list whats inside packed file
  alias -s tar="tar -tvf"
  alias -s tar.gz="tar -tvf "
fi
