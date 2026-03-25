{% set expected_counts = {
'cust': 50,
'employees': 20,
'stores': 10,
'suppliers': 5,
'products': 100,
'ordritms': 1000,
'ordr': 200
}
%}

{% for table, expected_count in expected_counts.items() %}
    select '{{table}}' as table_name,
        (select count(*) from {{ source('metadata', table )}}) as record_count,
        {{ expected_count}} as expected_count

        where (select count(*) from {{ source('metadata', table)}}) < {{ expected_count}}
        {%if not loop.last %} union all {% endif %}
{% endfor %}