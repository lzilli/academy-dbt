with
    fonte_clientesinf as(
        select *
        from {{ source('sap', 'customer')}}
    
    )
    , renomear as (
        select
        cast(customerid	as int) as	id_customer	
        , cast(personid as int)	as	id_pessoa_clientesinf
        , cast(storeid as int)	as id_loja			
        --, cast(territoryid as int) as id_territorio		
        --rowguid	STRING	NULLABLE				
        --modifieddate	STRING	NULLABLE	  


        from fonte_clientesinf      
    )

select *
from renomear