with
    products as(
        select *
        from {{ ref('stg_sap__products') }}

    )
, transformacoes as (
    select
        row_number() over (order by product_id) as sk_product
        , *
    from products
)
select *
    from transformacoes
