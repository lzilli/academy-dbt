with
    source_orders_details as (
    select

        cast(salesorderid	as int)	as salesorder_id				
        , cast(salesorderdetailid	as int)	as salesorderdetail_id			
        --, cast(carriertrackingnumber	as string)					
        , cast(orderqty	as int)	as quantity				
        , cast(productid as int) as product_id					
        , cast(specialofferid	as int)	specialoffer_id				
        , cast(unitprice as numeric) as	unit_price				
        , cast(unitpricediscount as numeric) as	unit_price_discount				
        --, cast(rowguid	as string)					
        --, cast(modifieddate	as string)	


    from {{ source('sap', 'salesorderdetail')}}

   )

select *
from source_orders_details