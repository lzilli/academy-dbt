with
    orders as (
        select *
        from {{ ref('stg_sap__orders') }}
    )

    , salesorders_reason as (
        select *
        from {{ ref('stg_sap__salesordersreasons') }}
    ) 

    , sales_reason as (
        select *
        from {{ ref('stg_sap__salesreason') }}
    )

    , joined as (
		select
			orders.salesorder_id
			, string_agg(sales_reason.reason, ', ') as salesreason_name
		from orders

		left join salesorders_reason
			on orders.salesorder_id = salesorders_reason.salesorder_id
		left join sales_reason
			on salesorders_reason.salesreason_id = sales_reason.salesreason_id 
		group by orders.salesorder_id
)
select distinct salesorder_id, salesreason_name
from joined

