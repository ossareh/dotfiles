Dotfiles
========

Using the dotfiles from pythons pip repo

### to add files:

`dotfiles --add ~/.vimrc`

### to sync

`dotfiles --sync`

Exceptions
==========

`cdmrc` should be put in `/etc/cdmrc`
Once `awesome` is linked into `~/` you then need to symlink it to `~/.config/awesome`

TO-DO
=====

 + emacs should highlight lines with trailing whitespace #editor
 + use pacman aliases from the arch linux docs #os
 + fix awesome client resizing #os #windowmanager
 + build notify.us #projects
 + get clipboard working between browser, terminal and editor
   #os #editor
 + learn how to paste using urxvt #terminal
 + make terminal not capture certain paredit commands
   (paredit-splice-sexp) #editor #terminal 
