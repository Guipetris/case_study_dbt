with orders as 
(
    SELECT
    year(order_date) year
    , month(order_date) month
    ,sum(sales) sales
    FROM {{ref('base_orders')}} src
    where order_id not in (SELECT
    order_id from 
    {{ref('base_returns')}}
    )
    group by year, month
)

SELECT *
from orders
order by year, month