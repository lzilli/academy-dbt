with
    source_address as(
        select      
       cast (addressid as int) as address_id	
        ,cast (addressline1	as string)	address			
        --addressline2	STRING	NULLABLE				
        ,cast (city	as string) as city			
        ,cast (stateprovinceid as int) as stateprovince_id
        --postalcode	STRING	NULLABLE				
        --spatiallocation	STRING	NULLABLE				
        --rowguid	STRING	NULLABLE				
        --modifieddate	STRING	NULLABLE

       
        from {{ source('sap', 'address')}}
    )

select *
from source_address 