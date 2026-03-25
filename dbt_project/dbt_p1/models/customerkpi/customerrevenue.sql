{{ config(
    materialized='table',
    schema='L2_PROCESSING', 
    alias='customers_rev_redirect'
) }}

with customerrevenue as (
select 
c.customerid, concat(c.firstname,'',c.lastname) as customername, count(o.orderid) as ordercount,
sum(oi.quantity * oi.unitprice) as revenue
from {{ source('metadata','customers') }} c
join {{ source('metadata','orders') }} o on c.customerid = o.customerid
join {{ source('metadata','orderitems') }} oi on o.orderid = oi.orderid
group by 1,2
)

select * from 
customerrevenue