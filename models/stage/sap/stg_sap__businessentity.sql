with
    fonte_businessentity as(
        select 
       cast( businessentityid as int) as id_cliente_businessentity			
--rowguid	STRING	NULLABLE				
--modifieddate	STRING	NULLABLE
       
        from {{ source('sap', 'businessentity')}}
    )

select *
from fonte_businessentity 