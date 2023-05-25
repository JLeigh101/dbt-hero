{% macro no_nulls_in_columns(model)%} /* takes in any model as an argument */
    SELECT * FROM {{model}} WHERE
    {% for col in adapter.get_columns_in_relation(model) -%} /* adapter is a jinja function, the hyphen denote removing (trimming) whitespaces for cleaner input to the query */
        {{ col.column }} IS NULL OR                 /* iterates through the columns and checks for NULL OR ... */
        {% endfor %}
    FALSE                                           /* allows loop to end aka creates valid SQL statement */
{% endmacro %}