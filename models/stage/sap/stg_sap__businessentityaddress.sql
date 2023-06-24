with
    fonte_businessentityaddress as(
        select 
       cast (addressid as int) as id_endereco_businessentityaddress
       , cast (businessentityid as int)	id_cliente_businessentityaddress				
	    --addresstypeid					
        --rowguid				
        --modifieddate	

       
        from {{ source('sap', 'businessentityaddress')}}
    )

select *
from fonte_businessentityaddress 