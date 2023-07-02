with
    source_orders as(
        select 
       cast (salesorderid	as int)	as salesorder_id				
        --, cast(revisionnumber	as int)					
        , cast(orderdate	as datetime) as order_date					
        , cast(duedate	as datetime) as due_date					
        , cast(shipdate	as datetime) as ship_date
        , cast(status	as int)	as status				
        , cast(onlineorderflag as boolean) as is_online_order				
        , cast(purchaseordernumber	as string) as purchase_order_number					
        , cast(accountnumber	as string) as account_number 					
        , cast(customerid	as int)	as customer_id				
        , cast(salespersonid	as int)	as salesperson_id				
        --, cast(territoryid	as int)					
        , cast(billtoaddressid	as int) as bill_to_address_id			
        , cast(shiptoaddressid	as int)	as	ship_to_address_id		
        ---, cast(shipmethodid	as int) as ship_method_id					
        , cast(creditcardid	as int)	as creditcard_id				
        ---, cast(creditcardapprovalcode	as string)					
        , cast(currencyrateid	as int)	as currencyrate_id				
        , cast(subtotal	as numeric) as subtotal					
        , cast(taxamt	as numeric) as taxes				
        , cast(freight	as numeric) as freight					
        , cast(totaldue	as numeric)	as total				
        --, cast(comment	as int)					
        --, cast(rowguid	as string)					
        --, cast(modifieddate	as string)		

       
        from {{ source('sap', 'salesorderheader')}}
    )

select *
from source_orders