.PHONY: install

install:
	sudo apt install silversearcher-ag aspell aspell-pl aspell-en
	pip install --user elpy isort pyflakes jedi markdown2
	emacs --batch --eval '(load-file "~/.emacs.d/init.el")'
