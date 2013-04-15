
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
                      haskell-mode
                      ac-nrepl
                      align-cljlet
                      clojure-mode
                      clojure-project-mode
                      clojure-test-mode
                      nrepl)
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
(load-theme 'solarized-dark t) ;; TODO: colors are so slightly off

;; disable arrow keys
(require 'no-easy-keys)
(no-easy-keys 1)
