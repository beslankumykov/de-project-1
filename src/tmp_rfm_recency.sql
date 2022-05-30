select u.id user_id, ntile(5) OVER(ORDER BY max(o.order_ts) nulls first) recency
from analysis.users u
left join orders o on u.id = o.user_id 
and status = (select id from analysis.orderstatuses os where key = 'Closed') 
group by u.id;
