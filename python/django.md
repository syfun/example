# Django

## django-extensions

Generate (and view) a graphviz graph of app models:

```
$ python manage.py graph_models -a -o myapp_models.png
```

Produce a tab-separated list of (url_pattern, view_function, name) tuples for a project:

```
$ python manage.py show_urls
```

Check templates for rendering errors:

```
$ python manage.py validate_templates
```

Run the enhanced django shell:

```
$ python manage.py shell_plus
```

Run the enhanced django runserver, (requires Werkzeug install):
```
$ python manage.py runserver_plus
```

## Fake and Factory for test

[faker](https://github.com/joke2k/faker)库随机生成单个字段，[factory-boy](http://factoryboy.readthedocs.io/en/latest/)创建了整个`model`.

```
class DeviceFactory(DjangoModelFactoryBase):
    class Meta:
        model = models.Device

    name = factory.Sequence(lambda n: f'Device #{n}')
    uuid = fake.uuid4()
    location = fake.address()
    online = fake.boolean()
    license = factory.SubFactory(LicenseFactory)
    company = factory.SubFactory(CompanyFactory)
    group = factory.SubFactory(DeviceGroupFactory)
```
`faker`可以自定义`providers`

```
from faker.providers import BaseProvider

class FRMSProvider(BaseProvider):
    def role(self):
        return 'Role ' + str(uuid4())

    def group(self):
        return 'Group ' + str(uuid4())

    def company(self):
        return 'Company ' + str(uuid4())

    def license(self):
        return random.choice([t.value[0] for t in LicenseType])

    def device_group(self):
        return 'Device Group ' + str(uuid4())

    def device(self):
        return 'Device ' + str(uuid4())
```

带有时区的时间fake

```
from django.utils import timezone

expired_at = fake.date_time(tzinfo=timezone.utc)
```

## django-filter

```
class MemberFilterSet(filters.FilterSet):
    ORDER_BY_CHOICES = (("date", "date"),
                        ("-date", "date reverse"),                       ("time_in", "time_in"),
                        ("-time_in", "time_in reverse"),
                        ("time_out", "time_out"),
                        ("-time_out", "time_out reverse"))

    search = filters.CharFilter(method="fuzzy_search",
                                help_text="fuzzy search, "
                                          "search for member name, member_id and email")
    name = filters.CharFilter(lookup_expr="icontains")
    is_active = filters.BooleanFilter()
    group = filters.CharFilter(name="groups__id")
    order_by = serializers.ChoiceField(default="-date", choices=ORDER_BY_CHOICES)
    

    class Meta:
        model = Member
        fields = []

    def fuzzy_search(self, queryset, name, value):  # pylint: disable=unused-argument
        q = Q(name__icontains=value) | Q(member_id__icontains=value) | Q(email__icontains=value)
        return queryset.filter(q).all()
```