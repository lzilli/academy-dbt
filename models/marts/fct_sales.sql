with
    orders as (
        select *
        from {{ ref('int_sales') }}
    )

    , addresses as (
        select *
        from {{ ref('dim_addresses') }}
    )

    , products as (
        select *
        from {{ ref('dim_products') }}
    )

    , reasons as (
        select *
        from {{ ref('int_reasons') }}
    )

    , join_tabelas3 as (
        
        select

        orders.salesorder_id							
        , addresses.sk_address as fk_address
        , products.sk_product as fk_product
        , orders.order_date					
        , orders.due_date					
        --, orders.ship_date
        --, orders.status				
        --, orders.is_online_order				
        --, orders.purchase_order_number					
        , orders.account_number 					
        , orders.customer_id				
        --, orders.salesperson_id				
        --, orders.bill_to_address_id			
        , orders.ship_to_address_id		
        , orders.creditcard_id				
    	, orders.creditcard_type
        --, orders.currencyrate_id				
        , orders.subtotal					
        , orders.taxes				
        , orders.freight					
        , orders.total
        , orders.salesorderdetail_id				
        , orders.quantity							
        , orders.unit_price				
        , orders.unit_price_discount							
        , reasons.salesreason_name
        --, addresses.address
        , addresses.city
        , addresses.state
        --, addresses.stateprovince_code
        , addresses.countryregion_code        
        , products.product_name
        --, products.sell_start_date			
        --, products.sell_end_date	
        , products.is_descontinued
        
       
        from orders 
        left join reasons on
            orders.salesorder_id = reasons.salesorder_id
        left join addresses on
            orders.ship_to_address_id = addresses.address_id
        left join products on
            orders.product_id = products.product_id

    )

    , transformacoes as (   
        select
            {{ dbt_utils.generate_surrogate_key(['salesorder_id', 'fk_product']) }} as sk_sale
            , *
            ,  unit_price * quantity as gross_value
            , (1 - unit_price_discount) * unit_price * quantity as net_value
            , case
                when unit_price_discount > 0 then true
                when unit_price_discount = 0 then false
                else false
                end as is_it_in_offer
        from join_tabelas3
    )

select *
from transformacoes
