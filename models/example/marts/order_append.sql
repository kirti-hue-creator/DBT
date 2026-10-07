{{
    config(
        materialized= 'incremental',
        incremental_strategy='append'
    )
}}
with cte as(
    select * from {{source('raw','orders')}}
)
select  ORDERNUMBER,
    CUSTOMERNUMBER,
    ORDERDATE,
    REQUIREDDATE,
    SHIPPEDDATE,
    STATUS
from cte
{%if is_incremental()%}
where SHIPPEDDATE >(select max(SHIPPEDDATE) from {{this}})
{%endif%}