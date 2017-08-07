+++
aliases = ["2014/12/29/restless-filtering-and-ordering.html"]
date = "2014-12-29T00:00:00Z"
title = "Filtering and ordering with Restless"

+++
Let's continue with my [previous blog post][0] on [Restless][1] introduction with [Django][2].
Today I'll show you two quick and simple [Mixins][3] for Restless. One for **filtering** and another for **ordering**.

I won't show you how to create Django app, models, etc. This is not the subject.

Just to be clear, I have this `models.py` for our Pizza shop.

{{< highlight python >}}
from django.db import models


class Pizza(models.Model):
    name = models.CharField(max_length=100)
    price = models.FloatField()
    is_vegetarian = models.BooleanField(default=False)


class Ingredient(models.Model):
    name = models.CharField(max_length=100)


class PizzaIngredient(models.Model):
    pizza = models.ForeignKey('Pizza', related_name='ingredients')
    ingredient = models.ForeignKey('Ingredient')
{{< /highlight >}}


And my `resources.py`:

{{< highlight python >}}
from restless.dj import DjangoResource
from restless.preparers import FieldsPreparer

from .models import Pizza


class PizzaResource(DjangoResource):
    preparer = FieldsPreparer(fields={
        'id': 'id', 'name': 'name'})

    def list(self):
        return Pizza.objects.all()
{{< /highlight >}}


## Filtering

We are building a very simple and not complete `APIFilterMixin` class.

{{< highlight python "linenos=inline,hl_lines=9">}}
class APIFilterMixin:
    allowed_fields_filter = []

    def filter(self, queryset):
        filters = {}
        for arg in self.request.GET:
            if arg in self.allowed_fields_filter:
                filters.update({arg: self.request.GET.get(arg)})
        return queryset.filter(**filters)
{{< /highlight >}}

As you can see `allowed_fields_filter` allow us to put filters (with lookup) that we want to authorize on our `Resource`.

This mixin only expose a single `filter` method which take one argument, a `QuerySet` instance.

At line 6 we just iterate over all request arguments, check if this argument is in `allowed_fields_filter`, update `filters` dictionary and at (*line 9*), we unpack filters in a `filter` method.

And this is updated revision of our previous `resources.py` with new mixin:

{{< highlight python >}}
class PizzaResource(APIFilterMixin, DjangoResource):
    preparer = FieldsPreparer(fields={
        'id': 'id', 'name': 'name'})
    allowed_fields_filter = [
        'name', 'name__startswith',
        'price', 'price__lte', 'price__gte',
        'ingredients__ingredient__name']

    def list(self):
        qs = Pizza.objects.all()
        return self.filter(qs)
{{< /highlight >}}

We can now give all filters we have allowed in `allowed_fields_filter`, including relation lookups.

## Ordering

Ordering is even more simple than filtering. Look how restless allow us to cleanly create our minimal [API][4].

{{< highlight python "linenos=inline,hl_lines=10" >}}
class APIOrderingMixin:
    allowed_fields_ordering = []
    ordering_field = 'order_by'

    def ordering(self, queryset):
        order_by = self.request.GET.get(self.ordering_field)
        if not order_by:
            return queryset

        if order_by.split('-')[-1] in self.allowed_fields_ordering:
            return queryset.order_by(order_by)

        return queryset
{{< /highlight >}}

This mixin support custom ordering field name with `ordering_field`. We can allow fields we want with `allowed_fields_ordering`.
Another simple but cool feature is reverse ordering support (*line 10*).

Just add `APIOrderingMixin` to your `PizzaResource` and here we go.

Happy programming everybody!

[0]: {{< relref "2014-11-28-restless-presentation-and-pagination.md" >}}
[1]: https://github.com/toastdriven/restless
[2]: https://www.djangoproject.com/
[3]: http://en.wikipedia.org/wiki/Mixin
[4]: http://en.wikipedia.org/wiki/Application_programming_interface
