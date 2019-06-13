set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree' " <- Plugins for project navigation
Plugin 'jistr/vim-nerdtree-tabs' " <- ^^^
Plugin 'flazz/vim-colorschemes' " <- Themes
Plugin 'bling/vim-airline' " <- statusbar at bottom
Plugin 'xolox/vim-easytags' " <- tag generation and (some) syntax highlighting
Plugin 'majutsushi/tagbar' " <- tag pane at right of window
Plugin 'ctrlpvim/ctrlp.vim' " <- full path fuzzy file,buffer,mru,tag,et c. finder
" --- git plugins----
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
" -------------------
Plugin 'Raimondi/delimitMate' " <- creates closing brackets/parentesis/et c.
Plugin 'vim-syntastic/syntastic' " <- should do marks for syntax issues
"
" ---- autocompletion ----
Plugin 'ervandew/supertab'
" ------------------------
" === extras ===
Plugin 'vim-scripts/HTML-AutoCloseTag'
Plugin 'xolox/vim-misc'
Plugin 'tpope/vim-commentary' " <- commenting extras (block comments, mass comments, et c.)


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
" NERDTree ================== 
" This creates a keyboard shortcut for NERDTree (Ctrl+n)
map <C-t> :NERDTreeToggle<CR>
" this opens each file in a new tab when pressing enter
let NERDTreeMapOpenInTab='<ENTER>'
" this should let me double click to open in new tab
autocmd VimEnter * call NERDTreeAddKeyMap({ 'key': '<2-LeftMouse>', 'scope': "FileNode", 'callback': "OpenInTab", 'override':1 })
    function! OpenInTab(node)
        call a:node.activate({'reuse': 'all', 'where': 't'})
    endfunction
" This allows hidden files to show up
let NERDTreeShowHidden=1
" This show cause nerdtree to reload on focus and when a file is written/edited
autocmd BufWritePost * NERDTreeFocus | execute 'normal R' | wincmd p
" This handles file highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" end NERDTree =============
"
" ==== NERDTree tabs =====
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" To have NERDTree always open on startup
let g:nerdtree_tabs_open_on_console_startup = 1
"
" end NERDTree tabs ======
"
" === Xuyuanp/nerdtree-git-plugin settings ===
let g:NERDTreeIndicatorMapCustom = {
      \ "Modified"  : "✹",
      \ "Staged"    : "✚",
      \ "Untracked" : "✭",
      \ "Renamed"   : "➜",
      \ "Unmerged"  : "═",
      \ "Deleted"   : "✖",
      \ "Dirty"     : "✗",
      \ "Clean"     : "✔︎",
      \ 'Ignored'   : '☒',
      \ "Unknown"   : "?"
      \ }
" === end Xuyuanp/nerdtree-git-plugin ===
"
" === bling/vim-airline settings===
" always show statusbar
set laststatus=2
" === end vim-airline ====
"
" === vim-syntastic/syntastic settings ===
"let g:syntastic_error_symbol = '✘'
"let g:syntastic_warning_symbol = "▲"
"augroup mySyntastic
"	au!
"	au FileType tex let b:syntastic_mode = "passive"
"augroup END
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let b:syntastic_mode = "active"
" === end syntastic =====
"
" === xolox/vim-easytags settings ===
" where to look for tags files
set tags=./tags;,~/.vimtags
" sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1
" === end vim-easytags ===
"
" === mujutsushi/tagbar settings ===
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)
" === end tagbar ===
"
" === airblade/vim-gitgutter settings ===
" Required after changing the colorscheme
hi clear SignColumn
" In vim-airline, only display 'hunks' if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1
" === end vim-gitgutter ===
"
" === tpope/vim-fugitive settings ===
map <C-b> :Gblame<CR>
" === end tpope/vim-fugitive ===
"
" === raimondi/delemitmate settings ===
let delimitMate_expand_cr = 1
augroup mydelimitMate
	au!
	au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
	au FileType tex let b:delimitMate_quotes = ""
	au FileType text let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
	au FileType python,php let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END
"
"===============================
"
" === autocompletion ===
"
" === end autocompletion ===
"
" native VIM configs =======
" shortcut tab navigation of ctrl+t+direction
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>


" ======= General Settings ======
set backspace=indent,eol,start "allow backspacing over anything in insert mode
set ruler
set number
set showcmd
set incsearch
set hlsearch

syntax on
set mouse=a
set background=dark
colorscheme materialbox "badwolf
"let g:molokai_original = 1
let g:rehash256 = 1
filetype plugin indent on

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set clipboard=unnamedplus " this allows y & p between multiple vim windows
set autoindent " always set autoindenting on
set autowrite " save on buffer switch
set smartcase "ignore case if search pattern is all lowercase


" ======== Laravel Specific Configs =============
" Abbreviations
abbrev pft PHPUnit_Framework_TestCase

abbrev gm !php artisan generate:model
abbrev gc !php artisan generate:controller
abbrev gmig !php artisan generate:migration

" Laravel framework commons
nmap <leader>lr :e app/routes.php<cr>
nmap <leader>lca :e app/config/app.php<cr>81Gf(%O
nmap <leader>lcd :e app/config/database.php<cr>
nmap <leader>lc :e composer.json<cr>

" Concept - load underlying class for Laravel
function! FacadeLookup()
    let facade = input('Facade Name: ')
    let classes = {
\       'Form': 'Html/FormBuilder.php',
\       'Html': 'Html/HtmlBuilder.php',
\       'File': 'Filesystem/Filesystem.php',
\       'Eloquent': 'Database/Eloquent/Model.php'
\   }

    execute ":edit vendor/laravel/framework/src/Illuminate/" . classes[facade]
endfunction
nmap <leader>lf :call FacadeLookup()<cr>

" Prepare a new PHP class
function! Class()
    let name = input('Class name? ')
    let namespace = input('Any Namespace? ')

    if strlen(namespace)
        exec 'normal i<?php namespace ' . namespace . ';
    else
        exec 'normal i<?php
    endif

    " Open class
    exec 'normal iclass ' . name . ' {^M}^[O^['

    exec 'normal i^M    public function __construct()^M{^M ^M}^['
endfunction
nmap <leader>1  :call Class()<cr>

" Add a new dependency to a PHP class
function! AddDependency()
    let dependency = input('Var Name: ')
    let namespace = input('Class Path: ')

    let segments = split(namespace, '\')
    let typehint = segments[-1]

    exec 'normal gg/construct^M:H^Mf)i, ' . typehint . ' $' . dependency . '^[/}^>O$this->^[a' . dependency . ' = $' . dependency . ';^[?{^MkOprotected $' . dependency . ';^M^[?{^MOuse ' . namespace . ';^M^['

    " Remove opening comma if there is only one dependency
    exec 'normal :%s/(, /(/g'
endfunction
nmap <leader>2 :call AddDependency()<cr>

" ========= end laravel specific configs =========

