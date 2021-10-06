"Call :PlugInstall to install plugin
call plug#begin('~/.config/nvim/plugged')
Plug 'arcticicestudio/nord-vim'
Plug 'preservim/nerdtree'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'hoob3rt/lualine.nvim'
" If you want to have icons in your statusline choose one of these
"Plug 'kyazdani42/nvim-web-devicons'
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

" make highlighing in visual mode and lualine work in alacritty
if (has("termguicolors"))
  set termguicolors
endif

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
autocmd Filetype json setlocal ts=2 sw=2 expandtab
autocmd Filetype typescript setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 expandtab
autocmd Filetype vim setlocal ts=2 sw=2 expandtab

"for NerdTree
"avoid crashes when calling vim-plug functions while the cursor is in nerdtree
let g:plug_window = 'noautocmd vertical topleft new'
nnoremap <leader>n :NERDTreeToggle<CR>

" LSP Set up
lua << EOF
local cmp = require'cmp'
  cmp.setup({
    mapping = {
      ['<CR>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert }),
    },
    sources = {
      { name = 'nvim_lsp' },
    },
    completion = {
       completeopt = 'menu,menuone,noinsert',
    }
  })
    
  require'lspconfig'.rust_analyzer.setup{}

  require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", 
    -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
      enable = true,              -- false will disable the whole extension
      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
    },
  }

  require('lualine').setup{
    options = {theme = 'nord'},
    sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'encoding'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
    },
  }

  vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]] 
EOF

