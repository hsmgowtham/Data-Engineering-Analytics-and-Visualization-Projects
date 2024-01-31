# Data Modeling and Analysis with Star Schema: DVD Rental

This project demonstrates the implementation of a star schema for efficient data modeling and analysis. The star schema organizes data into dimension and fact tables, providing substantial advantages in terms of query speed and efficiency.

## Traditional 3NF ER Diagram

## Star Schema


## Prerequisites

Before proceeding, make sure you have the following:

1. **PostgreSQL Database Server:** Ensure PostgreSQL is installed on your system.

2. **GUI Query Tool (Optional):** Install PGAdmin or any other GUI tool for querying the database.

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

Certainly, here's a simplified version:

### Observations

After running both queries and checking the time it takes to get results, it's clear that using the star schema makes queries much faster. This is especially important when dealing with a lot of data, making the star schema a top choice for data warehouses and databases used for analysis.

The improved speed is thanks to the well-organized design of the star schema, which makes joining and combining data more efficient. This means queries are not only faster but also more responsive, providing quicker insights during analytical tasks.