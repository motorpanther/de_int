{% macro generate_schema_name(custom_schema_name, node) -%}
{# default macros overwrite #}
    {%- set default_schema = target.schema -%}
    {%- if not custom_schema_name or custom_schema_name | trim == '' -%}

        {{ default_schema }}

    {%- else -%}

        {{ custom_schema_name | trim }}

    {%- endif -%}

{%- endmacro %}