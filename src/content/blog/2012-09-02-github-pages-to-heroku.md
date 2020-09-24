+++
aliases = ["2012/09/02/Github-Pages-to-Heroku.html"]
date = "2012-09-02T00:00:00Z"
title = "Github Pages to Heroku"
slug = "github-pages-to-heroku"
+++
# Synopsis

My initial goal was to put my jekyll website on Heroku but I have encountered many problems due of my bad Ruby level and ``pygment`` usage.

During month my jekyll website was freely hosted by __GitHub Pages__. Thanks for all the fish. But __GitHub__ is not for app hosting.

Many hours of:

> "What the fuck I have 404 ?"
> "Oh Damn it my local Jekyll render it correctly and not on Github..."
> "Ohh enough, it was just the yaml header with quotes which give me fucking 404"

# Idea

I think it's important to use local rendering to be sur of it and don't have surprise after deployment.

* ``www.socketubs.net`` is a github repo (not Github Page)
* ``www.socketubs.net/_site`` is a Heroku repo (Html app ([see][1]))
* ``www.socketubs.net/make.sh`` is a little bash script which do all the job

Jekyll is rendered locally, hosted on Heroku, backuped on Heroku and Github for versionning.

By the way you can see a ``404.html`` page.

<script src="https://gist.github.com/toxinu/c65ffc587a72b62b1df53ddfba98374f.js"></script>

# Finally

And finally we have this workflow:

* Write your articles
* `./make run`
* `./make open`
* See local version and online version
* Correct if you want
* `./make deploy`

Your Github repo will be updated and heroku will received new website version.

[1]: http://kennethreitz.com/static-sites-on-heroku-cedar.html
