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
set sw=4 ts=4 sts=4
set autoindent
set smartindent
set expandtab
set cindent
set smartcase

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

" Enable syntax highlighting.
syntax on
filetype plugin indent on

" Color Scheme
se t_Co=256
colorscheme despacio
hi Normal guibg=NONE ctermbg=NONE

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
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Tabs
map <c-t>l :tabnext<cr>
map <c-t>h :tabprevious<cr>
map <c-t>q :tabclose<cr>
map <c-t>n :call LaunchNewTabWithNetrw()<cr>

" Netrw
map <leader>nn :Explore<cr>
map <leader>nh :Hex<cr>
map <leader>nv :Vex<cr>

" CtrlP
map <c-b> :CtrlPBuffer<cr>

" AG
map <leader>g :Ag 

"""""""""""""""""""""""""""""""""""""""""""""
" FILETYPES
"""""""""""""""""""""""""""""""""""""""""""""

" Python
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self
au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako
au FileType python map <buffer> F :set foldmethod=indent<cr>
au FileType python set cindent
au FileType python set cinkeys-=0#
au FileType python set indentkeys-=0#
"
" Highlight docstrings as comments, not string.
syn region pythonDocstring  start=+^\s*[uU]\?[rR]\?"""+ end=+"""+ keepend excludenl contains=pythonEscape,@Spell,pythonDoctest,pythonDocTest2,pythonSpaceError
syn region pythonDocstring  start=+^\s*[uU]\?[rR]\?'''+ end=+'''+ keepend excludenl contains=pythonEscape,@Spell,pythonDoctest,pythonDocTest2,pythonSpaceError

hi def link pythonDocstring pythonComment

" Javascript
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent

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

Plug 'rking/ag.vim'                                                                       " Silver Searcher
Plug 'ctrlpvim/ctrlp.vim'                                                                 " CtrlP

Plug 'jiangmiao/auto-pairs'                                                               " Bracket Complete
Plug 'ntpeters/vim-better-whitespace'                                                     " Trailing whitespace highlight
Plug 'tpope/vim-commentary'

Plug 'sjl/gundo.vim'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable', 'on': 'YcmGenerateConfig'}
Plug 'Valloric/YouCompleteMe'

Plug 'sheerun/vim-polyglot'

call plug#end()

" Ctrlp
let g:ctrlp_working_path_mode = 0
let g:ctrlp_map = '<c-f>'
let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'

" Netrw
let g:netrw_liststyle = 3

" AG
let g:ag_working_path_mode="r"

" Cursor Shape
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

"""""""""""""""""""""""""""""""""""""""""""""
" FUNCTIONS
"""""""""""""""""""""""""""""""""""""""""""""

function! LaunchNewTabWithNetrw()
  :tabnew
  :Explore
endfunction

