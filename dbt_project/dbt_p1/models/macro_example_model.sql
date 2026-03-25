select city_code,
city,
month,
avg_temp_fahrenheit,
{{to_celsius(avg_temp_fahrenheit, 1)}} as avg_temp_celsius
from SLEEKMART_OMS.TRANING.city_temperture