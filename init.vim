:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:let g:vimsyn_embed = 'l'

call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
" Plug 'https://github.com/airblade/vim-gitgutter'
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'

set encoding=UTF-8

call plug#end()

nnoremap <C-A> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

nmap <C-t> :TagbarToggle<CR>

:set completeopt-=preview " For No Previews

:colorscheme jellybeans

" air-line
let g:airline_powerline_fonts = 1
" let g:gitgutter_highlight_lines = 1
" let g:gitgutter_highlight_linenrs = 1
" let g:gitgutter_async = 0

" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
" endif

" airline symbols
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''

:luafile ~/.config/nvim/luapluginsconfig/gitsigns.lua
function! GitStatus()
  return printf(get(b:,'gitsigns_status','')
)
endfunction
set statusline+=%{GitStatus()}

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"