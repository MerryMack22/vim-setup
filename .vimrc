set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Plugin for project navigation
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'bling/vim-airline'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
" --- git plugins----
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
" -------------------
Plugin 'Raimondi/delimitMate' " <- creates closing brackets/parentesis/et c.
"
Plugin 'vim-syntastic/syntastic' " <- should do marks for syntax issues
"
" === extras ===
Plugin 'vim-scripts/HTML-AutoCloseTag'


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
map <C-n> :NERDTreeToggle<CR>
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
"
" native VIM configs =======
" shortcut tab navigation of ctrl+t+direction
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>


" ======= General Settings ======
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch

syntax on
set mouse=a

colorscheme solarized
"let g:molokai_original = 1
let g:rehash256 = 1
filetype plugin indent on

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
