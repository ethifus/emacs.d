BIN=~/.local/bin

.PHONY: install

install:
	sudo apt install silversearcher-ag aspell aspell-pl aspell-en
	pip install --user elpy isort pyflakes jedi markdown2
	mkdir -p ${BIN}
	ln -s $(shell pwd)/bin/ec ${BIN}/ec
	ln -s $(shell pwd)/bin/es ${BIN}/es
	ln -s $(shell pwd)/bin/et ${BIN}/et
	emacs --batch --eval '(load-file "~/.emacs.d/init.el")'

uninstall:
	rm -f ${BIN}/ec ${BIN}/es ${BIN}/et
