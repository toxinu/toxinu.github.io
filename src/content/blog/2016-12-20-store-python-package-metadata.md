+++
aliases = ["2016/12/20/store-python-package-metadata.html"]
date = "2016-12-20T00:00:00Z"
title = "How to store your Python package metadata"
slug = "how-to-store-your-python-package-metadata"
+++
A small, but full of snippets, post about how to store your package metadata cleanly.

Let's define a simple layout.

<script src="https://gist.github.com/toxinu/1d11ec668a057a871720bf8d7946829a.js"></script>

All your metadata lives in `__about__.py` like that:

<script src="https://gist.github.com/toxinu/5ef6f5e67bd496f430ca5850b536aef4.js"></script>

Expose all your metadata at package root.

<script src="https://gist.github.com/toxinu/96abf6963e0009648b6b4d62fa4a6e23.js"></script>

This setup allow you to avoid editing your `setup.py` too frequently and keep it up to date easily.

<script src="https://gist.github.com/toxinu/8059bdcc1e868a1237c692913df2209b.js"></script>

Happy coding and don't eat too much turkeys!
