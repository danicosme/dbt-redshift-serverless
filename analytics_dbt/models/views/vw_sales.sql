WITH source_sales as (
    select *
    from tickit.sales
),
renamed as (
    SELECT
         SALESID AS ID_VENDA
        ,LISTID AS ID_LISTA
        ,BUYERID AS ID_COMPRADOR
        ,DATEID AS ID_DATE
        ,SALETIME AS DATA_VENDA
    FROM source_sales
)
SELECT * FROM renamed