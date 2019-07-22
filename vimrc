"This is a simple vimrc file by Tamás Cséri.
"Based on the vimrc of Sztupy and Dutow.

"$VIMHOME is set in plugin/set_vimhome_var.vim
"we run the file now because otherwise it would be loaded after .vimrc
runtime plugin/set_vimhome_var.vim
"let $VIMHOME = $HOME."/.vim"

"load pathogen first
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

set nocompatible             "behave like Vim

"set viminfo='20,\"50'       <--wtf?
"TODO the above options are bad
"using the defaults for now

set history=1000             "increase history from 20

""""interface""""
set ruler                    "show line/column info in status bar
set number                   "show line numbers
if version >= 703
  set colorcolumn=80,120     " margin at 80 and 120
endif
 
set pastetoggle=<F2>         "F2 toggles paste mode globally

set background=dark          "command-line color
set mouse=a
set ttymouse=xterm2


""""word wrapping""""

"a Notepad-like navigation for long lines if using arrows
"(navigation along screen lines)
noremap  <silent> <F3> :call ToggleWrap()<CR>
inoremap <silent> <F3> <C-o>:call ToggleWrap()<CR>
"ToggleWrap from here:
"http://vim.wikia.com/wiki/Move_cursor_by_display_lines_when_wrapping
"changes:
" - Wrap OFF enables list
" - removed virtualedit
" - fixed map-unmap pairs
function ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    setlocal nowrap list
    silent! unmap  <buffer> <Up>
    silent! unmap  <buffer> <Down>
    silent! unmap  <buffer> <Home>
    silent! unmap  <buffer> <End>
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
  else
    echo "Wrap ON"
    setlocal wrap linebreak nolist
    setlocal display+=lastline
    noremap  <buffer> <silent> <Up>   gk
    noremap  <buffer> <silent> <Down> gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End>  <C-o>g<End>
  endif
endfunction

"to be used in autocmd FileType
function TurnOnWrap()
  if &wrap
  else
    call ToggleWrap()
  endif
endfunction

set nowrap
" LaTeX files should wrap by default
autocmd FileType tex call TurnOnWrap()
autocmd FileType plaintex call TurnOnWrap()


""""search settings""""
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  set incsearch              "For fast terminals can highlight search string as you type
endif
set ignorecase               "needed for smartcase
set smartcase                "ignore case if the pattern contains only lowercase letters

"if &diff                    "Currently I see no reason why this is good
"  syntax off
"endif

"fancy wildmenu for auto-complete
set wildmenu
set wildignore=\
  \ .svn,.git,CVS,                      "VCS
  \ *.o,*.a,*.class,*.mo,
  \ *.la,*.so,*.obj,
  \ *.exe,*.pyc                         "compiled things
  \ *.jpg,*.png,*.xpm,*.gif,            "images
  \ *.swp,*~,*.bak                      "temporary files

highlight RedundantSpaces term=standout ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/ "\ze sets end of match so only spaces highlighted
set listchars=tab:>-,trail:.,extends:>  "always show tab, trailing space and out of screen row marker
set list


""""indentation options""""
set shiftwidth=2
set tabstop=2
set encoding=utf-8
set backspace=indent,eol,start " enhance backspace behaviour

set autoindent
set smartindent

"set expandtab               "turn tabs into spaces
set shiftround               "rounds indent to multiple of shiftwidth using < and >
"set nojoinspaces            "joins spaces when joining lines with J




filetype on
filetype indent on
filetype plugin on


syntax on

" Remember last position on open {
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif
  " Remember info about open buffers on close
  set viminfo^=%
" }

""""directories""""
set backup
set backupdir=$VIMHOME/_backup
set directory=$VIMHOME/_tmp

"persistent undo (only 7.3+ and if has the feature)
if has('persistent_undo')
  set undofile                 " Save undo's after file closes
  set undodir=$VIMHOME/_undo   " where to save undo histories
  set undolevels=1000          " How many undos
  set undoreload=10000         " number of lines to save for undo
endif



"GUI settings
if has("gui_running")
"  colorscheme darkblue
"  colorscheme delek
"  colorscheme default
  colorscheme zellner
endif


" Paste without moving cursor {
  noremap <C-F12> p`[
" }


"Go-specific
autocmd FileType go setlocal noexpandtab         "Go uses tabs
autocmd FileType go setlocal listchars+=tab:\ \  "there's no need to highlight them

" Temporary for TopCoder
"set noexpandtab         "Go uses tabs
"set listchars+=tab:\ \  "there's no need to highlight them
"set noet ci pi sts=0 sw=2 ts=2

" config options that seem to be useful right now
set expandtab
if has("gui_running")
  " spell check under console makes the whole file red
  set spell

  set guifont=Lucida_Console:h14

  behave mswin
endif
