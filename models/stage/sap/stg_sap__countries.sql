with
    source_countries as(
        select      
        cast (countryregioncode as string) as countryregion_code			
        , cast(name as string) as country	
        --modifieddate	

        from {{ source('sap', 'countryregion')}}
    )

select *
from source_countries 


