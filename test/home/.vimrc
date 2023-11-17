" load the color scheme before anything
"colorscheme torte

" force 256 colors on the terminal
set t_Co=256

syntax on


"=============================================================================
"============================= TEXT SEARCH SETTINGS ==========================
"=============================================================================
"map /
"map ?
" Show (partial) command in status line.
set showcmd
set cmdheight=1

" Show matching brackets.
set showmatch

" игнорировать регистр при поиске
set ignorecase

" Incremental search
set incsearch

" Подсвечивать результаты поиска
set hlsearch
"set nohlsearch

" по умолчанию - латинская раскладка при поиске
set imsearch=0

set smartcase
"vnoremap * :call VisualSearch()//
"vnoremap # :call VisualSearch()?/


" Ставит кодировку UTF-8
" set charset translation encoding
set encoding=utf-8

" set terminal encoding
set termencoding=utf-8

" список предполагаемых кодировок, в порядке предпочтения
set fileencodings=utf-8,koi8r,cp1251,cp866,ucs-2le

"set fileencoding=utf-8
"if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
"   set fileencodings=utf-8,ucs-bom,latin1
"endif

set splitright
set nocp
set nu
set laststatus=2

" Hide buffers when they are abandoned
set hidden
set switchbuf=useopen

" Enable mouse usage (all modes)
set mouse=a

" Modelines (comments that set vim options on a per-file basis)
set modeline
" Turn off modelines
"set modelines=0
set modelines=3

"=============================================================================
"========================== FILE MANAGEMENT SETTINGS =========================
"=============================================================================
" Automatically save before commands like :next and :make
set autowrite
" Keep more context when scrolling off the end of a buffer
set scrolloff=3
set fileformat=unix
set fencs=utf-8,cp1251,koi8-r,cp866
"autocmd! bufwritepre $MYVIMRC call setline(1, '"" Last update: '.strftime("%d.%m.%Y %H:%M"))
filetype on
filetype plugin on
filetype indent on
"autocmd FileType perl call SetPerlConf()
set path=.,,**

" Отключает обратную совместимость с Vi
" Use Vim defaults (much better!)
set nocompatible

" Включает подсветку синтаксиса
syntax enable

" allow backspacing over everything in insert mode
set bs=indent,eol,start

" read/write a .viminfo file, don't store more
" than 50 lines of registers
set viminfo='20,\"50

" keep 50 lines of command line history
set history=50

" show the cursor position all the time
set ruler

" включает/выключает замену табов на пробелы
"set noexpandtab
set expandtab

" количество пробелов в одном обычном табе
set tabstop=4

" количество пробелов в табе при удалении
set softtabstop=4

" при нажатии таба в начале строки добавляет
" количество пробелов равное shiftwidth
set smarttab
set shiftwidth=4

set noshiftround

" Prevent vim from clobbering the scrollback buffer
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=



"=============================================================================
"====================== COLLAPSING TEXT BLOCKS (folding) =====================
"=============================================================================
"set foldenable
"set foldmethod=syntax
"set foldmethod=indent
"set foldcolumn=1
"set foldcolumn=2
"set foldlevel=2
"set foldopen=all

" Сам по себе number показывает номера строк
" relativenumber - нумерацию строк относительно
" положения курсора
" number relativenumber - гибридный вариант
set number relativenumber


set ttyfast

" always set autoindenting on
set autoindent
"set ai




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" keep a backup file
" You have to create a directory in your home directory
" called vimtmp for this to work.
" The "//" at the end of each directory means that file
" names will be built from the complete path to the file
" with all path separators substituted to percent "%" sign.
" This will ensure file name uniqueness in the preserve
" directory.
try
    silent !mkdir ~/.tmp/vim/backup > /dev/null 2>&1
    silent !mkdir ~/.tmp/vim/swp > /dev/null 2>&1
    silent !mkdir ~/.tmp/vim/undo > /dev/null 2>&1
    " set directory=~/.vim/backup/,.
    set directory=~/.tmp/vim/swp//,.
    " set backupdir=~/.vim/backup/,.
    set backupdir=~/,tmp/vim/backup//,.
    " set undodir=~/.vim/.undo//
    set undodir=~/.tmp/vim/undo//,.
    set undofile
catch
endtry
set backup

"set undolevels=200
set undolevels=2048

" Отключаем панели прокрутки в GUI
set guioptions=

" Отключаем панель табов (окошки FTW)
set showtabline=0

" При нажатии неверной клавиши или ошибке в Vim
" проигрывается специальный звук. Если он вам
" мешает, его можно отключить.
set noerrorbells
set novisualbell

" Cпособ переноса строк `soft wrapping`
" wrap заставляет переносить строчки без их разделения
" Соответсвенно nowrap рендерит строчки за границами экрана
" wrap linebreak nolist - работает как wrap,
" но переносит строчки не посимвольно, а по словам
"set wrap linebreak nolist
set nowrap linebreak list
" перенос по словам, а не по буквам
set dy=lastline
set showbreak=↪\

set listchars=tab:→\ ,nbsp:␣,trail:◥,extends:→,precedes:←

" При желании можно заставить Вим насильно разделять
" строчки в самом тексте вот так
" (Где 80 стоит заменить на нужную вам длину строки):
"set textwidth=80

" стандарт использования символов переноса строки в файлах
set ffs=unix,dos,mac

highlight SpellBad ctermfg=Black ctermbg=Red
hi NonText ctermfg=16 guifg=#4a4a59
hi SpecialKey ctermfg=16 guifg=#4a4a59

" set comment color of comments
hi Comment term=bold ctermfg=4 guifg=#406090

" set color of line numbers
hi LineNr term=underline ctermfg=3 guifg=Red3


set title

set cursorline
"set cursorline cursorcolumn
" set the prefered colours, pick one line here only.
"hi CursorLine term=bold cterm=bold guibg=Grey40
"==[ dark grey, better you can get if you don't support 256 colours
"hi CursorLine   cterm=NONE ctermbg=8 ctermfg=NONE
"==[ light grey, no 256 colors
"hi CursorLine   cterm=NONE ctermbg=7 ctermfg=NONE
"==[ dark redish
"hi CursorLine   cterm=NONE ctermbg=52 ctermfg=NONE
"==[ dark bluish
"hi CursorLine   cterm=NONE ctermbg=17 ctermfg=NONE
"==[ very light grey
"hi CursorLine   cterm=NONE ctermbg=254 ctermfg=NONE
"==[ yelowish
"hi CursorLine   cterm=NONE ctermbg=229 ctermfg=NONE
"==[ almost black
hi CursorLine   cterm=NONE ctermbg=234 ctermfg=NONE
"hi cursorline cterm=NONE ctermbg=234 ctermfg=NONE

" Insert only one space when joining lines that contain sentence-terminating
" punctuation like `,`.
set nojoinspaces

"##########################################################################################
" STATUS LINE
"##########################################################################################

" status bar colors
"au InsertEnter * hi statusline guifg=black guibg=#d7afff ctermfg=black ctermbg=magenta
"au InsertEnter * hi statusline guifg=black guibg=#d7afff ctermfg=black ctermbg=red
"au InsertLeave * hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan
"hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan

" Status line
" default: set statusline=%f\ %h%w%m%r\ %=%(%l,%c%V\ %=\ %P%)

" Status Line Custom
"let g:currentmode={
"    \ 'n'  : 'Normal',
"    \ 'no' : 'Normal·Operator Pending',
"    \ 'v'  : 'Visual',
"    \ 'V'  : 'V·Line',
"    \ '^V' : 'V·Block',
"    \ 's'  : 'Select',
"    \ 'S'  : 'S·Line',
"    \ '^S' : 'S·Block',
"    \ 'i'  : 'Insert',
"    \ 'R'  : 'Replace',
"    \ 'Rv' : 'V·Replace',
"    \ 'c'  : 'Command',
"    \ 'cv' : 'Vim Ex',
"    \ 'ce' : 'Ex',
"    \ 'r'  : 'Prompt',
"    \ 'rm' : 'More',
"    \ 'r?' : 'Confirm',
"    \ '!'  : 'Shell',
"    \ 't'  : 'Terminal'
"    \}

"set laststatus=2
"
"set noshowmode
"set statusline=
"set statusline+=%0*\ %n\                                 " Buffer number
"set statusline+=%*│                                     " Separator
"set statusline+=%{'---'.mode().'---'}
""set statusline+=%{g:currentmode[mode()]}
"set statusline+=%*│                                     " Separator
"set statusline+=%1*\ %<%F%m%r%h%w\                       " File path, modified, readonly, helpfile, preview
"set statusline+=%3*│                                     " Separator
"set statusline+=%2*\ %Y\                                 " FileType
"set statusline+=%3*│                                     " Separator
"set statusline+=%2*\ %{''.(&fenc!=''?&fenc:&enc).''}     " Encoding
"set statusline+=\ (%{&ff})                               " FileFormat (dos/unix..)
"set statusline+=%3*│                                     " Separator
"set statusline+=%2*\ (ch:%3b\ hex:%2B)                        " char hex
"set statusline+=%=                                       " Right Side
"set statusline+=%2*\ col:\ %02v\                         " Colomn number
"set statusline+=%3*│                                     " Separator
"set statusline+=%1*\ ln:\ %02l/%L\ (%3p%%)\              " Line number / total lines, percentage of document
""set statusline+=%0*\ %{toupper(g:currentmode[mode()])}\  " The current mode
"
"hi User1 ctermfg=007 ctermbg=239 guibg=#4e4e4e guifg=#adadad
"hi User2 ctermfg=007 ctermbg=236 guibg=#303030 guifg=#adadad
"hi User3 ctermfg=236 ctermbg=236 guibg=#303030 guifg=#303030
"hi User4 ctermfg=239 ctermbg=239 guibg=#4e4e4e guifg=#4e4e4e
"
"set statusline=%f%m%r%h%w\ %y\ enc:%{&enc}\ ff:%{&ff}\ fenc:%{&fenc}%=(ch:%3b\ hex:%2B)\ col:%2c\ line:%2l/%L\ [%2p%%]

" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup redhat
  autocmd!
  " In text files, always limit the width of text to 78 characters
  " autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
  " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
  "autocmd BufNewFile,BufReadPre /media/*,/run/media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
  autocmd BufNewFile,BufReadPre /media/*,/run/media/*,/mnt/* set directory=~/.tmp/vim/swp
  " start with spec file template
  autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
  augroup END
endif


if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add $PWD/cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
"if &t_Co > 2 || has("gui_running")
"  syntax on
"  set hlsearch
"endif

"if &term=="xterm"
"     set t_Co=8
"     set t_Sb=[4%dm
"     set t_Sf=[3%dm
"endif

" Remove trailing whitespaces before save
"autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWritePre * :%s/\S\@<=\s\+$//ge

inoremap <F3> <esc>:set paste!<cr>i
nnoremap <F3> :set paste!<cr>

" Press F4 to toggle highlighting and clear any message already displayed
noremap <F4> :set hlsearch! hlsearch?<cr>

nnoremap <F5> :call NumColumnToggle()<cr>
function! NumColumnToggle()
    if &number
        setlocal nonumber norelativenumber
    else
        setlocal number relativenumber
    endif
endfunction

nnoremap <F6> :call WrapToggle()<cr>
function! WrapToggle()
    if &wrap
        setlocal nowrap linebreak list
    else
        setlocal wrap linebreak list
    endif
endfunction

"##############################################################################
"# PLUGIN
"##############################################################################
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.config/vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
"Plug 'terryma/vim-multiple-cursors'
Plug 'mg979/vim-visual-multi'

call plug#end()

"let g:airline_powerline_fonts = 1
"
"if !exists('g:airline_symbols')
"    let g:airline_symbols = {}
"endif

"" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.crypt = '🔒'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.maxlinenr = '☰'
"let g:airline_symbols.maxlinenr = ''
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.spell = 'Ꞩ'
"let g:airline_symbols.notexists = '∄'
"let g:airline_symbols.whitespace = 'Ξ'
"
"" powerline symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
"let &guicursor = &guicursor . ",a:blinkon0"
colorscheme gruvbox
set bg=dark
let g:airline_theme='badwolf'
