with
    source_creditcard as(
        select 
        cast (creditcardid as int)	as creditcard_id		
        , cast(cardtype as string) as creditcard_type
        --cardnumber				
        --expmonth				
        --expyear					
        --modifieddate	

        from {{ source('sap', 'creditcard')}}
    )

select *
from source_creditcard