" 
" ####################################################################### 
" # https://github.com/wasifekbal/dotfiles-and-scripts/blob/main/.vimrc #
" #######################################################################
"
" - Install vim plug
"   curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" - After installing vim plug, uncomment plugs from begin to end.
"
" NOTE: MUST HAVE POWERLINE FONTS INSTALLED.
"       - https://github.com/powerline/fonts
"

" call plug#begin()

" Plug 'preservim/nerdtree'
" Plug 'vim-airline/vim-airline'
" Plug 'ryanoasis/vim-devicons'
" Plug 'dracula/vim', { 'as': 'dracula' }

" call plug#end()

"colorscheme dracula

let g:mapleader = " "

let NERDTreeShowHidden=1
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

nnoremap <leader>sf :source ~/.vimrc<CR>
nnoremap <F2> :set hlsearch!<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :xa<CR>
nnoremap <F3> :set spell!<CR>
inoremap <F3> <C-O>:set spell!<CR>
nnoremap <leader>s gg<S-v>G

nnoremap p "0p
nnoremap P "0P
vnoremap x "0x
nnoremap x "0x

"nnoremap p "+p
"nnoremap P "+P
"vnoremap x "+x
"nnoremap x "+x

vnoremap <leader>y "+y
vnoremap <leader>p "+p
nnoremap <leader>p "+p

set background=dark
set number
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
set smartindent
"set cursorline
set mouse=a
set incsearch
"set hlsearch
syntax on


" For file paths
set path+=**
set wildmenu
set wildignore+=**/node_modules/**
set wildignore+=**/venv/**

" Converts Dos file format to Unix.
function! ConvertDosToUnix()
  :w
  :e ++ff=dos
  :set ff=unix
  :w
endfunction

" Automatically deletes hidden buffers of NerdTREE
augroup AutoDeleteNetrwHiddenBuffers
  au!
  au FileType netrw setlocal bufhidden=wipe
augroup end

let g:netrw_banner = 0
let g:netrw_keepdir = 0
let g:netrw_winsize = 23
let g:netrw_liststyle=3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_preview = 1

" Mappings ---------------------------------------------------
"map <silent> <C-E> :call ToggleNetrw()<CR>
"map <leader>c :call ConvertDosToUnix()<CR>
map <F2> :set hlsearch!<CR>

"augroup ProjectDrawer
  "autocmd!
  "autocmd VimEnter * :Lex
"augroup END

" vim-airline shows all
set noshowmode  " to get rid of thing like --INSERT--
set noshowcmd  " to get rid of display of last command
set shortmess+=F  " to get rid of the file name displayed in the command line bar

" If using alacritty, set ttymouse to sgr
if $TERM == 'alacritty'
  set ttymouse=sgr
endif

