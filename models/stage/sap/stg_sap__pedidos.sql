with
    fonte_pedidos as(
        select 
       cast (salesorderid	INTEGER	NULLABLE				
        , cast(revisionnumber	INTEGER	NULLABLE				
        , cast(orderdate	STRING	NULLABLE				
        , cast(duedate	STRING	NULLABLE				
        , cast(shipdate	STRING	NULLABLE				
        , cast(status	INTEGER	NULLABLE				
        , cast(onlineorderflag	BOOLEAN	NULLABLE				
        , cast(purchaseordernumber	STRING	NULLABLE				
        , cast(accountnumber	STRING	NULLABLE				
        , cast(customerid	INTEGER	NULLABLE				
        , cast(salespersonid	INTEGER	NULLABLE				
        , cast(territoryid	INTEGER	NULLABLE				
        , cast(billtoaddressid	INTEGER	NULLABLE				
        , cast(shiptoaddressid	INTEGER	NULLABLE				
        , cast(shipmethodid	INTEGER	NULLABLE				
        , cast(creditcardid	INTEGER	NULLABLE				
        , cast(creditcardapprovalcode	STRING	NULLABLE				
        , cast(currencyrateid	INTEGER	NULLABLE				
        , cast(subtotal	FLOAT	NULLABLE				
        , cast(taxamt	FLOAT	NULLABLE				
        , cast(freight	FLOAT	NULLABLE				
        , cast(totaldue	FLOAT	NULLABLE				
        , cast(comment	INTEGER	NULLABLE				
        , cast(rowguid	STRING	NULLABLE				
        , cast(modifieddate	STRING	NULLABLE	

       
        from {{ source('sap', 'salesorderheader')}}
    )

select *
from fonte_pedidos 