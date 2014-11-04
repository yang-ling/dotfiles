" An example for a vimrc file.
"
" Maintainer:   Bram Moolenaar <Bram@vim.org>
" Last change:  2011 Apr 15
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"         for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"       for OpenVMS:  sys$login:.vimrc

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
"
" Plugins installed by pacman:
" 1. vim-jad(A Java decompile tool)
" 2. powerline: AUR https://aur.archlinux.org/packages/python2-powerline-git/,
" NOTE: if install directly by clone github, no need install this AUR package
"   In this approach, I don't use powerline AUR package, instead, I clone
"   powerline repo and install powerline font package from AUR.
"   See Bundles setting's powerline part
" Update:2014-10-16
"   I use airline instead of powerline
"
" Plugin requirements
" 1. Bundle 'mbbill/fencview'
"     Need tellenc: https://github.com/adah1972/tellenc
"     git clone it and use g++ to compile it:
"     g++ -o tellenc tellenc.cpp
"     Then copy tellenc to /usr/bin/
" 2. Tagbar and easytags
"     Need install ctags
"
" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
    set nocompatible               " Be iMproved

    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

"neobundle"{{{
let g:neobundle#types#git#default_protocol = 'git'
"}}}
" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
"{{{ Bundles
" My Bundles here:
"
" original repos on github"{{{
" Shougo"{{{
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
            \     'windows' : 'tools\\update-dll-mingw',
            \     'cygwin' : 'make -f make_cygwin.mak',
            \     'mac' : 'make -f make_mac.mak',
            \     'unix' : 'make -f make_unix.mak',
            \    },
            \ }
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
" TODO Need learn vimfiler
NeoBundle 'Shougo/vimfiler.vim'
"NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/neossh.vim'
NeoBundle 'Shougo/unite-outline'
"NeoBundle 'Shougo/unite-sudo'
NeoBundle 'Shougo/context_filetype.vim'
NeoBundle 'Shougo/echodoc', '', 'default'
call neobundle#config('echodoc', {
      \ 'lazy' : 1,
      \ 'autoload' : {
      \ 'insert' : 1,
      \ }})
"}}}
NeoBundle 'vim-scripts/sudo.vim'
NeoBundle 'sgerrand/Conque-Shell', 'update_to_version_2.3'
NeoBundle 'c9s/perlomni.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Lokaltog/vim-easymotion'
"NeoBundle 'tpope/vim-rails.git'
NeoBundle 'maksimr/vim-jsbeautify'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'godlygeek/tabular'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'vim-scripts/camelcasemotion'
NeoBundle 'vim-scripts/fcitx.vim'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'vim-scripts/Mark--Karkat'
NeoBundle 'edsono/vim-matchit'
NeoBundle 'plasticboy/vim-markdown'
" Preview markdown
"NeoBundle 'suan/vim-instant-markdown'
NeoBundle 'timcharper/textile.vim'
NeoBundle 'juvenn/mustache.vim'
NeoBundle 'fsouza/cobol.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'jamessan/vim-gnupg'
NeoBundle 'vim-scripts/argtextobj.vim'
" Need tellenc: https://github.com/adah1972/tellenc
" git clone it and use g++ to compile it:
" g++ -o tellenc tellenc.cpp
" Then copy tellenc to /usr/bin/
NeoBundle 'mbbill/fencview'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-easytags'
NeoBundle 'xolox/vim-shell'
" This calendar provide calendar view and connect to google calendar
"NeoBundle 'itchyny/calendar.vim'
" This calendar can be used to write diary
NeoBundle 'mattn/calendar-vim'
" Theme"{{{
NeoBundle 'zeis/vim-kolor'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'flazz/vim-colorschemes'
"}}}
" Less
NeoBundle 'groenewege/vim-less'
" Snippets
NeoBundle 'mattn/emmet-vim'
" Powerline
"NeoBundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
NeoBundle 'bling/vim-airline'
" Made by me
NeoBundle 'yang-ling/vim-tmux-syntax'
NeoBundle 'yang-ling/rst'
" reStruected text
NeoBundleLazy 'Rykka/riv.vim'
NeoBundleLazy 'Rykka/clickable.vim'
NeoBundleLazy 'nvie/vim-rst-tables'
autocmd FileType rst NeoBundleSource riv.vim clickable.vim vim-rst-tables
"NeoBundle 'vim-scripts/VST'
" xml
NeoBundle 'othree/xml.vim'
" csv
NeoBundleLazy 'chrisbra/csv.vim'
autocmd FileType csv NeoBundleSource csv.vim
"}}}
" vim-scripts repos"{{{
NeoBundle 'L9'
NeoBundle 'FuzzyFinder'
NeoBundle 'DrawIt'
NeoBundle 'VimExplorer'
NeoBundle 'Auto-Pairs'
NeoBundle 'cecutil'
"NeoBundle 'xml.vim'
"}}}
" non github repos"{{{
"NeoBundle 'git://git.wincent.com/command-t.git'
"}}}
"}}}

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

"{{{ Bundules setting
"{{{ neocomplcache setting
""Disable AutoComplPop. Comment out this line if AutoComplPop is not installed.
""let g:acp_enableAtStartup = 0
"" Launches neocomplcache automatically on vim startup.
"let g:neocomplcache_enable_at_startup = 1
"" Use smartcase.
"let g:neocomplcache_enable_smart_case = 1
"" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
"" Use underscore completion.
"let g:neocomplcache_enable_underbar_completion = 1
"" Sets minimum char length of syntax keyword.
"let g:neocomplcache_min_syntax_length = 3
"" buffer file name pattern that locks neocomplcache. e.g. ku.vim or fuzzyfinder
"let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

"" Define file-type dependent dictionaries.
"let g:neocomplcache_dictionary_filetype_lists = {
            "\ 'default' : '',
            "\ 'vimshell' : $HOME.'/.vimshell_hist',
            "\ 'scheme' : $HOME.'/.gosh_completions'
            "\ }

"" Define keyword, for minor languages
"if !exists('g:neocomplcache_keyword_patterns')
    "let g:neocomplcache_keyword_patterns = {}
"endif
"let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

"" Plugin key-mappings.
"imap <C-k>     <Plug>(neocomplcache_snippets_expand)
"smap <C-k>     <Plug>(neocomplcache_snippets_expand)
"inoremap <expr><C-g>     neocomplcache#undo_completion()
"inoremap <expr><C-l> neocomplcache#complete_common_string()

"" SuperTab like snippets behavior.
""imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ?
""\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ?
""\<C-n>" : \"\<TAB>"

"" Recommended key-mappings.
"" <CR>: close popup and save indent.
""inoremap <expr><CR> neocomplcache#smart_close_popup()."\<CR>"
"" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"" <C-h>, <BS>: close popup and delete backword char.
""inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
""inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplcache#close_popup()
"inoremap <expr><C-e>  neocomplcache#cancel_popup()

"" AutoComplPop like behavior.
""let g:neocomplcache_enable_auto_select = 1

"" Shell like behavior(not recommended).
"set completeopt+=longest
""let g:neocomplcache_enable_auto_select = 1
""let g:neocomplcache_disable_auto_complete = 1
""inoremap <expr><TAB>  pumvisible() ? \"\<Down>" : \"\<TAB>"
""inoremap <expr><CR>  neocomplcache#smart_close_popup() .
""\<CR>"

"" Enable omni completion. Not required if they are already set elsewhere in .vimrc
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"" Enable heavy omni completion, which require computational power and may stall the vim.
"if !exists('g:neocomplcache_omni_patterns')
    "let g:neocomplcache_omni_patterns = {}
"endif
"let g:neocomplcache_omni_patterns.ruby = '[^.  *\t]\.\w*\|\h\w*::'
""autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
"let g:neocomplcache_omni_patterns.php = '[^.  \t]->\h\w*\|\h\w*::'
"let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
"let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
"}}}
" neocomplete setting"{{{
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"}}}
"{{{ neosnippet setting
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
"}}}
" VimExplorer Setting"{{{
let g:VEConf_usingKDE = 1
let g:VEConf_externalExplorer = "dolphin"
"}}}
"powerline"{{{
"Need clone powerline github repo
"https://github.com/Lokaltog/powerline
"Also needs powerline font on AUR
"https://aur.archlinux.org/packages/powerline-fonts-git/
"set rtp+=~/MyGitRepo/powerline/powerline/bindings/vim
"Because Powerline can be installed directly from AUR, so we needn't config
"vimrc any more.
"But AUR Powerline package doesn't work fine on Gvim, so I don't use AUR
"version, instead I use rtp version and along with AUR powerline font package
"}}}
" vim-airline"{{{
" Use powerline font
" Need install https://aur.archlinux.org/packages/powerline-fonts-git/
let g:airline_powerline_fonts = 1
" Smarter tab line
" Display buffers when there is only one tab
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
"}}}
" TagBar"{{{
cnoremap :t TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
"}}}
" EasyTag Setting"{{{
let g:easytags_async = 1
"}}}
" echodoc setting"{{{
set cmdheight=2
let g:echodoc_enable_at_startup = 1
"}}}
"reStructed text plugin"{{{
" Need clone git@github.com:Rykka/rhythm.css.git
cnoremap :rp :!rst2html2 --stylesheet-dirs="~/MyGitRepo/rhythm.css" --stylesheet-path="dist/css/rhythm.min.css,math/math.css,syntax/molokai.css" --syntax-highlight=short % > /tmp/rst.html && xdg-open /tmp/rst.html<CR>
cnoremap :r :!rst2html2 --stylesheet-dirs="~/MyGitRepo/rhythm.css" --stylesheet-path="dist/css/rhythm.min.css,math/math.css,syntax/molokai.css" --syntax-highlight=short % > /tmp/rst.html<CR>
"let g:riv_web_browser = "/usr/bin/google-chrome-stable"
"}}}
" csv"{{{
let b:csv_arrange_leftalign = 1
"let g:csv_nomap_cr = 1
"}}}
"}}}
"{{{ Basic setting
sy on

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"if has("vms")
  set nobackup      " do not keep a backup file, use versions instead
"else
  "set backup       " keep a backup file
"endif
set history=50      " keep 50 lines of command line history
set ruler       " show the cursor position all the time
set number              " show line number
set showcmd     " display incomplete commands
set incsearch       " do incremental searching
set ignorecase          " ignore case
set tabstop=4           " set tab width to 4 blanks
set shiftwidth=4        " set shift width to 4 blanks
set expandtab           " convert tab to blank
" set cursorline          " show cursor line
" set cursorcolumn        " show cursor column line
"
" color scheme
"colo torte             " set color
"colo kolor
"set background=dark
"colo solarized
colo wombat256mod

set spell               " spell check
"set cc=97              " set color column
set laststatus=2        " Enable statusline always

" Auto read when file changed
set autoread

" Set scroll off
set so=5
" Set wrap
set wrap

" Set no wrap search
set nowrapscan

" Set completion option.
set completeopt=longest,menu

" Set camel completion
"set completefunc=Camel_Complete

set wildmode=full
set wildmenu

hi SpecialKey term=bold ctermfg=8 guifg=Blue
hi NonText term=bold ctermfg=8 guifg=Blue

" File encoding
set fileencodings=utf8,ms932,cp932,iso-2022-jp,euc-jp,cp936,default,latin1

" Highlight trailing whitespace"{{{
highlight ExtraWhitespace ctermbg=darkred guibg=#382424
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
" the above flashes annoyingly while typing, be calmer in insert mode
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
"}}}

"let xml_no_html = 1
"let xml_no_mustache = 1

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")
"}}}
"{{{ Mapping
let mapleader=","
"{{{ Navigating mapping
" Don't use Ex mode, use Q for formatting
map Q gq
map j gj
map k gk
map ZZ zz
" use jj instead ESC at insert mode.
inoremap jj <ESC>
" jump to left window
nnoremap <C-h> <C-w>h
" jump to down window
nnoremap <C-j> <C-w>j
" jump to up window
nnoremap <C-k> <C-w>k
" jump to right window
nnoremap <C-l> <C-w>l
" close window
nnoremap <C-c> <C-w>c
" scroll down
nnoremap <SPACE> <C-F>
" scroll up
nnoremap <CR> <C-B>
nnoremap <leader><CR> <CR>
" jump to next tab
nnoremap <C-N> gt
" jump to previous tab
nnoremap <C-P> gT
" jump to first tab
nnoremap <leader>1 :tabr<CR>
" jump to last tab
nnoremap <leader>9 :tabl<CR>
"}}}
"{{{ ShortCut mapping
" Open VimExpore
nnoremap <leader>ve :VE<CR><CR>:tabo<CR>
" Open .vimrc file
nnoremap <F9> :tabe $MYVIMRC<CR>
" Delete trailing whitespaces
nnoremap <F2> :%s/\s\+$//g<CR>
" Delete excess blank lines.
nnoremap <leader><F2> :%s/^\n$//g<CR>
" Open file browser at current folder in new tab.
"nnoremap <F3> :tabe %:p:h<CR>
" Open file browser at current folder in current tab.
"nnoremap <leader><F3> :e %:p:h<CR>
" Toggle spell check
nnoremap <F4> :call ToggleSpellCheck()<CR>
" close window
nnoremap <Leader>q :clo<CR>
" open new tab
nnoremap <Leader>te :tabe<CR>
" no highlighting
cnoremap :n nohl<CR>
" Set file type to markdown.
nnoremap <Leader>md :set ft=markdown<CR>:set tabstop=2<CR>:set shiftwidth=2<CR>
" Set file type to mail.
nnoremap <Leader>ma :set ft=mail<CR>:set tabstop=2<CR>:set shiftwidth=2<CR>
nnoremap <Leader>tt :set ft=textile<CR>:set tabstop=2<CR>:set shiftwidth=2<CR>
" Only delete trailing whitespaces in selected lines
" Sometimes vim will automatically add '<,'> to command line when type F2, in
" this case, I only need write like: vnoremap <F2> :s/\s\+$//g<CR>
" But if I don't want my function depends on others, for instance, in case vim
" doesn't automatically add '<,'>, my function can still work, so I first
" remove '<,'> and add my own '<,'>
vnoremap <F2> :<BS><BS><BS><BS><BS>'<,'>s/\s\+$//g<CR>
" Add sequence number to selected lines.
vnoremap <Leader>se :<BS><BS><BS><BS><BS>let i=1\|'<,'>g/^/s//\=i/\|let i=i+1<CR>:nohl<CR>
"}}}
" Diff setting"{{{
" Ignore white space in diff
cnoremap :w set diffopt+=iwhite<CR>
" Only show one line in diff
cnoremap :o set diffopt+=context:1<CR>
"}}}
"{{{ Session
" Write Session
nnoremap <leader>ws :mks! ~/.yangsession/session.vim<CR>
" Source Session
nnoremap <leader>ss :source ~/.yangsession/session.vim<CR>
"}}}
" set color theme"{{{
nnoremap <leader>v :colo evening<CR>
nnoremap <leader>t :colo torte<CR>
"}}}
" set tab stop and shift width"{{{
nnoremap <leader>2 :set tabstop=2<CR>:set shiftwidth=2<CR>
nnoremap <leader>4 :set tabstop=4<CR>:set shiftwidth=4<CR>
nnoremap <Leader>ne :set noexpandtab<CR>
"}}}
" Set encoding"{{{
" Set file encoding to Chinese
cnoremap :cn e ++enc=cp936<CR>
" Set file encoding to Japanese
cnoremap :jp e ++enc=shift_jis<CR>
"}}}
" set fold method to indent"{{{
nnoremap <leader>fd :set fdm=indent<CR>
"}}}
"{{{ FuzzyFinder
nnoremap <leader>ff :FufFile<CR>
nnoremap <leader>fb :FufBuffer<CR>
"}}}
" Tabularize"{{{
nnoremap <leader><space> :Tabularize /:<CR>
"}}}
"{{{ Window resize
" Maximize window
nnoremap <leader>a <C-W>_<C-W>\|
" Restore window
nnoremap <leader>rr <C-W>=
"}}}
" Enclose selected text with brackets"{{{
" NOTE: only support normal select,
" not support line selected and others.
vnoremap <leader>{ <ESC>a <ESC>gvdi{}<ESC>Pllx
vnoremap <leader>[ <ESC>a <ESC>gvdi[]<ESC>Pllx
vnoremap <leader>( <ESC>a <ESC>gvdi()<ESC>Pllx
vnoremap <leader>< <ESC>a <ESC>gvdi<><ESC>Pllx
vnoremap <leader>" <ESC>a <ESC>gvdi""<ESC>Pllx
vnoremap <leader>' <ESC>a <ESC>gvdi''<ESC>Pllx
vnoremap <leader>` <ESC>a <ESC>gvdi``<ESC>Pllx
"}}}
" Remove enclosed tags.  "{{{
" Parent tags are in their own lines
vnoremap <Leader>dt dpkddkdd
" Parent tags are inline
vnoremap <Leader>dit dvatp
"}}}
" CommandT"{{{
nnoremap <Leader>ct :CommandT<CR>
nnoremap <Leader>cd :CommandTBuffer<CR>
nnoremap <Leader>cf :CommandTFlush<CR>
"}}}
" NerdTree mapping"{{{
nnoremap <F3> :NERDTreeToggle<CR>
"}}}
" Caching buffer."{{{
nnoremap <Leader>re :NeoCompleteBufferMakeCache<CR>
"}}}
" Copy file name"{{{
if has('win32')
    " Short File name
    nnoremap <Leader>sf :let @*=substitute(expand("%:p:t"), "/", "\\", "g")<CR>
    " Long File name
    nnoremap <Leader>lf :let @*=substitute(expand("%:p"), "/", "\\", "g")<CR>
else
    " Short File name
    nnoremap <Leader>sf :let @+=expand("%:p:t")<CR>
    " Long File name
    nnoremap <Leader>lf :let @+=expand("%:p")<CR>
endif
"}}}
" Reverse search"{{{
nnoremap <leader>rv /^\(\(<C-R>/\)\@!.\)*$<CR>
"}}}
" Date and Time"{{{
cnoremap :date r !date<CR>
cnoremap :time r !date +\%T<CR>
"}}}
" GitHub Flavored Markdown Parser Preview"{{{
" Use ghmd as command line parser tool
"cnoremap :mdp !ghmd % > /tmp/tmp.html && xdg-open /tmp/tmp.html<CR>
cnoremap :mdp !ghmd -r %<CR>
"}}}
" Preview html, xml"{{{
cnoremap :xo !xdg-open %<CR>
"}}}
"google closure"{{{
cnoremap :fj !fixjsstyle --strict %<CR>
cnoremap :fc !fixclosure %<CR>
cnoremap :ff !fixclosure -f %<CR>
cnoremap :mk !closure --js % --js_output_file /tmp/closure_tmp.js -W VERBOSE<CR>
"}}}
"}}}
" Macro"{{{
" Macro z: Copy DB column field description to Java SQL part.
" DB tab must be left of Java tab
let @z='veygg/\<"\>nvi''yA   // 1 " TYPE: jjggnf"wv$hypj0f.l'
let @y='diBcDate.valueOf(BcDate.toSqlDate(jjp'
"}}}
"Temp shortcut"{{{
" search debug display
nnoremap <Leader>dis /d\s\+display<CR>
" Replace display with logger
cnoremap :logs %s/.*d\s\+display\s\+\(.*\)/logger.Debug(\1);/gc<CR>
cnoremap :log2 %s/.*d\s\+display\s\+\(".*"\)\(.*\)/logger.Debug(\1,\2);/gc<CR>
cnoremap :log3 %s/.*d.*display.*\(".*"\)\(.*\)\(".*"\)/logger.Debug(\1,\2,\3);/gc<CR>
cnoremap :diss .,$s/\s\+\<display\>\s\+\(.*\)/logger.Info(\1);/gc<CR>
cnoremap :dis2 .,$s/\s\+\<display\>\s\+\(".*"\)\(.*\)/logger.Info(\1,\2);/gc<CR>
" Clean
cnoremap :cle :call ClearTemp()<CR>
" Lower first word
cnoremap :low .,$s/\(\s\+\)\(\u\+\)-/\1\L\2-/gc<CR>
" Capitalize last word
cnoremap :last .,$s/\(\s\+\w\+\)\(-\zs\(\u\)\(\u\+\)\ze\)\+/\u\3\L\4/gc
" Remove -
cnoremap :cls %s/\(,\s\+\w\+\)\(\zs-\(\w\+\)\ze\)\+/\3/gc
" Seq
cnoremap :seq let i=1\|.,$g/\/\/\s\+\zs\d\+\ze/s/\/\/\s\+\zs\d\+\ze/\=i/\|let i=i+1
"}}}
"{{{ Win and Linux Setting
if has("win32")
    "let g:neosnippet#snippets_directory='D:\Work\GitHub\snipmate-snippets\snippets'
    source C:\win_setting.vim
else
    "let g:neosnippet#snippets_directory='~/MyGitRepo/Snippets/MyFork/snippets,~/Documents/MySnip'
    source ~/linux_setting.vim
    " show the tab and eol character and set their color
    set list
    set listchars=eol:⇐,tab:⇒⋅ " use special character on eol and tab character
endif
"}}}

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

if !has('gui_running')
  set t_Co=256
endif

"{{{ GUI Setting
if has("gui_running")
    set guifont=DejaVu\ Sans\ Mono\ 11
    set guifontwide=WenQuanYi\ Micro\ Hei\ Mono\ 12
    set go=
    "colo evening
endif
"}}}

"{{{ AutoCmd
" Only do this part when compiled with support for autocommands.
if has("autocmd")

    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
        au!

        " For all text files set 'textwidth' to 78 characters.
        autocmd FileType text setlocal textwidth=78
        autocmd FileType javascript setlocal textwidth=97

        autocmd FileType javascript noremap <buffer> <leader>fm :call JsBeautify()<CR>
        " for html
        autocmd FileType html,jsp,xml noremap <buffer> <leader>fm :call HtmlBeautify()<CR>
        " for css or scss
        autocmd FileType css noremap <buffer> <leader>fm :call CSSBeautify()<CR>

        " Set fold method to marker when open vimrc file
        autocmd FileType vim set fdm=marker | set nospell

        " Set FileType"{{{
        " for cobol
        autocmd BufNewFile,BufRead *.ccb set filetype=cobol
        " for csv
        autocmd BufNewFile,BufRead *.csv set filetype=csv

        " for markdown
        au FileType markdown call MyAddToFileType('mkd')
        au FileType mkd      call MyAddToFileType('markdown')
        "}}}

        "{{{ jslint
        "autocmd FileType javascript setlocal makeprg=jslint\ --sloppy\ --indent\ 4\ --nomen\ --devel\ --browser\ --node\ --plusplus\ --stupid\ %
        "autocmd FileType javascript set efm=%-P%f,
                            "\%A%>%.%##%*\\d\ %m,%Z%.%#Line\ %l\\,\ Pos\ %c,
                            "\%-G%f\ is\ OK.,%-Q
        "}}}
        "{{{ google closure linter
        "https://github.com/batsuev/google-closure-linter-for-vim/blob/master/ftplugin/javascript.vim
        autocmd FileType javascript setlocal makeprg=gjslint\ --strict\ --jslint_error\ all\ --max_line_length\ 120\ %
        autocmd FileType javascript set efm=%-P%>-----\ FILE\ \ :\ \ %f\ -----,Line\ %l\\,\ %t:%n:\ %m,%-Q
        "}}}

        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid or when inside an event handler
        " (happens when dropping a file on gvim).
        " Also don't do it when the mark is in the first line, that is the default
        " position when opening a file.
        autocmd BufReadPost *
                    \ if line("'\"") > 1 && line("'\"") <= line("$") |
                    \   exe "normal! g`\"" |
                    \ endif

        "  au InsertEnter * silent execute \"!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
        "  au InsertLeave * silent execute \"!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
        "  au VimLeave * silent execute \"!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"

        "  autocmd FileType xml setlocal tabstop=2 | setlocal shiftwidth=2 | colo torte
        "  autocmd FileType jsp setlocal tabstop=2 | setlocal shiftwidth=2 | colo evening
        "  autocmd FileType javascript setlocal tabstop=4 | setlocal shiftwidth=4 | colo evening

        " remove white space before saving.
        "autocmd BufWritePre *.rb :%s/\s\+$//e
        "autocmd BufWritePre *.cpp :%s/\s\+$//e

    augroup END

else

    set autoindent        " always set autoindenting on

endif " has("autocmd")"}}}

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif

"{{{ Functions
"Use :set spell! can do same job
function! ToggleSpellCheck()
    if &spell
        :set nospell
        echo "spell check off"
    else
        :set spell
        echo "spell check on"
    endif
endfunction

function! ClearTemp()
    :%s/\.)/)/g
    :%s/,)/)/g
    :%s/;.$/;/g
endfunction
" Copyied from  https://github.com/plasticboy/vim-markdown/issues/64#issuecomment-33560271
function! MyAddToFileType(ft)
  if index(split(&ft, '\.'), a:ft) == -1
    let &ft .= '.'.a:ft
  endif
endfunction

"{{{ Not work
function! Camel_Initials(camel)
    let first_char = matchstr(a:camel,"^.")
    let other_char = substitute(a:camel,"\\U","","g")
    return first_char . other_char
endfunction

function! Expand_Camel_Initials(abbrev)
    let winview=winsaveview()
    let candidate=a:abbrev
    let matches=[]
    try
        let resline = line(".")
        while resline >= 1
            let sstr = '\<' . matchstr(a:abbrev,"^.") . '[a-zA-Z]*\>'
            keepjumps let resline=search(sstr,"bW")
            let candidate=expand("<cword>")
            if candidate != a:abbrev && Camel_Initials(candidate) == a:abbrev
                call add( matches, candidate )
            endif
        endwhile
    finally
        call winrestview(winview)
        if len(matches) == 0
            echo "No expansion found"
        endif
        return sort(candidate)
    endtry
endfunction

function! Camel_Complete( findstart, base )
    if a:findstart
        let line = getline('.')
        let start = col('.') - 1
        while start > 0 && line[start - 1] =~ '[A-Za-z_]'
            let start -= 1
        endwhile
        return start
    else
        return Expand_Camel_Initials( a:base )
    endif
endfunction
"}}}
"}}}
