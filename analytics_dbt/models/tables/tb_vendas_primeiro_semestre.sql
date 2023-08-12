-- Setando filtros de meses e ano com JINJA
{% set meses = ('JAN', 'FEB', 'MAR') %}
{% set ano = '2008' %}

-- Consulta
with source_date as (
    SELECT
        dateid  as id_date
        ,month  as mes
        ,year   as ano
    FROM tickit.date
)
, sales_date as (
    SELECT
        source_date.mes
        , sum(QUANTIDADE_VENDIDA) as QUANTIDADE_VENDIDA
    FROM {{ref('vw_sales')}} sales
    JOIN source_date
    ON sales.id_date = source_date.id_date
    WHERE source_date.mes in {{meses}}
    AND source_date.ano = {{ano}}
    GROUP BY source_date.mes
)
SELECT * FROM sales_date