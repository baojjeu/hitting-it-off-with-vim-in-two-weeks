set nocompatible                " choose no compatibility with legacy vi
filetype off
set encoding=utf-8
set showcmd                     " display incomplete commands
set cursorline
set laststatus=2
set clipboard=unnamed " make Vim use the system clipboard as the default register
" set linespace=3

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
nmap <C-F>f <Plug>CtrlSFPrompt

" cancel search highlight
nnoremap <C-L> :nohls<CR><C-L>

" make Vim quiet
set visualbell

" numbers
set number
set numberwidth=5
set relativenumber

" Splits
set splitbelow
set splitright

" vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'mattn/emmet-vim'
" Plugin 'Lokaltog/vim-powerline.git'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-surround'
Plugin 'othree/html5.vim'
Plugin 'tpope/vim-rbenv'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tComment'
Plugin 'dyng/ctrlsf.vim'
Plugin 'altercation/vim-colors-solarized.git'
Plugin 'c9s/colorselector.vim'
Plugin 'ap/vim-css-color'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'tmhedberg/matchit'
call vundle#end()            " required
syntax enable
filetype plugin indent on

" for airline
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
" let g:airline#extensions#tabline#enabled = 1

" for powerline
" let g:Powerline_symbols = 'fancy'

" MacVim settings
set guifont=Monaco\ for\ Powerline:h16

if has("gui_running")
  set guioptions-=T
  set guioptions-=m
  set guioptions-=r
  set guioptions-=L
  set guioptions-=t
endif

" theme things
set t_Co=256
" let g:solarized_termcolors=256
" set background=dark
colorscheme monokai
" call togglebg#map("<F6>")

" NERDtree things
nmap <F2> :NERDTreeToggle <CR>

" Trim whitespace
autocmd BufWritePre * :%s/\s\+$//e " trim whitespace when saving

let g:user_emmet_expandabbr_key='<Tab>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
