{{
    config(materialized='table')
}}
with cte as (
    select * from {{source('raw','CUSTOMERS')}}
)
select CUSTOMERNUMBER as cust_id,
CUSTOMERNAME as cust_name
from cte