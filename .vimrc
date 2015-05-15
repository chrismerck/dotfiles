
execute pathogen#infect()

" use gmake on FreeBSD
" set makeprg=gmake

" find tag file in some parent dir (for FreeBSD)
set tags=./tags;

" support backspace on FreeBSD
set backspace=indent,eol,start

" use X clipboard
set clipboard=unnamedplus

set scroll=1
set nocompatible
set autoindent
set nosmartindent
set tabstop=2
set shiftwidth=2
set expandtab
set showmatch
"set vb t_vb=
set ruler
set nohls
set incsearch
"set virtualedit=all

" line numbering
set nu

highlight clear SignColumn
syntax enable

autocmd BufRead *.py set nosmartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

filetype indent on

autocmd FileType make setlocal noexpandtab

hi comment ctermfg=blue

" indent after :
"im :<CR> :<CR><TAB>

" AUTOMATICALLY RESTORE CURSOR POSITION
" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo
function! ResCur()
if line("'\"") <= line("$")
normal! g`"
return 1
endif
endfunction
augroup resCur
autocmd!
autocmd BufWinEnter * call ResCur()
augroup END

" auto format C-style (/**/) comments
set formatoptions+=r
" but disable for C++ (//) style comments
au FileType c,cpp setlocal comments-=:// comments+=f://

" markdown files use *.md extension
au BufRead,BufNewFile *.md set filetype=markdown

" jinja2 files use *.jinja ext
au BufRead,BufNewFile *.jinja set filetype=jinja

" more subtle spelling suggestions
set spell
hi clear SpellBad
hi SpellBad cterm=underline,bold
