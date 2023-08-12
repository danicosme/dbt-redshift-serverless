WITH source_sales as (
    select *
    from tickit.sales
),
renamed as (
    SELECT
         SALESID                                        AS ID_VENDA
        ,LISTID                                         AS ID_LISTA
        ,BUYERID                                        AS ID_COMPRADOR
        ,DATEID                                         AS ID_DATE
        ,QTYSOLD                                        AS QUANTIDADE_VENDIDA
        ,PRICEPAID                                      AS VALOR_PAGO
        ,COMMISSION                                     AS COMISSAO
        ,TO_CHAR(SALETIME, 'dd/mm/yyyy HH24:MI:SS')     AS DATA_HORA_VENDA
        ,SALETIME::DATE                                 AS DATA_VENDA
        ,SALETIME::TIME                                 AS HORA_VENDA
    FROM source_sales
)
SELECT * FROM renamed