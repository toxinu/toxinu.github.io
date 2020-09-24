+++
aliases = ["2014/12/29/restless-filtering-and-ordering.html"]
date = "2014-12-29T00:00:00Z"
title = "Filtering and ordering with Restless"
slug = "filtering-and-ordering-with-restless"
+++
Let's continue with my [previous blog post][0] on [Restless][1] introduction with [Django][2].
Today I'll show you two quick and simple [Mixins][3] for Restless. One for **filtering** and another for **ordering**.

I won't show you how to create Django app, models, etc. This is not the subject.

Just to be clear, I have this `models.py` for our Pizza shop.

<script src="https://gist.github.com/toxinu/67504abbff4a0eefda4152e65c94e4c0.js"></script>

And my `resources.py`:

<script src="https://gist.github.com/toxinu/7f1c073ff66286bec7277bdf474f0b57.js"></script>

## Filtering

We are building a very simple and not complete `APIFilterMixin` class.

<script src="https://gist.github.com/toxinu/137663f558cd056449556caf300dd525.js"></script>

As you can see `allowed_fields_filter` allow us to put filters (with lookup) that we want to authorize on our `Resource`.

This mixin only expose a single `filter` method which take one argument, a `QuerySet` instance.

At line 6 we just iterate over all request arguments, check if this argument is in `allowed_fields_filter`, update `filters` dictionary and at (*line 9*), we unpack filters in a `filter` method.

And this is updated revision of our previous `resources.py` with new mixin:

<script src="https://gist.github.com/toxinu/6428eac21cb525e43884354d51f56605.js"></script>

We can now give all filters we have allowed in `allowed_fields_filter`, including relation lookups.

## Ordering

Ordering is even more simple than filtering. Look how restless allow us to cleanly create our minimal [API][4].

<script src="https://gist.github.com/toxinu/99912184adf4327c4e8699d0823c67ad.js"></script>

This mixin support custom ordering field name with `ordering_field`. We can allow fields we want with `allowed_fields_ordering`.
Another simple but cool feature is reverse ordering support (*line 10*).

Just add `APIOrderingMixin` to your `PizzaResource` and here we go.

Happy programming everybody!

[0]: {{< relref "2014-11-28-restless-presentation-and-pagination.md" >}}
[1]: https://github.com/toastdriven/restless
[2]: https://www.djangoproject.com/
[3]: http://en.wikipedia.org/wiki/Mixin
[4]: http://en.wikipedia.org/wiki/Application_programming_interface
