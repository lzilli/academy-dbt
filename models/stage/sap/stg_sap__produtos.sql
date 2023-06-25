with
    fonte_produtos as(
        select 
        cast(productid as int) as id_produto				
        , cast (name  as string) as nome_produto				
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
        , cast (sellstartdate as string) as data_inicio_venda				
        , cast (sellenddate	as string) as data_fim_venda			
        -- cast (discontinueddate as int) as data_descontinuado
        -- rowguid	STRING	NULLABLE				
        -- modifieddate	STRING	NULLABLE
        , case
            when sellenddate is null then false
            else true
        end as is_decontinuado

        from {{ source('sap', 'product')}}
    )

select *
from fonte_produtos 