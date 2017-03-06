"""""""""""""""""""""""""""""""""""""""""""""
" .vimrc of:
"   Osman Mesut Ozcan <osmanmesutozcan@gmail.com>
"
"""""""""""""""""""""""""""""""""""""""""""""

" This is added by the install script.
set runtimepath+=~/.dotfiles/vim

"""""""""""""""""""""""""""""""""""""""""""""
" GENERAL
"""""""""""""""""""""""""""""""""""""""""""""

" Language
set encoding=utf8

" Set history to remember.
set history=1000

" Autoload when file changes.
set autoread

" Backspace behavior fix.
set backspace=2

" Remove mode line
set noshowmode

" Indentation.
set sw=2 ts=2 sts=2
set autoindent
set smartindent
set expandtab
set cindent
set smartcase

" Line number
set number

" Link break
set lbr
set tw=120

" Backups and undo
set nobackup
set nowb
set noswapfile
set undodir=~/.dotfiles/vim/temp/undodir
set undofile

" Map leader key.
let mapleader=","
let g:mapleader=","

" Show current line.
set ruler

" Height of the command bar.
set cmdheight=2

" Search optimization.
set hlsearch
set incsearch
set ignorecase

" Seperator
set fillchars=""

" Color Scheme
se t_Co=256
colorscheme sidonia

try
  set termguicolors
catch
endtry

" Enable syntax highlighting.
syntax on
filetype plugin indent on

" Status bar
set laststatus=2                             " always show statusbar

" Fix humans.
:command WQ wq
:command Wq wq
:command W w
:command Q q

"""""""""""""""""""""""""""""""""""""""""""""
" KEYBINDINGS
"""""""""""""""""""""""""""""""""""""""""""""


" Search
map <space> /

" Buffer
map <leader>bd :bd<cr>:tabclose<cr>gT
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>


"""""""""""""""""""""""""""""""""""""""""""""
" FILETYPES
"""""""""""""""""""""""""""""""""""""""""""""

" Python
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self
au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako
au FileType python map <buffer> F :set foldmethod=indent<cr>
au FileType python inoremap <buffer> $r return
au FileType python inoremap <buffer> $i import
au FileType python inoremap <buffer> $p print
au FileType python inoremap <buffer> $f #--- <esc>a
au FileType python map <buffer> <leader>1 /class
au FileType python map <buffer> <leader>2 /def
au FileType python map <buffer> <leader>C ?class
au FileType python map <buffer> <leader>D ?def
au FileType python set cindent
au FileType python set cinkeys-=0#
au FileType python set indentkeys-=0#

" Javascript
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent
au FileType javascript imap <c-t> $log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi
au FileType javascript inoremap <buffer> $r return
au FileType javascript inoremap <buffer> $i import
au FileType javascript inoremap <buffer> $f //--- PH<esc>FP2xi

function! JavaScriptFold()
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction


"""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""


" Vim-plug
call plug#begin('~/.dotfiles/vim/plugged')

Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }                  " Nerdtree
Plug 'ctrlpvim/ctrlp.vim'                                                                 " CtrlP
Plug 'jiangmiao/auto-pairs'                                                               " Bracket Complete
Plug 'ntpeters/vim-better-whitespace'                                                     " Trailing whitespace highlight
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

Plug 'sheerun/vim-polyglot'

call plug#end()

" Ctrlp
let g:ctrlp_working_path_mode = 0
let g:ctrlp_map = '<c-f>'
map <leader>j :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>
let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'

" Nerdtree
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '/node_modules']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>
