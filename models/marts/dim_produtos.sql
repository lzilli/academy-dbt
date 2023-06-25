with
    produtos as(
        select *
        from {{ ref('stg_sap__produtos') }}

    )
, transformacoes as (
    select
        row_number() over (order by id_produto) as sk_produto
        , *
    from produtos
)
select *
    from transformacoes
