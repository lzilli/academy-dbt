with
    fonte_pais as(
        select      
        cast (countryregioncode as string) as codigo_pais_pais				
        , cast(name as string) as nome_pais			
        --modifieddate	

        from {{ source('sap', 'countryregion')}}
    )

select *
from fonte_pais


