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
                      starter-kit-bindings
                      starter-kit-ruby
                      starter-kit-js
                      no-easy-keys
                      color-theme
                      auto-complete
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
                      go-autocomplete
                      go-direx
                      go-eldoc
                      go-errcheck
                      golint
                      go-mode
                      go-projectile
                      go-snippets
                      helm
                      helm-projectile
                      helm-go-package
                      lua-mode
                      magit
                      markdown-mode
                      org
                      org-projectile
                      paredit
                      projectile
                      puppet-mode
                      whitespace-cleanup-mode
                      rainbow-delimiters
                      terraform-mode)
  "A list of packages to be installed at startup")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; disable the line highlight
(remove-hook 'prog-mode-hook 'esk-turn-on-hl-line-mode)
(remove-hook 'prog-mode-hook 'esk-turn-on-idle-highlight-mode)
(add-hook 'prog-mode-hook #'yas-minor-mode)

;; disable arrow keys
(require 'no-easy-keys)
(no-easy-keys 1)

;; helm setup
(global-set-key (kbd "M-x") 'helm-M-x)
(helm-mode 1)

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

;; render tabs as two spaces in gomode
(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook
          (lambda ()
            (setq default-tab-width 2)))

;; auto complete setup
(global-auto-complete-mode 1)
(put 'narrow-to-region 'disabled nil)
