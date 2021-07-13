with base_returns as 
(
SELECT DISTINCT
Order_ID
,Returned
FROM {{ref('returns')}}
)

SELECT
returned
,order_id
from base_returns

