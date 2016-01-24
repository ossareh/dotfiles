Dotfiles
========

Using the dotfiles from pythons pip repo. To get started on a new
machine run bootstrap.sh (curl it, run it, it sets up ~/Dotfiles as
part of it while ensuring basics are available)

### to add files:

`dotfiles --add ~/.vimrc`

### to sync

`dotfiles --sync -f`

## Power Management

The script at `bin/lockscreen` relies on being able to call
`pm-suspend` with elevated privileges. To enable this you need the
following in `/etc/sudoers.d/power`:

```
%adm ALL=NOPASSWD: /usr/sbin/pm-suspend, \
		/usr/sbin/pm-suspend-hybrid, \
		/usr/sbin/pm-hibernate
```

Also make sure you're in the `adm` group.

TO-DO
=====

 + emacs should highlight lines with trailing whitespace #editor
 + build notify.us #projects
 + get clipboard working between browser, terminal and editor
   #os #editor
 + learn how to paste using urxvt #terminal
 + make terminal not capture certain paredit commands
   (paredit-splice-sexp) #editor #terminal 
