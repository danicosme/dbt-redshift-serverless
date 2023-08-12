WITH sales as (
    SELECT *
    FROM {{ref('vw_sales')}}
)
, compradores as (
    SELECT
        (firstname || ' ' || lastname) as nome_completo
        ,userid
    FROM tickit.users
)
, top_10_compradores as (
    SELECT
        compradores.nome_completo
        ,sum(sales.QUANTIDADE_VENDIDA) as venda_total
        ,sales.COMISSAO
    FROM sales
    JOIN compradores
    ON sales.ID_COMPRADOR = compradores.userid
    GROUP BY compradores.userid, compradores.nome_completo, sales.COMISSAO
    ORDER BY venda_total DESC
    LIMIT 10
)
SELECT *
FROM top_10_compradores