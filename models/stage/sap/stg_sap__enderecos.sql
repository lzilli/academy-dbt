with
    fonte_endereco as(
        select      
       cast (addressid as int) as id_endereco_endereco			
        ,cast (addressline1	as string) as endereco_endereco				
        --addressline2	STRING	NULLABLE				
        ,cast (city	as string) as cidade_endereco				
        ,cast (stateprovinceid as int) id_estado_endereco				
        --postalcode	STRING	NULLABLE				
        --spatiallocation	STRING	NULLABLE				
        --rowguid	STRING	NULLABLE				
        --modifieddate	STRING	NULLABLE

       
        from {{ source('sap', 'address')}}
    )

select *
from fonte_endereco 