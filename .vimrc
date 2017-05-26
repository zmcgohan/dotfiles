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
" Allow single clicks to open files
let g:NERDTreeMouseMode = 3
let NERDTreeIgnore = ['\.pyc$']
Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'mkitt/tabline.vim'
" Syntastic
Plugin 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = { 'regex': 'fatal error: mpi.h' }
Plugin 'keith/swift.vim'
Plugin 'isRuslan/vim-es6'
Plugin 'Solarized'
Plugin 'mattn/emmet-vim'
" Session management (saves vim state)
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'
let g:session_autosave_periodic = 1
let g:session_autosave_silent = 1

call vundle#end()            " required
filetype plugin indent on    " required
" }}}

" Editor settings {{{
" Allow mouse clicks and highlighting (even works over SSH!)
set mouse=a
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

" Autosaving {{{
	" Used if Syntastic is not used
	set updatetime=200
	autocmd CursorHold,CursorHoldI * silent! update
	"augroup syntastic
	"		autocmd CursorHold * nested update
	"augroup END
	"set updatetime=200
" }}}

" Visual settings {{{
"if !has('gui_running')
"  let g:solarized_termtrans=1
"endif
syntax on
set nohlsearch
set background=dark
let g:solarized_termcolors = 16
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized
"" Set coloring of tabs
"hi TabLineFill ctermbg=Grey ctermfg=Grey
"hi TabLineSel ctermbg=Black ctermfg=White 
"hi TabLine ctermbg=Grey ctermfg=Black cterm=NONE
"" Set coloring of status line
"hi StatusLine ctermbg=Black ctermfg=188
"hi StatusLineNC ctermbg=Black ctermfg=Grey
"" Set coloring of window border
""hi VertSplit ctermbg=Black ctermfg=188
" }}}

" Leader settings & commands {{{
let mapleader=","
nnoremap - ,
let maplocalleader="\\"
nnoremap <Leader>s :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :qa<CR>
nnoremap <Leader>tn :tabnew<CR>
nnoremap <Leader>tc :tabclose<CR>
nnoremap <Leader>rv :so $MYVIMRC<CR>
nnoremap <Leader>ev :tabnew $MYVIMRC<CR>
nnoremap <Leader>vs :vsplit<CR>
nnoremap <Leader>hs :split<CR>
nnoremap <Leader>h :cd %:p:h<CR>
nnoremap <Leader>p :set paste!<CR>:set paste?<CR>
" }}}

" Window commands {{{
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap ) <C-W>+
nnoremap ( <C-W>-
" }}}

" Remap escape {{{
inoremap jk <Esc>
inoremap <Esc> <Nop>
"nnoremap <Esc> :NERDTreeToggle<CR>
" }}}

" python commands {{{
autocmd FileType python map <leader>c :make<cr>
"autocmd FileType python map <leader>c :w<cr>:! clear && python %:p<cr>
" }}}
" javascript settings {{{
autocmd FileType javascript map <leader>c :! clear && node %:p<cr>
" }}}
" c settings {{{
autocmd FileType c map <leader>c :! clear && gcc %:p -Wall -lcurses -pthread && ./a.out<cr>
" }}}
" swift settings {{{
autocmd FileType swift map <leader>c :w<cr>:! clear && swift %:p<cr>
" }}}
" cpp settings {{{
autocmd FileType cpp map <leader>c :! clear && g++ %:p && ./a.out<cr>
" }}}
" shell settings {{{
autocmd FileType sh map <leader>c :! clear && sh %:p<cr>
" }}}
" r settings {{{
autocmd FileType r map <leader>c :! clear && rscript %:p<cr>
" }}}

" vimscript file settings {{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup end
" }}}
