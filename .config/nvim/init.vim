set expandtab
set smartindent
set shiftwidth=2
set softtabstop=2
set encoding=utf8


" PLUGIN SETTINGS
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'

call plug#end()

" AIRLINE SETTINGS
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#defailt#layout = [
  \ [ 'a', 'b', 'c'],
  \ ['z']
  \ ]
let g:airline_section_c = '%t %M'
let g:airline_section_z = get(g:, 'airline_linecolumn_prefix', '').'%3l:%-2v'

let g:airline#extensions#tabline#fnamemod = ':t'

" FERN SETTINGS
let mapleader = '\<Space>'
let g:fern#default_hidden = 1
let g:fern#renderer = 'nerdfont'
let g:fern#renderer#nerdfont#indent_markers = 1
nnoremap <S-f> :Fern . -reveal=% -drawer -toggle -width=30<CR>
