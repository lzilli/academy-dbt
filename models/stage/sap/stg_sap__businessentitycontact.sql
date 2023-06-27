with
    fonte_businessentitycontact as(
        select 
   	    cast(businessentityid as int) as id_cliente_businessentitycontact				
        ,cast(personid as int) id_pessoa_businessentitycontact			
        --contacttypeid	INTEGER	NULLABLE				
        --rowguid	STRING	NULLABLE				
        --modifieddate	STRING	NULLABLE	
       
        from {{ source('sap', 'businessentitycontact')}}
    )

select *
from fonte_businessentitycontact  