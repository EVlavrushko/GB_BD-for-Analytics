-- выборки для 1-3 заданий и анализа данных
select count( distinct user_id) from orders 
	-- having count(id_o) > 1
	-- where price <=0
	-- order by price asc 
	group by o_date
	
SELECT DATE_FORMAT(o_date, '%Y/%m/%d') from orders 


-- выборка для 4 задания
select extract(year from o_date) as year, extract(month from o_date) as month, 
	sum(price) as Sum,
	count(id_o) as OrderCount,
	count(distinct user_id) as UserCount
	from orders
	group by extract(year from o_date), extract(month from o_date)
	order by year

-- выборка для 5 задания (Найдите количество пользователей, кот покупал в одном году и перестал покупать в следующем.)
select count( distinct user_id) from orders 
	except
	select distinct user_id 
	from orders o1
	where exists(select 1 from orders o2 
  		where o2.user_id = o1.user_id 
  		and extract(year from o2.o_date) + 1 = extract(year from o1.o_date)
)
	
	
-- для 6 задания
select user_id, count(id_o) from orders group by user_id order by COUNT(id_o) DESC