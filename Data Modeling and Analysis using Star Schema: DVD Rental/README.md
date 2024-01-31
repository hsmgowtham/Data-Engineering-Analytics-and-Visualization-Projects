# Data Modeling and Analysis with Star Schema: DVD Rental

## Table of Contents
  * [Overview](#overview)
  * [Database and Tools](#database-and-tools)
  * [Traditional 3NF ER Diagram](#traditional-3nf-er-diagram)
  * [Star Schema](#star-schema)
  * [Loading the Sample Database](#loading-the-sample-database)
    + [1. Create the dvdrental database](#1-create-the-dvdrental-database)
    + [2. Restore the sample database from a tar file:](#2-restore-the-sample-database-from-a-tar-file-)
    + [3. Verify the sample database:](#3-verify-the-sample-database-)
  * [Performance Comparison: Star Schema vs. 3NF](#performance-comparison--star-schema-vs-3nf)
    + [Star Schema Analysis](#star-schema-analysis)
    + [3NF Schema Analysis](#3nf-schema-analysis)
  * [Observations](#observations)
  * [Business Analysis Overview](#business-analysis-overview)

## Overview
This project demonstrates the implementation of a star schema for efficient data modeling and analysis. The star schema organizes data into dimension and fact tables, providing substantial advantages in terms of query speed and efficiency.

## Database and Tools
- PostgreSQL
- pgAdmin4

## Traditional 3NF ER Diagram
[Schema credit to](https://www.postgresqltutorial.com/postgresql-getting-started/postgresql-sample-database/)
![image](https://github.com/hsmgowtham/SQL-Data-Analysis-Visualization-Modeling-and-Design-Projects/assets/123358865/90be1e00-b61a-4a9e-a72f-9da81c0ab3a5)

## Star Schema
![Dimensional Model drawio](https://github.com/hsmgowtham/SQL-Data-Analysis-Visualization-Modeling-and-Design-Projects/assets/123358865/74b9903e-a779-4265-9586-c2e537dcd0d7)





## Loading the Sample Database

### 1. Create the dvdrental database

- Open the terminal or Command Prompt.
  
- Connect to the PostgreSQL server using `psql`:
```bash
  psql -U postgres
```
- Enter the password for the postgres user.

- Create a new database named dvdrental:

```bash
CREATE DATABASE dvdrental;
```
- Exit the PostgreSQL prompt:

```bash
\q
```
### 2. Restore the sample database from a tar file:

- Download the sample database tar file (dvdrental.tar).

- Navigate to the directory containing the tar file.

- Load the dvdrental database using the pg_restore command:

```bash
pg_restore -U postgres -d dvdrental dvdrental.tar
```
Enter the password for the postgres user when prompted.

### 3. Verify the sample database:

- Reconnect to the PostgreSQL server using psql:

```bash
psql -U postgres
```
- Switch to the dvdrental database:

```bash
\c dvdrental
```
Confirm the change in the command prompt:

```bash
dvdrental=#
```
These steps ensure the PostgreSQL database server is set up, the dvdrental database is created, and the sample data is loaded for further analysis.

## Performance Comparison: Star Schema vs. 3NF
The primary objective of data modeling is to optimize query performance, particularly for analytical purposes. In this project, we leverage the star schema to organize the data into dimension and fact tables, offering significant advantages in terms of query speed and efficiency.

### Star Schema Analysis
The following query demonstrates the power of the star schema in enhancing the performance of analytical queries:
```bash
-- Analysis using Dimension and Fact Tables
SELECT dimMovie.title, dimDate.month, dimCustomer.city, SUM(sales_amount) AS revenue
FROM factSales 
JOIN dimMovie ON (dimMovie.movie_key = factSales.movie_key)
JOIN dimDate ON (dimDate.date_key = factSales.date_key)
JOIN dimCustomer ON (dimCustomer.customer_key = factSales.customer_key)
GROUP BY dimMovie.title, dimDate.month, dimCustomer.city
ORDER BY dimMovie.title, dimDate.month, dimCustomer.city, revenue DESC;
```

### 3NF Schema Analysis
For comparison, the equivalent query using a 3NF schema is provided:
```bash
-- Analysis using 3NF Schema 
SELECT f.title, EXTRACT(month FROM p.payment_date) AS month, ci.city, SUM(p.amount) AS revenue
FROM payment p
JOIN rental r ON (p.rental_id = r.rental_id)
JOIN inventory i ON (r.inventory_id = i.inventory_id)
JOIN film f ON (i.film_id = f.film_id)
JOIN customer c ON (p.customer_id = c.customer_id)
JOIN address a ON (c.address_id = a.address_id)
JOIN city ci ON (a.city_id = ci.city_id)
GROUP BY f.title, month, ci.city
ORDER BY f.title, month, ci.city, revenue DESC;
```


## Observations

After running both queries and checking the time it takes to get results, it's clear that using the star schema makes queries much faster. This is especially important when dealing with a lot of data, making the star schema a top choice for data warehouses and databases used for analysis.

The improved speed is thanks to the well-organized design of the star schema, which makes joining and combining data more efficient. This means queries are not only faster but also more responsive, providing quicker insights during analytical tasks.

## Business Analysis Overview

In addition to setting up the star schema for efficient data organization, I have conducted various business analyses to gain insights into the dataset. Below is an outline of the analyses performed:

1. **Total Sales per Customer:**
   - Aggregated sales amounts for each customer to understand individual customer contributions.

2. **Total Sales per Movie:**
   - Examined sales amounts for each movie to identify top-performing titles.

3. **Monthly Sales Trend:**
   - Analyzed the monthly trend of sales amounts to identify patterns over time.

4. **Average Sales per Store:**
   - Calculated the average sales amount per store to assess performance.

5. **Most Active Customers:**
   - Identified and ranked the most active customers based on the number of transactions.

6. **Sales Amount on Weekends vs. Weekdays:**
   - Investigated the variation in sales amounts between weekends and weekdays.

Feel free to explore these analyses in detail by executing the provided [SQL queries](./scripts/analysis_queries.sql) using your preferred SQL client.

## Data Source

The sample database used in this project is sourced from [PostgreSQL Tutorial](https://www.postgresqltutorial.com/postgresql-getting-started/postgresql-sample-database/).

