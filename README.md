# emacs.d

My personal emacs configuration.

Main features:

 * Using [use-package](https://github.com/jwiegley/use-package).
 * Projectile.
 * Ido.
 * Magit.
 * Company for completion.
 * Org-mode.
 * Python.
 * JavaScript.

External requirements:

 * elpy, isort (jedi, autopep8, pyflakes - required by `init-python.el`),
 * markdown2,
 * ispell (with Polish and English dictionaries),
 * silversearcher-ag,
 * node.js, npm and tern (for JavaScript editing - required by `init-web.el`),
 * typescript and tide (for TypeScript editing - required by
   `init-web-typescript.el`),
 * libclang (for irony-mode - required by `init-irony.el`).

Packages for Ubuntu:

    sudo apt install silversearcher-ag aspell aspell-pl aspell-en

Python modules:

    pip install --user elpy isort pyflakes jedi markdown2

NodeJS modules:

    sudo npm install -g tern tide react@15.0

Optionally install `ditaa` to get diagrams in org-mode:

    sudo apt install ditaa
