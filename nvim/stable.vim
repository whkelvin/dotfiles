"Call :PlugInstall to install plugin
call plug#begin('~/.config/nvim/plugged')
Plug 'arcticicestudio/nord-vim'
Plug 'preservim/nerdtree'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'rust-lang/rust.vim'
"Plug 'https://github.com/vim-syntastic/syntastic'
call plug#end()

:set shell=/bin/bash

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

let mapleader=" "
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

let g:nord_bold_vertical_split_line = 1
let g:nord_cursor_line_number_background = 1

augroup nord-theme-overrides
  autocmd!
  autocmd ColorScheme nord highlight Identifier ctermfg=4
  autocmd ColorScheme nord highlight Special ctermfg=6
  autocmd ColorScheme nord highlight Comment ctermfg=5
augroup END

colorscheme nord

set cursorline

"locale setting
set encoding=utf-8

"show line number
set number

"tell vim to not wait for second key: time out on mapping after 0.1 second, time out on key codes after 0.1 second
set timeout timeoutlen=200 ttimeoutlen=200


"set space for tab
set expandtab

"set tab to 4 spaces
set ts=4 sw=4

autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd FileType css setlocal ts=2 sts=2 sw=2
autocmd FileType scss setlocal ts=2 sts=2 sw=2

"for omnisharp auto complete list
inoremap <C-j> <Down>
inoremap <C-k> <Up>

"for jumping between windows
"nnoremap <C-h> <C-w>h
"nnoremap <C-l> <C-w>l
"nnoremap <C-k> <C-w>k
"nnoremap <C-j> <C-w>j

"for resizing windows
"nnoremap <S-h> <C-w><
"nnoremap <S-l> <C-w>>
"nnoremap <S-k> <C-w>+
"nnoremap <S-j> <C-w>-

"for nvim terminal emulator
"if has('nvim')
"	tnoremap <Esc> <C-\><C-n>
"	tnoremap <C-q> <Esc>
"	nnoremap t :belowright split:let $VIM_DIR=expand('%:p:h')<CR>:terminal<CR>cd $VIM_DIR<CR>
"endif

"for NerdTree
"avoid crashes when calling vim-plug functions while the cursor is in nerdtree
let g:plug_window = 'noautocmd vertical topleft new'
nnoremap <leader>n :NERDTreeToggle<CR>

"airline
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1

"coc
let g:coc_global_extensions = ['coc-tsserver']

"for yats
"set re=0
"
"Prettier
"auto format for all files
let g:prettier#autoformat_require_pragma = 0
"disable quickfix
let g:prettier#quickfix_enabled = 0

autocmd BufWritePost *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

"Syntastic Config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Rust format
let g:rustfmt_autosave = 1

"Rust 
syntax enable
filetype plugin indent on
