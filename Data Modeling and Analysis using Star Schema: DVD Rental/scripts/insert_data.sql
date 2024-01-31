INSERT INTO dimDate 
	(date_key,date,year,month,day,week,quarter,is_weekend)
SELECT 
	DISTINCT(TO_CHAR(payment_date :: DATE, 'yyyyMMDD'):: INTEGER) as date_key,
	date(payment_date) as date,
	EXTRACT(year from payment_date) as year,
	EXTRACT(month from payment_date) as month,
	EXTRACT(day from payment_date) as day,
	EXTRACT(week from payment_date) as week,
	EXTRACT(quarter from payment_date) as quarter,
	CASE WHEN EXTRACT(ISODOW FROM payment_date) in (6,7) THEN True else false END AS is_weekend

FROM PAYMENT;


INSERT INTO dimCustomer 
	(customer_key,customer_id,first_name,last_name,email,address,address2,district,city,country,postal_code,phone,
	 active,create_date,start_date,end_date)
SELECT 
	c.customer_id as customer_key,
	c.customer_id,
	c.first_name,
	c.last_name,
	c.email,
	a.address,
	a.address2,
	a.district,
	ci.city,
	co.country,
	postal_code,
	a.phone,
	c.active,
	c.create_date,
	now() as start_date,
	now() as end_date
from 
	customer c
JOIN address a on (c.address_id = a.address_id)
JOIN city ci on (a.city_id = ci.city_id)
JOIN country co on (ci.country_id = co.country_id);


INSERT INTO dimStore 
	(store_key,store_id,manager_first_name,manager_last_name,address,address2,district,city,postal_code)
SELECT 
	s.store_id as store_key,
	s.store_id,
	st.first_name as manager_first_name,
	st.last_name as manager_last_name,
	a.address,
	a.address2,
	a.district,
	ci.city,
	postal_code
from 
	store s
JOIN staff st on (s.manager_staff_id = st.staff_id)
JOIN address a on (s.address_id = a.address_id)
JOIN city ci on (a.city_id = ci.city_id);


INSERT INTO dimMovie
	(movie_key,film_id,title,description,release_year,language,length,rating,special_features)
SELECT 
	f.film_id as movie_key,
	f.film_id,
	f.title,
	f.description,
	f.release_year,
	l.name as language,
	f.length,
	f.rating,
	f.special_features
from 
	film f
JOIN language l on (f.language_id = l.language_id);


INSERT INTO factSales (date_key, customer_key, movie_key, store_key, sales_amount)
SELECT 
        TO_CHAR(payment_date :: DATE, 'yyyyMMDD')::integer AS date_key,
        p.customer_id  as customer_key,
        i.film_id as movie_key,
        i.store_id as store_key,
        p.amount as sales_amount
FROM payment p 
JOIN rental r ON (p.rental_id = r.rental_id)
JOIN inventory i ON (r.inventory_id = i.inventory_id);

