with
    source_salesreasons as(
        select      
       	cast(salesreasonid as int) as salesreason_id					
        ,cast(name	as string)	as reason				
        ,cast(reasontype	as string)	as reason_type				
        --modifieddate	as string)		

        from {{ source('sap', 'salesreason')}}
    )

select *
from source_salesreasons