Проверка таблицы с заказами на глубину:
```
select DATE(DATE_TRUNC('month', order_ts)) as month, count(*) total_records from orders group by month order by month;
```
Проверка показала, что в источнике есть данные только за два месяца 2022-го года. 
Соответственно метрики будут построены по этим данным.

Проверка используемых полей в таблице с заказами на полноту:
```
select count(case when order_ts is null then 1 end) as empty_val_prc from orders;
select count(case when order_id is null then 1 end) as empty_val_prc from orders;
select count(case when payment is null then 1 end) as empty_val_prc from orders;
```
Проверка показала, что в источнике нет пустых значений по интересующим полям.
  
