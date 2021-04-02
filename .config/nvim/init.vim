call plug#begin('~/.local/share/nvim/plugged')

" --- Coc ---
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'neovim/nvim-lspconfig'

" --- FZF and ripgrep ---
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" --- Statusline ---
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" --- Git ---
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'mattn/webapi-vim'
Plug 'mattn/vim-gist'

" --- Language Ext. ---
Plug 'rust-lang/rust.vim'
Plug 'hashivim/vim-terraform'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'ledger/vim-ledger'
Plug 'towolf/vim-helm'
Plug 'lervag/vimtex'
Plug 'vim-scripts/dbext.vim'

" TSX highlighting, tsserver is handled by CoC
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" --- Snippets ---
Plug 'honza/vim-snippets'
Plug 'andrewstuart/vim-kubernetes'

" --- Misc ---
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdtree'
Plug 'shougo/echodoc.vim'
Plug 'flanfly/vim-thar'
Plug 'unblevable/quick-scope'

call plug#end()

set laststatus=2
set enc=utf-8
set swb=useopen
set nomousehide
set autoindent
set nu
set hlsearch
set shiftwidth=2
set linespace=2
set tabstop=2
set et
set splitright
set splitbelow
set hidden
set mouse=a

tnoremap <C-Esc> <C-\><C-n>
nnoremap <C-p> :History<Cr>
" OSX
nnoremap <A-p> :History<Cr>

colorscheme thar

" Style Pmenu (completition popup)
hi Pmenu guibg=grey30 ctermbg=242
hi PmenuSel guibg=grey20 term=bold cterm=bold gui=bold

" GitGutter
let g:gitgutter_sign_added = '•'
let g:gitgutter_sign_modified = '•'
let g:gitgutter_sign_removed = '•'
let g:gitgutter_sign_removed_first_line = '•'
let g:gitgutter_sign_modified_removed = '•'
highlight GitGutterAdd ctermfg=2 guifg=springgreen
highlight GitGutterChange ctermfg=3 guifg=yellow
highlight GitGutterDelete ctermfg=5 guifg=indianred

" Persistent UNDO
if has('persistent_undo')      "check if your vim version supports it
  set undofile                 "turn on the feature  
  set undodir=~/.local/share/nvim/undo  "directory where the undo files will be stored
endif

" Coc
set shortmess+=c
set updatetime=300

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" Rust.vim
let g:rustfmt_autosave_if_config_present = 1

" Typescript/TSX
autocmd BufNewFile,BufRead *.tsx,*.jsx, set filetype=typescript.tsx

" Ripgrep.vim
let g:rg_highlight = 1
let g:rg_derive_root = 1
let g:rg_root_types = ['.git', 'package.json', 'Cargo.toml']
let g:rg_binary = '/usr/local/bin/rg'

" Vimtex
let g:tex_flavor = 'latex'
