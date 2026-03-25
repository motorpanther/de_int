select 
    customerid,
    firstname,
    lastname,
    email,
    phone,
    address,
    city,
    state,
    zipcode,
    updated_at,
    concat(firstName, '', lastname) as customername
from 
    {{ source('metadata','cust')}}