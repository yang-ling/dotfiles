" This file contains Linux setting.
" Please copy it to HOME and modify it
" This is just a template, because Path in each PC may be differeent.

" Tell Neosnippet about the other snippets
    let g:neosnippet#snippets_directory='~/MyGitRepo/Snippets/MyFork/snippets,~/Documents/MySnip'
" Mail Signature{{{
" The sign.txt file must employ a signature separator like the following: '--
" '.
" See http://vim.wikia.com/wiki/Insert_mail_signatures_from_a_rotating_file
"nnoremap <Leader>ms :e ~/Documents/signature/sign.txt<CR>ggV/^--  $<CR>k"*xG$a<C-R><C-O>*<Esc>:w<CR>:bd<CR>G$a<C-M><Esc>"*P
nnoremap <Leader>ms mQG:r ~/Dropbox/Documents/signature/sign.txt<CR>`Q
"}}}
" Weekly Report Template"{{{
nnoremap <Leader>wr :%d<CR>:r ~/Dropbox/Documents/signature/weekly_report.txt<CR>G:r ~/Dropbox/Documents/signature/sign.txt<CR>ggdd
"}}}
