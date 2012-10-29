" ================ Vundle Config ========================
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" General
Bundle "mileszs/ack.vim"
nnoremap <leader>a :Ack!<space>

Bundle 'matthias-guenther/hammer.vim'
nmap <leader>p :Hammer<cr>

Bundle 'tsaleh/vim-align'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'scrooloose/nerdtree'
nmap <C-u> :NERDTreeToggle<CR>
" Disable the scrollbars (NERDTree)
set guioptions-=r
set guioptions-=L

Bundle 'kana/vim-textobj-user'
Bundle 'vim-scripts/YankRing.vim'
let g:yankring_replace_n_pkey = '<leader>['
let g:yankring_replace_n_nkey = '<leader>]'
let g:yankring_history_dir = '~/.vim/swap'
nmap <leader>y :YRShow<cr>

Bundle 'michaeljsmith/vim-indent-object'
let g:indentobject_meaningful_indentation = ["haml", "sass", "python", "yaml", "markdown"]

Bundle 'Spaceghost/vim-matchit'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/scratch.vim'

Bundle 'vim-scripts/bufexplorer.zip'

" status bar
Bundle 'Lokaltog/vim-powerline'

" navigation
Bundle 'LustyJuggler'
Bundle 'BufOnly.vim'
Bundle 'kien/ctrlp.vim'

" snipmate
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/snipmate-snippets"
Bundle "garbas/vim-snipmate"

" OS
Bundle 'zaiste/tmux.vim'
Bundle 'benmills/vimux'
map <Leader>rp :PromptVimTmuxCommand<CR>
map <Leader>rl :RunLastVimTmuxCommand<CR>

vmap <LocalLeader>rs "vy :call RunVimTmuxCommand(@v . "\n", 0)<CR>
nmap <LocalLeader>rs vip<LocalLeader>rs<CR>

" Coding
Bundle 'majutsushi/tagbar'
nmap <leader>t :TagbarToggle<CR>

Bundle 'gregsexton/gitv'

Bundle 'scrooloose/nerdcommenter'
nmap <leader># :call NERDComment(0, "invert")<cr>
vmap <leader># :call NERDComment(0, "invert")<cr>

" Trinity coding
Bundle 'wesleyche/trinity'

" - Bundle 'msanders/snipmate.vim'
Bundle 'sjl/splice.vim'

Bundle 'tpope/vim-fugitive'
nmap <leader>g :Ggrep
" ,f for global git serach for word under the cursor (with highlight)
nmap <leader>f :let @/="\\<<C-R><C-W>\\>"<CR>:set hls<CR>:silent Ggrep -w "<C-R><C-W>"<CR>:ccl<CR>:cw<CR><CR>
" same in visual mode
:vmap <leader>f y:let @/=escape(@", '\\[]$^*.')<CR>:set hls<CR>:silent Ggrep -F "<C-R>=escape(@", '\\"#')<CR>"<CR>:ccl<CR>:cw<CR><CR>

Bundle 'scrooloose/syntastic'
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

" --

autocmd FileType gitcommit set tw=68 spell

" Ruby
    Bundle 'vim-ruby/vim-ruby'
    Bundle 'tpope/vim-rails'
    Bundle 'nelstrom/vim-textobj-rubyblock'
    Bundle 'ecomba/vim-ruby-refactoring'

    autocmd FileType ruby,eruby,yaml set tw=80 ai sw=2 sts=2 et
    autocmd User Rails set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
		
" HTML
    Bundle 'tpope/vim-haml'
    Bundle 'juvenn/mustache.vim'
    Bundle 'tpope/vim-markdown'
    Bundle 'digitaltoad/vim-jade'
    Bundle 'bbommarito/vim-slim'
		Bundle 'groenewege/vim-less'

    au BufNewFile,BufReadPost *.jade setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
    au BufNewFile,BufReadPost *.html setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
    au BufNewFile,BufReadPost *.slim setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" Stylus
		Bundle 'wavded/vim-stylus'

" JS
    Bundle 'kchmck/vim-coffee-script'
    au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab

    Bundle 'alfredodeza/jacinto.vim'
    au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
    au BufNewFile,BufReadPost *.coffee setl tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" Clojure
    Bundle 'zaiste/VimClojure'

    let vimclojure#HighlightBuiltins=1
    let vimclojure#ParenRainbow=0

" Colors
    Bundle 'sjl/badwolf'
    Bundle 'altercation/vim-colors-solarized'
    Bundle 'tomasr/molokai'
    Bundle 'zaiste/Atom'
    Bundle 'w0ng/vim-hybrid'
    Bundle 'cschlueter/vim-wombat'
    Bundle 'CSApprox'
