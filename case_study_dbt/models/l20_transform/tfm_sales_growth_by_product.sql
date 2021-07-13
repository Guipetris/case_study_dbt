with orders as 
(
    SELECT
    category
    ,year(order_date) year
    ,sum(sales) sales
    FROM {{ref('base_orders')}} src
    where order_id not in (SELECT
    order_id from 
    {{ref('base_returns')}}
    )
    group by category, year

)

SELECT
orders1.*
,(orders1.sales - orders2.sales)/orders2.sales as year_growth_percentage
from orders as orders1
LEFT JOIN orders as orders2 on orders1.category = orders2.category and orders1.year-1=orders2.year
order by year DESC
