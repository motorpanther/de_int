select 
os.storeID
sum(ofact.revene) as totalrevenue
from {{ ref('orders_stg')}} os
join {{ ref('orders_fact')}} ofact on os.orderid = ofact.orderid
group by 1
-- not materilized