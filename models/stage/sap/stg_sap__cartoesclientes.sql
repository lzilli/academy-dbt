with
    fonte_cartoesclientes as(
        select 
        cast (businessentityid as int) as id_cliente_cartoescliente				
        , cast (creditcardid as int) as id_cartaocredito_cartoescliente				
        -- modifieddate
        from {{ source('sap', 'personcreditcard')}}
    )

select *
from fonte_cartoesclientes