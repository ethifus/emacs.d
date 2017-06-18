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

 * elpy (jedi, autopep8, pyflakes)
 * isort
 * markdown2
 * ispell (with Polish and English dictionaries)
 * silversearcher-ag
 * tern (for JavaScript editing)

Packages for ubuntu:

    sudo apt install silversearcher-ag aspell aspell-pl aspell-en

Python modules:

    pip install --user elpy isort pyflakes jedi markdown2

NodeJS modules:

    sudo npm install -g tern
