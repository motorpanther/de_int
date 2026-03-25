select
    orderid,
    orderdate,
    customerid,
    employeeid,
    storeid,
    status as statusCD,
    case when status = '01' then 'In Progess'
        when status = '02' then 'Completed'
        when status = '03' then 'Cancelled'
        else null
    end as StatusDesc,
    updated_at
from   
    {{ source('metadata','ordr')}}