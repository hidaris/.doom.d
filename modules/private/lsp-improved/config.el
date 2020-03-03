;;; private/lsp-improved/config.el -*- lexical-binding: t; -*-

(use-package! pyvenv
  :after python
  :config
  (setenv "WORKON_HOME" (expand-file-name "~/miniconda3/envs/")))

(use-package! lsp
  :config
  (add-hook! 'python-mode-hook #'+python-conda-env-set-auto-h)
  (add-hook! 'doom-switch-buffer-hook #'+python-conda-env-set-auto-h))
