(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

(defun my/disable-scroll-bars (frame)
  (modify-frame-parameters frame
                           '((vertical-scroll-bars . nil)
                             (horizontal-scroll-bars . nil))))
(add-hook 'after-make-frame-functions 'my/disable-scroll-bars)

(defun company-yasnippet-or-completion ()
  "Solve company yasnippet conflicts."
  (interactive)
  (let ((yas-fallback-behavior
         (apply 'company-complete-common nil)))
    (yas-expand)))



(defun aoife/note ()
  (interactive)
  (find-file  (concat "~/OneDrive - The Alan Turing Institute/Notes/" (format-time-string "General/%Y/%m/%W.org" )))
  )


;; Creates a new file for a diary entry into phd progress!
(defun aoife/new-phd-diary ()
  "This function can be used to create an org file with today as it's file name."
  (interactive)
  (find-file  (concat "~/PHD/Notes/" (format-time-string "phd-diaries/%Y/%m/%W.org" )))
  (insert
   (format
    "#+TITLE: %s
#+AUTHOR: Aoife Hughes
#+INCLUDE: \"./preamble.org\" :minlevel 1

* Tasks

 bibliography:../../../library.bib
 bibliographystyle:plainnat
 " "PhD Diary" ) ) )


(defun aoife/find-phd-diary ()
  (interactive)
  (find-file  (concat "~/PHD/Notes/" (format-time-string "phd-diaries/%Y/%m/%W.org" ))))


(defun friday-talks ()
  "This function can be used to create an org file with today as it's file name."
  (interactive)
  (find-file  (concat "~/PHD/Notes/" (format-time-string "friday-seminar-%Y-%W.org" ))))

(defun aoife/save-report ()
  "Exports a tex version of the report document"
  (interactive)
  (setq aoife/last-buffer (current-buffer))
  (find-file "~/PHD/Probation/report.org")
  (org-latex-export-to-latex)
  (switch-to-buffer aoife/last-buffer)
  (shell-command "texcount report.tex | grep 'Words'"))

(defun aoife/run-compile ()
  "runs a nice commands to constantly build on change my report"
  (interactive)
  (async-shell-command "cd ~/PHD/Probation/; latexmk -pdflatex='lualatex -shell-escape -interaction nonstopmode' -pdf -f report.tex --synctex=1 -pvc -view=none")
  )

(defun aoife/save-presentation ()
  "Exports a tex version of the report document"
  (interactive)
  (org-beamer-export-to-latex)
)

(defun aoife/run-compile ()
  "runs a nice commands to constantly build on change my report"
  (interactive)
  (async-shell-command "cd ~/PHD/Probation/; latexmk -pdflatex='lualatex -shell-escape -interaction nonstopmode' -pdf -f report.tex --synctex=1 -pvc -view=none")
  )

(defun aoife/run-compile-presentation ()
  "runs a nice commands to constantly build on change my report"
  (interactive)
  (async-shell-command "cd ~/PHD/Documents/Presentations/project_update_beamer/September; latexmk -pdflatex='lualatex -shell-escape -interaction nonstopmode' -pdf -f presentation.tex --synctex=1 -pvc -view=none")
  )

