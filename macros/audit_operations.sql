{% macro insert_audits(action_name) -%}

    insert into warehouse.dbt_audit(audit_type)
    values ('{{ action_name }}');

{%- endmacro %}