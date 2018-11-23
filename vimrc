"""""""""""""""""""""""""
"      Plug config      "
"""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'Shougo/unite.vim'
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-airline/vim-airline'
Plug 'dag/vim-fish'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'jiangmiao/auto-pairs'
call plug#end()


""""""""""""""""""""""
"      Settings      "
""""""""""""""""""""""
set nocompatible                " Enables us Vim specific features
filetype off                    " Reset filetype detection first ...
filetype plugin indent on       " ... and enable filetype detection
set laststatus=2                " Show status line always
set encoding=utf-8              " Set default encoding to UTF-8
set autoread                    " Automatically read changed files
set autoindent                  " Enable Autoindent
set backspace=indent,eol,start  " Makes backspace key more powerful.
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set noerrorbells                " No beeps
set number                      " Show line numbers
set showcmd                     " Show me what I'm typing
set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set splitright                  " Vertical windows should be split to right
set splitbelow                  " Horizontal windows should split to bottom
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set noshowmatch                 " Do not show matching brackets by flickering
set noshowmode                  " We show the mode with airline or lightline
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not it begins with upper case
set completeopt=menu,menuone    " Show popup menu, even if there is one entry
set pumheight=10                " Completion window max size
set nocursorcolumn              " Do not highlight column (speeds up highlighting)
set nocursorline                " Do not highlight cursor (speeds up highlighting)
set lazyredraw                  " Wait to redraw
set nowrap			" Stop word wrapping

" Enable to copy to clipboard for operations like yank, delete, change and put
" http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
if has('unnamedplus')
  set clipboard^=unnamed
  set clipboard^=unnamedplus
endif

" This enables us to undo files even if you exit Vim.
if has('persistent_undo')
  set undofile
  set undodir=~/.config/vim/tmp/undo//
endif


""""""""""""""""""""""
"     Key-Mapping    "
""""""""""""""""""""""

"Remap leader to space
let mapleader="\<SPACE>"

" Return to last opened file
nmap <Leader><Leader> <c-^>

" Next/Previous Buffer
nnoremap <Tab> :bnext!<CR>
nnoremap <S-Tab> :bprev!<CR><Paste>

" Replace all
nmap <Leader>r :%s/

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

" Visual linewise up and down by default (and use gj gk to go quicker)
noremap <Up> gk
noremap <Down> gj
noremap j gj
noremap k gk

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Enter automatically into the files directory
autocmd BufEnter * silent! lcd %:p:h


""""""""""""""""""""""
"    Ctrlp config    "
""""""""""""""""""""""
nnoremap <Leader>p :CtrlP<CR>
let g:ctrlp_show_hidden = 1


""""""""""""""""""""""""
"    NerdTreeconfig    "
""""""""""""""""""""""""
map ` :NERDTreeToggle<CR>
let NERDTreeShowHidden=1


""""""""""""""""""""""""
"    vim-go config     "
""""""""""""""""""""""""
let g:go_fmt_command = "goimports"

let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

augroup go
  autocmd!

  " Show by default 4 spaces for a tab
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

  " :GoBuild and :GoTestCompile
  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

  " :GoDoc
  autocmd FileType go nmap <Leader>d <Plug>(go-doc)

  " :GoInfo
  autocmd FileType go nmap <Leader>i <Plug>(go-info)

  " :GoMetaLinter
  autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)

  " :GoDef but opens in a vertical split
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
  " :GoDef but opens in a horizontal split
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)
augroup END

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
