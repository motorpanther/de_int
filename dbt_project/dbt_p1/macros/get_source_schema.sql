{% macro get_source_schema(env_name) %}
    {{ return(env_name ~ '_landing') }}
{% endmacro %}