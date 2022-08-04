
;; (org-defkey org-mode-map [(meta return)] 'org-meta-return)


(use-package org
  :bind (:map spacemacs-org-mode-map-root-map ("M-RET" . nil)))

(setq org-src-preserve-indentation t)

(setq org-confirm-babel-evaluate nil)
(setq org-latex-listings 'minted
      org-latex-packages-alist '(("" "minted"))
      org-latex-pdf-process (quote ("latexmk -pdflatex='lualatex -shell-escape -interaction nonstopmode' -pdf -f  %f --synctex=1")))


(add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)
(setq org-export-babel-evaluate nil)
(custom-set-faces
 '(org-level-1 ((t (:inherit outline-1 :height 2.0))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.5))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.2))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.1))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.0)))))



(add-hook 'org-mode-hook
          (lambda () (electric-indent-mode -1)))
(add-hook 'org-mode-hook
          (lambda () (electric-indent-local-mode -1)))

(add-hook 'org-mode-hook 'org-in-src-block-p nil :local)

(add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)

(require 'org-ref)
(setq org-latex-prefer-user-labels t)
(define-key org-mode-map (kbd "C-c i") 'org-ref-helm-insert-ref-link)
(setq reftex-default-bibliography '("~/PHD/Notes/library.bib"))
(setq org-ref-default-bibliography '("~/PHD/Notes/library.bib"))

(defun display-latex-fragments-in-buffer ()
  "This will properly display all fragments in org-mode >9"
  (interactive)
  (let ((current-prefix-arg '(16)))
    (call-interactively 'org-preview-latex-fragment))
  )

;; Turn on languages for org mode
(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (python . t)
   (plantuml .t)
   (latex . t)))

(setq org-image-actual-width 400)
