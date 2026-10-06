with  source as (
    select * from {{source('raw','orders')}}
),
renamed as (
    select ORDERNUMBER as o_id,
    CUSTOMERNUMBER as cust_id,
    ORDERDATE,
    REQUIREDDATE,
    SHIPPEDDATE,
    STATUS,
    COMMENTS
    from source
    where SHIPPEDDATE is not null
)
select * from renamed
