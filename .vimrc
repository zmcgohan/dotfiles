" Vundle {{{
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
nnoremap <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'mkitt/tabline.vim'
" Plugin 'scrooloose/syntastic'
Plugin 'keith/swift.vim'
Plugin 'isRuslan/vim-es6'
Plugin 'Solarized'
Plugin 'mattn/emmet-vim'

call vundle#end()            " required
filetype plugin indent on    " required
" }}}

" Editor settings {{{
syntax enable
set cmdheight=2
set foldlevelstart=0
set incsearch
set number
set history=1000
set wildignore=*.swp,*.pyc,*.class
set nobackup
set noswapfile
set noerrorbells visualbell t_vb=
set tabstop=2 softtabstop=0 noexpandtab shiftwidth=2
" }}}

" Visual settings {{{
set background=dark
colorscheme solarized
" Set coloring of tabs
hi TabLineFill ctermbg=Grey ctermfg=Grey
hi TabLineSel ctermbg=Black ctermfg=White 
hi TabLine ctermbg=Grey ctermfg=Black cterm=NONE
" Set coloring of status line
hi StatusLine ctermbg=Black ctermfg=188
hi StatusLineNC ctermbg=Black ctermfg=Grey
" Set coloring of window border
hi VertSplit ctermbg=Black ctermfg=188
" }}}

" Leader settings & commands {{{
let mapleader=","
nnoremap - ,
let maplocalleader="\\"
nnoremap <Leader>s :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>tn :tabnew<CR>
nnoremap <Leader>tc :tabclose<CR>
nnoremap <Leader>rv :source $MYVIMRC<CR>
nnoremap <Leader>ev :tabnew $MYVIMRC<CR>
nnoremap <Leader>vs :vsplit<CR>
nnoremap <Leader>hs :split<CR>
nnoremap <Leader>h :cd %:p:h<CR>
" }}}

" Window movements {{{
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
" }}}

" Remap escape {{{
inoremap jk <Esc>
inoremap <Esc> <Nop>
" }}}

" python commands {{{
autocmd filetype python map <leader>c :w<cr>:! clear && python %:p<cr>
" }}}
" javascript settings {{{
autocmd filetype javascript map <leader>c :! clear && node %:p<cr>
" }}}
" c settings {{{
autocmd filetype c map <leader>c :! clear && gcc %:p -Wall -lcurses -pthread && ./a.out<cr>
" }}}
" swift settings {{{
autocmd filetype swift map <leader>c :w<cr>:! clear && swift %:p<cr>
" }}}
" cpp settings {{{
autocmd filetype cpp map <leader>c :! clear && g++ %:p && ./a.out<cr>
" }}}
" r settings {{{
autocmd filetype r map <leader>c :! clear && rscript %:p<cr>
" }}}

" vimscript file settings {{{
augroup filetype_vim
	autocmd!
	autocmd filetype vim setlocal foldmethod=marker
augroup end
" }}}
