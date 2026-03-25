{{ config(
    materialized='table',) }}

select os.storeid,
sum(ofact.revenue) as actualsales,
sum(st.salestarget) as targetsales
from 
    {{ ref('orders_stg')}} os
join
    {{ ref('orders_fact')}} ofact on os.orderID = ofact.orderid
join
    {{ ref('QuaterlySalesTarget')}} st on st.storeid = os.storeid
group by 1