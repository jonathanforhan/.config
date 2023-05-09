"                               _                                              "
"                       __   __(_) _ __ ___   _ __  ___                        "
"                       \ \ / /| || '_ ` _ \ | '__|/ __|                       "
"                        \ V / | || | | | | || |  | (__                        "
"                         \_/  |_||_| |_| |_||_|   \___|                       "
"                                                                              "
set nu
set relativenumber

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set smartindent

set nowrap

set nohls
set incsearch

set termguicolors

set scrolloff=8
set signcolumn="yes"

set updatetime=50

set showtabline=2

"" Remaps
let mapleader = " "

"" Move Block
vnoremap <C-j> :m'>+1<CR>gv
vnoremap <C-k> :m'<-2<CR>gv

"" Macro
noremap Q <nop>")

"" Tabmove
noremap { :tabprevious<CR>
noremap } :tabnext<CR>
noremap <leader>[ :tabm-<CR>
noremap <leader>] :tabm+<CR>

"" Quick Jump
noremap L J
noremap J 5j
noremap K 5k
vnoremap J 5j
vnoremap K 5k

"" File Explorer
noremap <leader>e :NERDTreeToggle<CR>

"" Comment Blocks
vnoremap <leader>/ :s/\\s*/&\\/\\/<CR>
vnoremap <leader>? :s/\\/\\//<CR>

"" C++ Code Snippets
noremap <leader>i i#include <><esc>i
noremap <leader>I o#include <><esc>i
noremap <leader>c astd::cout <<  << '\n';<esc>4bhi

set clipboard^=unnamed

"" PLUG
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Tokyo Night
Plug 'ghifarit53/tokyonight-vim'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()

"" Plugin Config
let g:tokyonight_style = 'night'
let g:tokyonight_enable_italic = 1
colorscheme tokyonight
