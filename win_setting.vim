" This file contains Windows setting.
" Please copy it to C:\ and modify it
" This is just a template, because Path in each PC may be differeent.

" Tell Neosnippet about the other snippets
    let g:neosnippet#snippets_directory='C:\Yang\GitHub\snipmate-snippets\snippets'
" Mail Signature{{{
" The sign.txt file must employ a signature separator like the following: '--
" '.
" See http://vim.wikia.com/wiki/Insert_mail_signatures_from_a_rotating_file
"nnoremap <Leader>ms :e ~/Documents/signature/sign.txt<CR>ggV/^--  $<CR>k"*xG$a<C-R><C-O>*<Esc>:w<CR>:bd<CR>G$a<C-M><Esc>"*P
nnoremap <Leader>ms mQG:r ~/Dropbox/Documents/signature/sign.txt<CR>`Q
"}}}
" Weekly Report Template"{{{
nnoremap <Leader>wr gg:r ~/Dropbox/Documents/signature/weekly_report.txt<CR>G:r ~/Dropbox/Documents/signature/sign.txt<CR>ggdd
"}}}
" Monthly Report Template"{{{
nnoremap <Leader>wr gg:r ~/Dropbox/Documents/signature/monthly_report.txt<CR>G:r ~/Dropbox/Documents/signature/sign.txt<CR>ggdd
"}}}
