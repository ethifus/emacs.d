BIN=~/.local/bin

.PHONY: install install-os-deps install-symlinks install-packages

install-os-deps:
	sudo apt install silversearcher-ag aspell aspell-pl aspell-en
	pip install --user elpy isort pyflakes jedi markdown2

install-symlinks:
	mkdir -p ${BIN}
	ln -s $(shell pwd)/bin/ec ${BIN}/ec
	ln -s $(shell pwd)/bin/es ${BIN}/es
	ln -s $(shell pwd)/bin/et ${BIN}/et

install-packages:
	emacs --batch --eval '(load-file "~/.emacs.d/init.el")'

install: install-os-deps install-symlinks install-packages

uninstall:
	rm -f ${BIN}/ec ${BIN}/es ${BIN}/et
