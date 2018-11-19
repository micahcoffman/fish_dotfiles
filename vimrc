" Set standard file encoding
set encoding=utf8
" No special per file vim override configs
set nomodeline
" Stop word wrapping
set nowrap
" Adjust system undo levels
set undolevels=100
" Use system clipboard
set clipboard=unnamed
" Dont let Vim hide characters or make loud dings
set conceallevel=1
set noerrorbells
" Number gutter
set number
" Do not use search highlighting
set nohlsearch
" Space above/beside cursor from screen edges
set scrolloff=1
set sidescrolloff=5
" Enable backspace in insert mode
set backspace=indent,eol,start

"Remap leader to space
let mapleader="\<SPACE>"

" Return to last opened file
nmap <Leader><Leader> <c-^>
" Next/Previous Buffer
nnoremap <Tab> :bnext!<CR>
nnoremap <S-Tab> :bprev!<CR><Paste>

" Insert to normal mode
inoremap jk <Esc>
inoremap JK <Esc>
inoremap Jk <Esc>
inoremap jK <Esc>
inoremap kj <Esc>
inoremap Kj <Esc>
inoremap kJ <Esc>

" Switch windows
nnoremap gw <C-w><C-w>
nnoremap GW <C-w><C-w>
nnoremap Gw <C-w><C-w>
nnoremap gW <C-w><C-w>
nnoremap wg <C-w><C-w>
nnoremap Wg <C-w><C-w>
nnoremap wG <C-w><C-w>

" Plug config
call plug#begin('~/.vim/plugged')
Plug 'Shougo/unite.vim'
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-airline/vim-airline'
Plug 'dag/vim-fish'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'AndrewRadev/splitjoin.vim'
call plug#end()

" Ctrlp config
nnoremap <Leader>p :CtrlP<CR>
nnoremap <Leader>t :CtrlP<CR>
let g:ctrlp_show_hidden = 1

" NerdTree config
map ` :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" vim-go config
autocmd FileType go nmap <leader>b <Plug>(go-build)
let g:go_fmt_command = "goimports"
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"