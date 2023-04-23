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

" visuals
:colorscheme slate

function! Toggle_Light_Dark_Colorscheme()
    if system('tmux show-environment THEME')[0:9] == 'THEME=dark'
        echo "Light
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

nnoremap <Leader>o :call Toggle_Light_Dark_Colorscheme()<cr>
autocmd FocusGained * :call SetColorScheme()

