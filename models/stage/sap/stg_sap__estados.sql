with
    fonte_estado as(
        select      
        cast (stateprovinceid as int) as id_estado_estado				
        , cast (stateprovincecode as string) as codigo_estado				
        , cast (countryregioncode as string) as codigo_pais_estado		
        , cast (name as string)	as nome_estado	
        --territoryid				
        --rowguid			
        --modifieddate
        --isonlystateprovinceflag	
        from {{ source('sap', 'stateprovince')}}
    )

select *
from fonte_estado


