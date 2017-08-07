HUGO_VERSION ?= 0.19

install:
	if [ ! -a .bin/hugo ] ; \
	then \
		mkdir -p .bin ; \
		cd .bin ; \
		curl -L https://github.com/spf13/hugo/releases/download/v$(HUGO_VERSION)/hugo_$(HUGO_VERSION)_Linux-64bit.tar.gz | tar zx  ; \
		mv hugo_$(HUGO_VERSION)_linux_amd64/hugo_$(HUGO_VERSION)_linux_amd64 hugo ; \
		rm -r hugo_$(HUGO_VERSION)_linux_amd64 ; \
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
	DIR=$(dirname "$0")

	cd $DIR/..

	if [[ $(git status -s) ]] ; \
	then \
    	echo "The working directory is dirty. Please commit any pending changes." \
    	exit 1; \
	fi;

	echo "Deleting old publication"
	rm -rf public
	mkdir public
	git worktree prune
	rm -rf .git/worktrees/public/

	echo "Checking out gh-pages branch into public"
	git worktree add -B gh-pages public upstream/gh-pages

	echo "Removing existing files"
	rm -rf public/*

	echo "Generating site"
	./hugo

	echo "Updating gh-pages branch"
	cd public && git add --all && git commit -m "Publishing to gh-pages..."

.PHONY: install clean build serve
