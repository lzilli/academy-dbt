with
    source_state as(
        select      
        cast (stateprovinceid as int) as stateprovince_id
        , cast (stateprovincecode as string) as stateprovince_code				
        , cast (countryregioncode as string) as countryregion_code
        , cast (name as string) as state 
        --territoryid				
        --rowguid			
        --modifieddate
        --isonlystateprovinceflag	
        from {{ source('sap', 'stateprovince')}}
    )

select *
from source_state


