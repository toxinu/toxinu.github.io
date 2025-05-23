build:
	./hugo --minify -s src

serve:
	./hugo -s src serve

publish:
	if [[ `git status -s` ]]; then  \
    	echo "The working directory is dirty. Please commit any pending changes."; \
    	exit 1; \
	fi

	echo "Removing existing files"
	find .
	find . | grep -v 'src\|Makefile\|.git\|.' | xargs -r rm -r

	echo "Generating site"
	./hugo -s src

	echo "Updating gh-pages branch"
	git add . && git commit -m "Publishing a new print..."
	git push

.PHONY: build serve
