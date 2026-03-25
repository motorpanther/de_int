

select 
c.customerid, concat(c.firstname,'',c.lastname) as customername, count(o.orderid) as ordercount
from {{ source('metadata','cust')}} c
join {{ source('metadata','ordr')}} o on c.customerid = o.customerid
group by 1,2
order by 3 desc
