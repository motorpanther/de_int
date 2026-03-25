{% macro generate_schema_name_1(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}
    {%- if not custom_schema_name or custom_schema_name | trim == '' -%}

        {{ default_schema }}

    {%- else -%}

        {{ default_schema }}_{{ custom_schema_name | trim }}

    {%- endif -%}

{%- endmacro %}