;; set up marmalade package repo
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

;; install things that may not be installed
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(starter-kit
                      starter-kit-lisp
                      starter-kit-bindings
                      starter-kit-ruby
                      starter-kit-js
                      no-easy-keys
                      color-theme
                      ac-nrepl
                      align-cljlet
                      clojure-mode
                      clojure-project-mode
                      clojure-test-mode
                      nrepl
                      auto-complete
                      project-mode
                      find-file-in-project
                      flymake
                      flymake-css
                      flymake-csslint
                      flymake-easy
                      flymake-go
                      flymake-haml
                      flymake-jslint
                      flymake-json
                      flymake-lua
                      flymake-puppet
                      flymake-python-pyflakes
                      flymake-ruby
                      flymake-shell
                      handlebars-mode
                      lua-mode
                      magit
                      markdown-mode
                      org
                      paredit
                      puppet-mode
                      whitespace-cleanup-mode)
  "A list of packages to be installed at startup")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; disable the line highlight
(remove-hook 'prog-mode-hook 'esk-turn-on-hl-line-mode)
(remove-hook 'prog-mode-hook 'esk-turn-on-idle-highlight-mode)

;; solarized colour theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/theme")
(require 'color-theme)
(load-theme 'solarized-dark t)

;; disable arrow keys
(require 'no-easy-keys)
(no-easy-keys 1)

;; setup auto modes
(add-to-list 'auto-mode-alist
             ;; tream rabl like ruby
             '("\\.rabl$" . ruby-mode)
             '("\\.pp$" . puppet-mode))

