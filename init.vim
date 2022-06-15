call plug#begin(stdpath('config') . '/plugged')
  Plug 'preservim/nerdtree'
call plug#end()

" NERDTRee
nnoremap <leader>n :NERDTreeFocus<CR>

" general config
set number
