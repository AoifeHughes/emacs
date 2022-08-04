(global-set-key (kbd "<f8>") 'golden-ratio)    ; F7 F8
(global-set-key (kbd "C-+") 'magit-status)
(global-set-key (kbd "C-f") 'helm-projectile)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x a") 'helm-for-files)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-i") 'helm-imenu)
(global-set-key (kbd "C-s") 'swiper-helm)
(global-set-key (kbd "H-.") 'flyspell-correct-at-point )
(customize-set-variable 'helm-ff-lynx-style-map t)
(global-set-key [C-tab] 'ace-jump-word-mode)


(defun my-reftex-hook ()
  (define-key reftex-mode-map (kbd "C-c [") 'helm-bibtex-with-local-bibliography))


(add-hook 'reftex-mode-hook 'my-reftex-hook)



(require 'multiple-cursors)
(global-set-key (kbd "C-.") 'mc/mark-next-like-this)
(global-set-key (kbd "C->") 'mc/skip-to-next-like-this)
(global-set-key (kbd "C-c m l") 'mc/edit-lines)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(define-key mc/keymap (kbd "<return>") nil)

(global-set-key [M-up] 'move-line-up)
(global-set-key [M-down] 'move-line-down)

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(eval-after-load "flyspell"
  '(progn
     (define-key flyspell-mode-map (kbd "C-.") nil)
     (define-key flyspell-mode-map (kbd "C-,") nil)
     ))
