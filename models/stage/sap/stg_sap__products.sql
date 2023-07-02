with
    source_products as(
        select
        cast(productid as int) as product_id		
        , cast (name  as string) as product_name				
        -- productnumber	STRING	NULLABLE				
        -- makeflag	BOOLEAN	NULLABLE				
        -- finishedgoodsflag	BOOLEAN	NULLABLE				
        -- color	STRING	NULLABLE				
        -- safetystocklevel	INTEGER	NULLABLE				
        -- reorderpoint	INTEGER	NULLABLE				
        -- standardcost	FLOAT	NULLABLE				
        -- listprice	FLOAT	NULLABLE				
        -- size	STRING	NULLABLE				
        -- sizeunitmeasurecode	STRING	NULLABLE				
        -- weightunitmeasurecode	STRING	NULLABLE				
        -- weight	FLOAT	NULLABLE				
        -- daystomanufacture	INTEGER	NULLABLE				
        -- productline	STRING	NULLABLE				
        -- class	STRING	NULLABLE				
        -- style	STRING	NULLABLE				
        -- productsubcategoryid	INTEGER	NULLABLE				
        -- productmodelid	INTEGER	NULLABLE				
        , cast (sellstartdate as datetime) as sell_start_date			
        , cast (sellenddate	as datetime)	as sell_end_date		
        -- cast (discontinueddate as int) as data_descontinuado
        -- rowguid	STRING	NULLABLE				
        -- modifieddate	STRING	NULLABLE
        , case
            when sellenddate is null then false
            else true
        end as is_descontinued

        from {{ source('sap', 'product')}}
    )

select *
from source_products 