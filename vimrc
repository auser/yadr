" Default configuration file for Vim
" Written by Aron Griffis <agriffis@gentoo.org>
" Modified by Ryan Phillips <rphillips@gentoo.org>
" Added Redhat's vimrc info by Seemant Kulleen <seemant@gentoo.org>
" The following are some sensible defaults for Vim for most users.
" We attempt to change as little as possible from Vim's defaults,
" deviating only where it makes sense
"runtime bundle/vim-pathogen/autoload/pathogen.vim
"source ~/.vim/bundle/vim-pathogen/autoload/pathogen.vim

"set spell
let mapleader=","
set tabstop=2 shiftwidth=2 softtabstop=2 autoindent nocompatible
set smarttab
set incsearch hlsearch expandtab modeline
set modelines=5
set noerrorbells visualbell nu showmatch
set history=1000
set undolevels=1000
set bs=2                " Allow backspacing over everything in insert mode
"set backup             " Keep a backup file
"set backupdir=~/.vim/backup
set nobackup
set noswapfile

set directory=~/.vim/swap
set viminfo='20,\"500   " read/write a .viminfo file -- limit regs to 500 lines
set ruler               " Show the cursor position all the time
set hidden
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

set wrap        " don't wrap lines
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set copyindent    " copy the previous indentation on
set number        " always show line numbers
set shiftround    " use multiple of shiftwidth when
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all
set smarttab      " insert tabs on the start of a line according to

set list          " highlight whitespace
set listchars=tab:>.,trail:.,extends:#,nbsp:.

:so $HOME/.vim/plugins/bundles.vim

if &diff
  colorscheme inkpot
endif

" Yank from current cursor position to end of line
map Y y$
" Yank content in OS's clipboard. `o` stands for "OS's Clipoard".
vnoremap <leader>yo "*y
" Paste content from OS's clipboard
nnoremap <leader>po "*p

" bracket match using tab
map <tab> %

" clear highlight after search
noremap <silent><Leader>/ :nohls<CR>

" better ESC
inoremap jk <Esc>

nmap <silent> <leader>hh :set invhlsearch<CR>
nmap <silent> <leader>ll :set invlist<CR>
nmap <silent> <leader>pp :set invpaste<CR>
nmap <silent> <leader>ii :set invrelativenumber<CR>

nmap ; :

" set foldmethod=syntax
" set foldlevelstart=2
filetype on           " Enable filetype detection
filetype plugin on    " Enable filetype-specific plugins
filetype indent on    " Enable filetype-specific indenting

let g:tex_flavor='tex'
let g:Tex_ViewRule_pdf = "/Applications/Preview.app/Contents/MacOS/Preview"

runtime! macros/matchit.vim
set grepprg=grep\ -nH\ $*
au! BufReadPost * silent loadview
autocmd FileType eruby let b:surround_5 = "<% \r %>\n<% end %>"
command Wq wq

" Delete trailing white space from certain files before saving
" Removes trailing spaces
function TrimWhiteSpace()
  %s/\s*$//
  ''
:endfunction

if has('autocmd')
  autocmd filetype python set expandtab
  autocmd filetype html,xml set listchars-=tab:>.
endif

" Fast saving
nmap <leader>w :w!<cr>
" Fast saving and closing current buffer without closing windows displaying the
" buffer
nmap <leader>wq :w!<cr>:Bclose<cr>

" Settings {{{
set autoread
set backspace=indent,eol,start
set binary
set cinoptions=:0,(s,u0,U1,g0,t0
set completeopt=menuone,preview
set encoding=utf-8
set hidden
set history=1000
set incsearch
set laststatus=2
set list

" Don't redraw while executing macros
set nolazyredraw

" Disable the macvim toolbar
set guioptions-=T

map <F3> :call TrimWhiteSpace()<CR>
map! <F3> :call TrimWhiteSpace()<CR>

" Omnicomplete rebinding
inoremap <C-space> <C-x><C-o>
"let g:dbext_default_MYSQL_version = '4'
"let g:dbext_default_type = 'MYSQL'
"let g:dbext_default_user = 'root'
"let g:dbext_default_passwd = 'carl38,fists'

" Don't use Ex mode, use Q for formatting
map Q gq
if &term=="xterm"
  set t_RV=          " don't check terminal version
  set t_Co=256
  set t_Sb=^[4%dm
  set t_Sf=^[3%dm
endif

set term=xterm-256color

if &term=="xterm-256color"
  set t_Co=256
  set t_Sb=^[4%dm
  set t_Sf=^[3%dm
endif

" Color
if &t_Co >= 256 "|| has("gui_running")
  colorscheme wombat
endif
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
endif

if has("gui_running")
  set transparency=10
  set gfn=Inconsolata:h12
  set anti
  set termencoding=utf-8
  set viminfo='20,\"500
  set window=31
  set nu
  set vb t_vb=
  set guioptions-=T " hide the toolbar
  map <F3> :maca openFileBrowser:<CR>
endif

:if $VIM_CRONTAB == "true"
:set nobackup
:set nowritebackup
:endif
" call pathogen#infect()

:so $HOME/.vim/plugins/vim.vim
:so $HOME/.vim/plugins/editing.vim
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1
