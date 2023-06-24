with
    fonte_clientes as(
        select *
        from {{ source('sap', 'person')}}
    )
    , renomear as (
        select
            cast(businessentityid as int) as id_cliente					
            , cast ((firstname || ' ' || lastname) as string) as nome_cliente		
            , cast (rowguid	as string) as rowguid_cliente
            
        from fonte_clientes       
    )

select *
from renomear