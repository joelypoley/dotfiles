" Configure vim-plug
call plug#begin('~/.local/share/nvim/plugged')
    " Add `Plug <plugin name here>`
    " Then call `:PlugInstall` when you enter nvim
	Plug 'crusoexia/vim-monokai'
    Plug 'scrooloose/nerdtree'
    if has('nvim')
      Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
      Plug 'Shougo/deoplete.nvim'
      Plug 'roxma/nvim-yarp'
      Plug 'roxma/vim-hug-neovim-rpc'
    endif
call plug#end()

" Colorscheme
syntax on
colorscheme monokai

" Enable deoplete for autocompletion
let g:deoplete#enable_at_startup = 1
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" Make deoplete suggestions update as quickly as
call deoplete#custom#option('auto_complete_delay', 1)
call deoplete#custom#option('auto_refresh_delay', 1)

" Highlight the current line
set cursorline
" (Relative) line numbers
set number
set relativenumber

" True color support
set termguicolors

" Italics when supported in terminal and gui
let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1

" Undo history, even after closing!
set undodir=~/.vimundo
set undofile

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" changes the cursor shape/color
" in the terminal depending on the mode
" see http://code.google.com/p/iterm2/issues/detail?id=710&q=cursor
function! SetCursorStyle()
  if &term =~ "xterm\\|rxvt"
    " use a | cursor in insert mode
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"

    " use a rectangle cursor otherwise
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"

    " reset cursor when vim exits
    autocmd VimLeave * silent !echo -ne "\<Esc>]50;CursorShape=0\x7"

  endif
endfunction
