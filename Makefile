HUGO_VERSION ?= 0.17

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

.PHONY: install clean build serve
