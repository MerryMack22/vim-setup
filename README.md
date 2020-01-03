# vim-setup

This is my vim setup that I use on a day-to-day basis
To use this you must first install vundle which is a plugin manager for vim.<br>
To install, follow the directions at  http://github.com/VundleVim/Vundle.Vim and use my .vimrc instead of their
default or use the setupCustomVim.sh script to automate it.

# For Mac users:

You must add the following line to your .zshenv
`export SHELL=/bin/bash`

# Overview

This is just a high level overview of this setup. More specific notes can be found for git and laravel projects
in their respective files.

- fuzzy finder:
  use CTRL+p in Normal mode to activate the fuzzy finder at the bottom of the screen to search for files
  
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
