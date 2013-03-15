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
set nocompatible
filetype off  " required by Vundle

set rtp+=~/.vim/bundle/vundle/  " required by Vundle
call vundle#rc()                " required by Vundle

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
"{{{ Bundles
" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'godlygeek/tabular'
"Bundle 'SirVer/ultisnips'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/camelcasemotion'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
Bundle 'digitaltoad/vim-jade'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'DrawIt'
Bundle 'VimExplorer'
Bundle 'Auto-Pairs'
Bundle 'cecutil'
Bundle 'xml.vim'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'
"}}}

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

"{{{ Bundules setting
"{{{ neocomplcache setting
"Disable AutoComplPop. Comment out this line if AutoComplPop is not installed.
"let g:acp_enableAtStartup = 0
" Launches neocomplcache automatically on vim startup.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underscore completion.
let g:neocomplcache_enable_underbar_completion = 1
" Sets minimum char length of syntax keyword.
let g:neocomplcache_min_syntax_length = 3
" buffer file name pattern that locks neocomplcache. e.g. ku.vim or fuzzyfinder
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define file-type dependent dictionaries.
let g:neocomplcache_dictionary_filetype_lists = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

" Define keyword, for minor languages
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ?
"\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ?
"\<C-n>" : \"\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
"inoremap <expr><CR> neocomplcache#smart_close_popup()."\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? \"\<Down>" : \"\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() .
"\<CR>"

" Enable omni completion. Not required if they are already set elsewhere in .vimrc
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion, which require computational power and may stall the vim.
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^.  *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^.  \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
"}}}
"{{{ neosnippet setting
" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=i
endif

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/MyGitRepo/Snippets/MyFork/snippets,~/Documents/MySnip,'
"}}}
"{{{ sparkup setting
"
let g:sparkupNextMapping = "<c-m>"
"}}}
"}}}
"call pathogen#infect()
"{{{ Basic setting
sy on

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

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
colo torte             " set color
set spell               " spell check
"set cc=97              " set color column

" Auto read when file changed
set autoread

" Set scroll off
set so=5

" Set completion option.
set completeopt=longest,menu

" Set camel completion
set completefunc=Camel_Complete

" show the tab and eol character and set their color
set list
set listchars=eol:⇐,tab:⇒⋅ " use special character on eol and tab character
hi SpecialKey term=bold ctermfg=8 guifg=Blue 
hi NonText term=bold ctermfg=8 guifg=Blue

"let xml_no_html = 1
"let xml_no_mustache = 1

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")"}}}
"{{{ Mapping
let mapleader=","
"{{{ Navigating mapping
" Don't use Ex mode, use Q for formatting
map Q gq
map j gj
map k gk
map ZZ zz
" use Ctrl-L instead ESC at insert mode.
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
nnoremap <leader>9 :tabl<CR>"}}}
"{{{ ShortCut mapping
" Copy path of current file
nnoremap <leader>cp ggO<ESC>"%p0"*y$:q!<CR>
" Open file with path.
nnoremap <leader>pp :tabe <C-R>*<CR>
" Open VimExpore
nnoremap <leader>ve :VE<CR><CR>:tabo<CR>
" Open .vimrc file
nnoremap <F9> :tabe $MYVIMRC<CR>
" Delete tailing spaces and
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
" Ignore white space in diff
cnoremap :w set diffopt+=iwhite
" Only show one line in diff
cnoremap :o set diffopt+=context:1
" no highlighting
cnoremap :n nohl
" Add sequence number to selected lines.
vnoremap <Leader>se :<C-H><C-H><C-H><C-H><C-H>let i=1\|'<,'>g/^/s//\=i/\|let i=i+1<CR>:nohl<CR>
"}}}
"{{{ Session
" Write Session
nnoremap <leader>ws :mks! ~/.yangsession/
" Source Session
nnoremap <leader>ss :source ~/.yangsession/"}}}

" set color theme"{{{
nnoremap <leader>v :colo evening<CR>
nnoremap <leader>t :colo torte<CR>"}}}

" set tab stop and shift width"{{{
nnoremap <leader>2 :set tabstop=2<CR>:set shiftwidth=2<CR>
nnoremap <leader>4 :set tabstop=4<CR>:set shiftwidth=4<CR>"}}}

" set fold method to indent
nnoremap <leader>fd :set fdm=indent<CR>

"{{{ FuzzyFinder
nnoremap <leader>ff :FufFile<CR>
nnoremap <leader>fb :FufBuffer<CR>
"}}}

nnoremap <leader><space> :Tabularize /:<CR>

"{{{ Window resize
" Maximize window
nnoremap <leader>a <C-W>_<C-W>\|
" Restore window
nnoremap <leader>rr <C-W>=
"}}}

" Enclose selected text with brackets"{{{
" NOTE: only support normal select,
" not support line selected and others.
vnoremap <leader>{ di{}<ESC>P
vnoremap <leader>[ di[]<ESC>P
vnoremap <leader>( di()<ESC>P
vnoremap <leader>< di<><ESC>P
vnoremap <leader>" di""<ESC>P
vnoremap <leader>' di''<ESC>P
vnoremap <leader>` di``<ESC>P"}}}

" NerdTree mapping
nnoremap <F3> :NERDTreeToggle<CR>

" Caching buffer.
nnoremap <Leader>re :NeoComplCacheCachingBuffer<CR>
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

"{{{ GUI Setting
if has("gui_running")
    set guifont=WenQuanYi\ Micro\ Hei\ Mono\ 12
    colo evening
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

        "{{{ jslint
        autocmd FileType javascript setlocal makeprg=jslint\ --sloppy\ --indent\ 4\ --nomen\ --devel\ --browser\ --node\ --plusplus\ --stupid\ %
        autocmd FileType javascript set efm=%-P%f,
                            \%A%>%.%##%*\\d\ %m,%Z%.%#Line\ %l\\,\ Pos\ %c,
                            \%-G%f\ is\ OK.,%-Q
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
function ToggleSpellCheck()
    if &spell
        :set nospell
        echo "spell check off"
    else
        :set spell
        echo "spell check on"
    endif
endfunction

"{{{ Not work
function! Camel_Initials(camel)
    let first_char = matchstr(a:camel,"^.")
    let other_char = substitute(a:camel,"\\U","","g")
    return first_char . other_char
endfunction

function Expand_Camel_Initials(abbrev)
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

function Camel_Complete( findstart, base )
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
