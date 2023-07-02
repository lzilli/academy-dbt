with
    source_salesordersreasons as(
        select      
        cast(salesorderid	as int)	as salesorder_id				
        ,cast(salesreasonid	as int)	as salesreason_id				
        --modifieddate	STRING		

        from {{ source('sap', 'salesorderheadersalesreason')}}
    )

select *
from source_salesordersreasons
