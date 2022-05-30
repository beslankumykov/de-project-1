select u.id user_id, ntile(5) OVER(ORDER BY sum(o.payment) nulls first) monetary_value
from analysis.users u
left join analysis.orders o on u.id = o.user_id 
and status = (select id from analysis.orderstatuses os where key = 'Closed') 
group by u.id;
