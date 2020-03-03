;;; private/lsp-improved/autoload.el -*- lexical-binding: t; -*-

;;;###autoload
(defvar +conda--env nil)

;;;###autoload
(defun +python-conda-env-set-auto-h ()
  "Set conda env from buffer-local variable."
  (when (eq major-mode 'python-mode)
    (when (not (local-variable-p '+conda--env))
      (make-local-variable '+conda--env)
      (setq +conda--env (+python-read-conda-env-from-file)))
    (if +conda--env
        (pyvenv-workon +conda--env))))

;;;###autoload
(defun +python-read-conda-env-from-file ()
  "Read conda env from .conda-env file."
  (when-let (root-path (projectile-locate-dominating-file default-directory ".conda-env"))
    (let* ((file-path (expand-file-name ".conda-env" root-path))
           (conda-env
            (with-temp-buffer
              (insert-file-contents-literally file-path)
              (string-trim (buffer-string)))))
      conda-env)))
