" Tab related
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" UI related
set number
set showmatch
set wildmenu
set ruler
syntax enable

highlight ColorColumn ctermbg=4
highlight ColorColumn guibg=Black
set colorcolumn=60,80,100,120

set nocompatible
set backspace=indent,eol,start

" Mouse related
set mouse=

" GVim
colorscheme elflord

" Folds
" set foldenable
" set fdm=syntax
" set foldlevelstart=5
" set foldnestmax=10
" nnoremap <space> za

" Disable Arrow keys in Escape mode
" map <up> <nop>
" map <down> <nop>
" map <left> <nop>
" map <right> <nop>

" allow the . to execute once for each line of a visual selection
vnoremap . :normal .<CR>

