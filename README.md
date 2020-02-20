# vim-setup

This is my vim setup that I use on a day-to-day basis
To use this you must first install vundle which is a plugin manager for vim.<br>
To install, follow the directions at  http://github.com/VundleVim/Vundle.Vim and use my .vimrc instead of their
default or use the setupCustomVim.sh script to automate it.

To setup your vim using the setupCustomVim.sh script, all you need to do is run 
```
wget https://raw.githubusercontent.com/jrobinson52/vim-setup/master/setupCustomVim.sh
```
then make it executable with `chmod +x setupCustomVim.sh`. Running this script should check for all dependencies but in the event it doesn't work, ensure git, wget, vim, ctags (sometimes named exuberant-ctags), and gvim (sometimes named vim-gtk3) are installed.

# For Mac users:

You must add the following line to your .zshenv
`export SHELL=/bin/bash`

# Overview

This is just a high level overview of this setup. More specific notes can be found for git and laravel projects
in their respective files.

- fuzzy finder:
  use CTRL+p in Normal mode to activate the fuzzy finder at the bottom of the screen to search for files
  - To refresh (after adding or removing files) while the CTRL+p window is open press F5, this will trigger a
    rescan of the files available

- buffer tags:
  use '\' followed by 'b' in Normal mode to pull out the right side panel containing vairables, methods, 
  classes, and  namespaces (this depends on having ctags installed)

- tree view:
  to get a folder-style view of the project like you'd expect in Atom, VSCode, et c. use CTRL+t in Normal mode
  - Note: This tree's root will be in the directory you opened vim in. For performance reasons try to open it
    in your project's folder rather than the root of your home directory when using this to avoid performance
    issues
  - after adding or removing files you can refresh this view with CTRL+r

- bottom bar
  The bottom bar will tell you at lot of information. If you have an error on the line your cursor is on,
  the error message will appear here. You can also see what git branch you are on (if you get strange
  symbols then ensure you have a patched powerline font installed). You can also see what mode you are in
  (Normal, Visual, Insert, et c.) as well as the file type and language.

- basic usage:
  This setup doesn't break any native functionality of vim (minus remaping ctrl+r). You can still use the
  shell from wherever you've started vim by typing ':sh' in Normal mode. You can split your open tab with
  another file by typing ":split path/to/file" or ":vsplit path/to/file" in Normal mode

# A note on syntax linting
Linting only occurs when you return to Normal mode after being in Insert mode. To verify your code just
drop from insert mode to Normal mode and then your code will be linted. Errors from lints will remain marked on the left side of the file until the next linting.

# Keyboard shortcuts
## Standard
- git blame (normal mode)
  `ctrl+b`
- copy (normal/visual modes)
  `y`
- paste (normal/visual modes)
  `p`
- cut (normal/visual modes)
  `d`
- undo (normal mode)
  `u`
- select line(s) (normal mode)
  `Shift + v` (then arrow up/down to select more)
- comment line(s) (normal/visual mode)
  `g` followed by `c` (x2 if nothing is selected will comment line at cursor)
- toggle tag window (normal mode)
  `\` followed by `b`
- toggle tree view (normal mode)
  `Ctrl + t`
- refresh tree view (normal mode)
  `Ctrl + r`
- Toggle fuzzy finder (normal mode)
  `Ctrl + p`
- Refresh fuzzy finder (finder must be open)
  `F5`
- toggle bookmark on line
  `m` followed by `m`
- view all bookmarks
  `m` followed by `a`
## vdebug
- listen for connection
  `F5`
- add breakpoint
  `F10`
- run-to-cursor
  `F9`
- step over
  `F2`
- step in
  `F3`
- step out
  `F4`
- detatch
  `F7`
- stop/close
  `F6`
  
# Common commands
- `:sh` pause vim and drop to shell in vim's working directory (use `exit` to return to vim)
- `:!php artisan ...` run any artisan command from inside vim
- `:Git ...` run any git command (tab completion works here)
- `:help Vdebug` opens help window for Vdebug plugin
- `/searchString` this is case sensitive and will accept regex
