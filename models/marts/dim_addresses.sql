with
    addresses as (
        select *
        from {{ ref('stg_sap__addresses') }}
    )

    , states as (
        select *
        from {{ ref('stg_sap__states') }}
    )

    , countries as (
        select *
        from {{ ref('stg_sap__countries') }}
    )
    
    
    , join_tabelas as (
        
        select
        addresses.address_id
        , addresses.address
        , addresses.city
        , states.state
        , states.stateprovince_code
        , states.countryregion_code
        
        
        from addresses 
        left join states on
            addresses.stateprovince_id = states.stateprovince_id
        
    )
    
   , transformacoes as (
    select
        row_number() over (order by address_id) as sk_address
        , *
    from join_tabelas
   )

select *
from transformacoes

