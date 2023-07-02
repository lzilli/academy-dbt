with
    ordersdetails as (
        select *
        from {{ ref('stg_sap__ordersdetails') }}
    )

    , orders as (
        select *
        from {{ ref('stg_sap__orders') }}
    )

    , creditcard as (
        select *
        from {{ ref('stg_sap__creditcards') }}
    )

    , join_tabelas2 as (
        select 

       orders.salesorder_id				
        , orders.order_date					
        , orders.due_date					
        , orders.ship_date
        , orders.status				
        , orders.is_online_order				
        , orders.purchase_order_number					
        , orders.account_number 					
        , orders.customer_id				
        , orders.salesperson_id				
        , orders.bill_to_address_id			
        , orders.ship_to_address_id		
        , orders.creditcard_id				
    	, creditcard.creditcard_type
        , orders.currencyrate_id				
        , orders.subtotal					
        , orders.taxes				
        , orders.freight					
        , orders.total
        , ordersdetails.salesorderdetail_id				
        , ordersdetails.quantity				
        , ordersdetails.product_id									
        , ordersdetails.unit_price				
        , ordersdetails.unit_price_discount							
        
        
        from ordersdetails
        left join orders on
        ordersdetails.salesorder_id = orders.salesorder_id
        left join creditcard on
        orders.creditcard_id = creditcard.creditcard_id

    )

select *
from join_tabelas2



