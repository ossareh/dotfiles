;; set up marmalade package repo
(require 'package)
;; TODO: combine these into a (dolist (x repos))
(defvar repos '(("marmalade" . "http://marmalade-repo.org/packages/")
                ("melpa" . "http://melpa.milkbox.net/packages/")
                ("gnu" . "http://elpa.gnu.org/packages/")))
(dolist (r repos)
  (add-to-list 'package-archives r t))
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
                      cider
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
                      whitespace-cleanup-mode
                      rainbow-delimiters
                      go-autocomplete
                      go-direx
                      go-eldoc
                      go-errcheck
                      go-mode
                      golint)
  "A list of packages to be installed at startup")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; disable the line highlight
(remove-hook 'prog-mode-hook 'esk-turn-on-hl-line-mode)
(remove-hook 'prog-mode-hook 'esk-turn-on-idle-highlight-mode)

;; disable arrow keys
(require 'no-easy-keys)
(no-easy-keys 1)

;; setup auto modes
(defvar my-filemodes '(("\\.rabl$" . ruby-mode)
                       ("\\.pp$" . puppet-mode)
                       ("\\.md$" . markdown-mode)))

(dolist (filemode my-filemodes)
  (add-to-list 'auto-mode-alist filemode))


;; always display column number
(column-number-mode 1)

;; solarized colour theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/theme")
(require 'color-theme)
(load-theme 'solarized-dark t)

;; clojure setup
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
