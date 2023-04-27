set ruler
set laststatus=2
set statusline=%F  " show filepath on status line
set number

" Highlight search terms, but can clear the highlights with <space> 
set hlsearch       
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" remap navigation keys
noremap j h
noremap k j
noremap i k

" for exiting and entering insert mode
inoremap hh <ESC>
noremap h i

" default color scheme (dark mode) 
:colorscheme slate

function! Toggle_Light_Dark_Colorscheme()
    if system('tmux show-environment THEME')[0:9] == 'THEME=dark'
        :silent :!tmux set-environment THEME 'light'
        :silent :!tmux source-file ~/.tmux_light.conf
    else
        :silent :!tmux set-environment THEME 'dark'
        :silent :!tmux source-file ~/.tmux_dark.conf
    endif
    :call SetColorScheme()
endfunction

function! SetColorScheme()
    " check if tmux colorsheme is light or dark, and pick for vim accordingly
    if system('tmux show-environment THEME')[0:9] == 'THEME=dark'
        colorscheme slate
    else
        colorscheme morning
    endif
endfunction

" can call this with \o
nnoremap <Leader>o :call Toggle_Light_Dark_Colorscheme()<cr>

" I'm not sure which of these is working so I'll keep them all for now 
" Still doesn't work when focus is gained though. In that case, you
" need to manually call the toggler with \o
autocmd BufEnter * :call SetColorScheme()
autocmd VimEnter * :call SetColorScheme()
autocmd FocusLost * :call SetColorScheme()
autocmd FocusGained * :call SetColorScheme()



