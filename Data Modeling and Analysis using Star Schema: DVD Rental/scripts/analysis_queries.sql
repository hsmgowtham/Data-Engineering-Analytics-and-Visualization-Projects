-- 1. Total Sales Amount Per Customer
SELECT 
  dc.customer_key, 
  dc.first_name, 
  dc.last_name, 
  Sum(fs.sales_amount) AS total_sales_amount 
FROM 
  dimcustomer dc 
  JOIN factsales fs ON dc.customer_key = fs.customer_key 
GROUP BY 
  dc.customer_key, 
  dc.first_name, 
  dc.last_name;

-- 2. Total Sales Amount Per Movie:
SELECT 
  dm.movie_key, 
  dm.title, 
  Sum(fs.sales_amount) AS total_sales_amount 
FROM 
  dimmovie dm 
  JOIN factsales fs ON dm.movie_key = fs.movie_key 
GROUP BY 
  dm.movie_key, 
  dm.title;

-- 3. Monthly Sales Trend:
SELECT 
  dd.year, 
  dd.month, 
  Sum(fs.sales_amount) AS monthly_sales_amount 
FROM 
  dimdate dd 
  JOIN factsales fs ON dd.date_key = fs.date_key 
GROUP BY 
  dd.year, 
  dd.month 
ORDER BY 
  dd.year, 
  dd.month;

-- 4. Average Sales Amount Per Store:
SELECT 
  ds.store_key, 
  ds.city, 
  Avg(fs.sales_amount) AS avg_sales_amount 
FROM 
  dimstore ds 
  JOIN factsales fs ON ds.store_key = fs.store_key 
GROUP BY 
  ds.store_key, 
  ds.city;

-- 5. Most Active Customers:
SELECT 
  fs.customer_key AS customer_id, 
  dc.first_name, 
  dc.last_name, 
  dc.email, 
  Count(sales_key) AS Total_Transactions 
FROM 
  factsales fs 
  JOIN dimcustomer dc ON fs.customer_key = dc.customer_key 
GROUP BY 
  fs.customer_key, 
  dc.first_name, 
  dc.last_name, 
  dc.email 
ORDER BY 
  fs.customer_key;

-- 6. Sales Amount on Weekends vs. Weekdays:
SELECT 
  dd.is_weekend, 
  Sum(fs.sales_amount) AS total_sales_amount 
FROM 
  factsales fs 
  JOIN dimdate dd ON dd.date_key = fs.date_key 
GROUP BY 
  dd.is_weekend;
