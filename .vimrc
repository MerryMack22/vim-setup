set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"
" NERDTree ==================
Plugin 'scrooloose/nerdtree'
" This creates a keyboard shortcut for NERDTree (Ctrl+t)
map <C-t> :NERDTreeToggle<CR>
map <C-r> :NERDTreeRefreshRoot<CR>
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
Plugin 'jistr/vim-nerdtree-tabs'
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" To have NERDTree always open on startup
"let g:nerdtree_tabs_open_on_console_startup = 1
"
" end NERDTree tabs ======
"
" === Xuyuanp/nerdtree-git-plugin settings ===
Plugin 'Xuyuanp/nerdtree-git-plugin'
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
Plugin 'vim-airline/vim-airline' " <- statusbar at bottom
Plugin 'vim-airline/vim-airline-themes' " <- themes for statusbar
" always show statusbar
set laststatus=2
"let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" === end vim-airline ====
"
" === dense-analysis/ale ===
" enable completion when available
let g:ale_completion_enabled = 1 " <- must be loaded before ALE???
Plugin 'dense-analysis/ale' " <- async syntax
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
" formatting for echo'd error messages
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" enable hover ballons for errors
let g:ale_set_balloons=1
" === end dense-analysis/ale ===
"
" === ludovicchabant/vim-gutentags ===
Plugin 'ludovicchabant/vim-gutentags' " <- more effecient tag generation?
" show when tags are being generated in statusline
"set statusline+=%{gutentags#statusline()}
function! s:get_gutentags_status(mods) abort
  let l:msg = ''
  if index(a:mods, 'ctags') >= 0
    let l:msg .= '♨'
  endif
  if index(a:mods, 'cscope') >= 0
    let l:msg .= '♺'
  endif
  return l:msg
endfunction

:set statusline+=%{gutentags#statusline_cb(
      \function('<SID>get_gutentags_status'))}
" === end ludovicchabant/vim-gutentags ===
"
" === mujutsushi/tagbar settings ===
Plugin 'majutsushi/tagbar' " <- tag pane at right of window
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)
" === end tagbar ===
"
" === airblade/vim-gitgutter settings ===
Plugin 'airblade/vim-gitgutter'
" Required after changing the colorscheme
hi clear SignColumn
" In vim-airline, only display 'hunks' if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1
" === end vim-gitgutter ===
"
" === tpope/vim-fugitive settings ===
Plugin 'tpope/vim-fugitive'
map <C-b> :Gblame<CR>
" === end tpope/vim-fugitive ===
"
" === raimondi/delemitmate settings ===
Plugin 'Raimondi/delimitMate' " <- creates closing brackets/parentesis/et c.
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
" === tpope/vim-surround ===
Plugin 'tpope/vim-surround'
" not any config to be done here, just some notes
" in normal mode:
" ds<character> <- delete surroundings
"   "Hello world" -> ds" -> Hello world
"
" cs<find><replace> <- replace surrounding
"   [123+456] -> cs]) -> (123+456)
"   "Look, I'm HTML!" -> cs"<q> -> <q>Look, I'm HTML!</q>
"
" in visual mode:
" S<something> <- create surrounding what has been selected
"   Hello world -> S<p class="important"> -> <p class="important>
"                                              Hello world
"                                            </p>
" === end tpope/vim-surround ===
"
" === ctrlpvim/ctrlp.vim ===
Plugin 'ctrlpvim/ctrlp.vim' " <- full path fuzzy file,buffer,mru,tag,et c. finder
let g:ctrlp_tabpage_position = 'ac'
let g:ctrlp_show_hidden = 1 " <- scans for .files and .dirs
" Should allow pressing enter to open in new tab
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<C-e>'],
    \ 'AcceptSelection("t")': ['<Cr>'],
    \}
" === end  ===
"
" === extras ===
Plugin 'flazz/vim-colorschemes' " <- Themes

Plugin 'leafgarland/typescript-vim' " <- typescript syntax
Plugin 'ervandew/supertab' " <- autocompletion
Plugin 'vim-scripts/HTML-AutoCloseTag'
Plugin 'xolox/vim-misc'
Plugin 'tpope/vim-commentary' " <- commenting extras (block comments, mass comments, et c.)
Plugin 'vim-vdebug/vdebug' " <- xdebug support REQUIRES COMPILATION WITH PYTHON3 SUPPORT
Plugin 'chrisbra/csv.vim' " <- csv extras
" === end extras ===
"
" ======== Laravel Specific Configs =============
"
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
    exec "normal i<?php namespace " . namespace . ";\<C-m>\<C-m>"
  else
    exec "normal i<?php \<C-m>"
  endif

  " Open class
  exec "normal iclass " . name . " {\<C-m>}\<C-[>O\<C-[>"

  exec "normal i\<C-M>public function __construct()\<C-M>{\<C-M>\<C-M>}\<C-[>"
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
"
"
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

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set clipboard=unnamedplus " this allows y & p between multiple vim windows
set autoindent " always set autoindenting on
set autowrite " save on buffer switch
set smartcase "ignore case if search pattern is all lowercase

set list
set listchars=tab:▸\ ,trail:¬

hi Normal guibg=NONE ctermbg=NONE
"^^^ this sets the background transparent (shows terminal background color or
"if terminal is transparent, then is also transparent)
