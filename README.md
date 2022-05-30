# Построение витрины для RFM-анализа

Описание задачи: 
1. Витрина должна быть построена в схеме analysis на основе оперативных данных в схеме production.
2. Наименование витрины - dm_rfm_segments.
3. Метрики должны быть построены на успешно выполненных заказах, то есть на заказах со статусом Closed.
4. Витрина должна состоять из таких полей:
- user_id
- recency (число от 1 до 5)
- frequency (число от 1 до 5)
- monetary_value (число от 1 до 5)
5. В витрине нужны данные с начала 2021 года.
6. Обновлять витрину не требуется.

В requirements.md описаны необходимые поля.
В data_quality.md описано, насколько качественные данные хранятся в источнике и какие инструменты для обеспечения качества данных использованы.

Вас попросили обращаться только к объектам из схемы analysis при расчёте витрины. 
Чтобы не дублировать данные, которые находятся в этой же базе, сделайте представления. 
Представления будут находиться в схеме analysis и отображать данные из схемы production.

Напишите SQL-запросы, чтобы создать пять представлений (по одному на каждую таблицу), и выполните их. 
В итоговый документ вставьте код создания представления.
Создайте документ views.sql. В этот документ вставьте код создания представлений.

Напишите DDL-запрос для создания витрины.
Далее вам необходимо создать витрину. Напишите запрос с CREATE TABLE и выполните его на предоставленной базе данных в схеме analysis. Помните, что при создании таблицы необходимо учитывать названия полей, типы данных и ограничения.
Создайте документ datamart_ddl.sql и сохраните в него написанный запрос.
Напишите SQL-запрос для заполнения витрины
Реализуйте расчёт витрины на языке SQL и заполните таблицу, созданную в предыдущем пункте. Для решения предоставьте код запроса.
Рассчитайте витрину поэтапно. Сначала заведите таблицы под каждый показатель:
CREATE TABLE analysis.tmp_rfm_recency (
 user_id INT NOT NULL PRIMARY KEY,
 recency INT NOT NULL CHECK(recency >= 1 AND recency <= 5)
);
CREATE TABLE analysis.tmp_rfm_frequency (
 user_id INT NOT NULL PRIMARY KEY,
 frequency INT NOT NULL CHECK(frequency >= 1 AND frequency <= 5)
);
CREATE TABLE analysis.tmp_rfm_monetary_value (
 user_id INT NOT NULL PRIMARY KEY,
 monetary_value INT NOT NULL CHECK(monetary_value >= 1 AND monetary_value <= 5)
);
  
После этого создайте документ tmp_rfm_recency.sql. В нём напишите SQL-запрос для заполнения таблицы analysis.tmp_rfm_recency.
Повторите алгоритм для двух следующих показателей. В документе tmp_rfm_frequency.sqlнапишите SQL-запрос для заполнения таблицы analysis.tmp_rfm_frequency, а в документе tmp_rfm_monetary_value.sql — SQL-запрос для заполнения таблицы analysis.tmp_rfm_monetary_value.
Затем создайте документ datamart_query.sql и напишите в нём запрос, который на основе данных, подготовленных в таблицах analysis.tmp_rfm_recency, analysis.tmp_rfm_frequency и analysis.tmp_rfm_monetary_value, заполнит витрину analysis.dm_rfm_segments.
Скопируйте в этот же файл первые десять строк из полученной таблицы, отсортированные по user_id. Это значит, что нужно скопировать user_id и соответствующие им параметры RFM для 10 пользователей с минимальными user_id.
