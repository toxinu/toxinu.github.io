HUGO_VERSION ?= 0.26

install:
	if [ ! -a .bin/hugo ] ; \
	then \
		mkdir -p .bin ; \
		cd .bin ; \
		curl -L https://github.com/spf13/hugo/releases/download/v$(HUGO_VERSION)/hugo_$(HUGO_VERSION)_Linux-64bit.tar.gz | tar zx  ; \
		cd .. ; \
	fi; \
	if [ ! -f hugo ] ; \
	then \
		ln -s .bin/hugo hugo ; \
	fi;

clean:
	rm -r .bin
	rm hugo

build:
	./hugo

serve:
	./hugo serve

download-caddy:
	mkdir -p .bin/caddy
	cd .bin/caddy && curl -L "https://caddyserver.com/download/build?os=linux&arch=amd64&features=git%2Cminify" | tar zx
	cd ../..

publish:
	if [[ `git status -s` ]]; then  \
    	echo "The working directory is dirty. Please commit any pending changes."; \
    	exit 1; \
	fi

	echo "Removing existing files"
	rm -rf docs/*

	echo "Generating site"
	./hugo

	echo "Updating gh-pages branch"
	git add docs && git commit -m "Publishing a new print..."

.PHONY: install clean build serve
