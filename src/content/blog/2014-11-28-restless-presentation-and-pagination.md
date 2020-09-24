+++
aliases = ["2014/11/28/restless-presentation-and-pagination.html"]
date = "2014-11-28T00:00:00Z"
title = "Restless for building Python RESTful API"
slug = "restless-for-building-python-restful-api"
+++
After trying to build RESTful API in Django with [Django Rest Framework][0], my friend [Pabluk][1] allow me to discover [Restless][2]. A very small code base Python module to build RESTful API.

I'm totally not a huge fan of [Django Rest Framework][0]. It's just to restricting if you don't make a 100% REST API, and this is often the case. First of all, you'll have a long progression period when you'll have a bad use of this framework. I think it's to complex while we try a build something simple. A RESTful API.

But, this is [Restless][2].
It has so small code base that it can fit to many web frameworks, like [Flask][3], [Pyramid][4], [Django][5], etc...

Let's try a [Django][5] integration.

#### Example

This is your existing `models.py`:

<script src="https://gist.github.com/toxinu/d125f613cf1ec679c7dba0cd54f8d7fd.js"></script>

You have to understand that your API will expose *Resources*, this is how many framework call it. Let's create a `resources.py`.

<script src="https://gist.github.com/toxinu/feee3461dd8cb0f9200a6586d9ca3275.js"></script>

And now just expose it through your `urls.py`:

<script src="https://gist.github.com/toxinu/7f3c36eedb1a785bc28e71c6a020bd65.js"></script>

This is quite simple, I won't explain you how to use `POST`, `PATCH`, etc... Just read [documentation][6].

But just leave me show you a simple mixin for pagination. Let's create a `mixins.py`, just as Django *Class Based View*.

<script src="https://gist.github.com/toxinu/e720b66f9e4e32ce565a74c5e57e00c7.js"></script>

You just have to update your `resources.py`:

<script src="https://gist.github.com/toxinu/28c57a79a60b5cd9ff51db96ae625fa2.js"></script>

And just enjoy your paginated Restful API.
This is why I love [Restless][2]. I agree to say that you'll write probably more code than [Django Rest Framework][0] but you'll get more control of all the magic your Restless API do.

[Restless][2] is very simple, modular and not restrictive. It's very close to KISS.

Another thing that I like, it's the easiness to read [Restless][2] source code like Django *Class Based Views*. Simple, re-usable.

> Simple is better than complex.

[0]: http://www.django-rest-framework.org/
[1]: http://seminar.io
[2]: https://github.com/toastdriven/restless
[3]: http://flask.pocoo.org/
[4]: http://www.pylonsproject.org/
[5]: https://www.djangoproject.com/
[6]: http://restless.readthedocs.org/en/latest/index.html
