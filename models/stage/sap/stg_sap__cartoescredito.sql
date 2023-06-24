with
    fonte_cartoescredito as(
        select 
        cast (creditcardid as int) as id_cartaocredito_cartoescredito				
        , cast(cardtype as string)  tipocartao_cartoescredito
        --cardnumber				
        --expmonth				
        --expyear					
        --modifieddate	

        from {{ source('sap', 'creditcard')}}
    )

select *
from fonte_cartoescredito