set ruler
set laststatus=2
set statusline=%F  " show filepath on status line
set number

" Highlight search terms, but can clear the highlights with <enter> 
set hlsearch       
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

