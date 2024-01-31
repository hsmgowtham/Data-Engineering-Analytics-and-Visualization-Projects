-- Create Dimension Tables
Create table dimDate
(
	date_key integer NOT NULL PRIMARY KEY,
	date date NOT NULL,
	year smallint NOT NULL,
	month smallint NOT NULL,
	day smallint NOT NULL,
	week smallint NOT NULL,
	quarter smallint NOT NULL,
	is_weekend boolean
);


CREATE TABLE dimCustomer
(
	customer_key SERIAL PRIMARY KEY,
	customer_id smallInt NOT NULL,
	first_name varchar(45) NOT NULL,
	last_name varchar(45) NOT NULL,
	email varchar(50),
	address varchar(50) NOT NULL,
	address2 varchar(50),
	district varchar(20) NOT NULL,
	city varchar(50) NOT NULL,
    country varchar(50) NOT NULL,
	postal_code varchar(10),
	phone varchar(20) NOT NULL,
	active smallInt NOT NULL,
	create_date timestamp NOT NULL,
	start_date date NOT NULL,
	end_date date NOT NULL
);


CREATE TABLE dimStore
(
	store_key SERIAL PRIMARY KEY,
	store_id smallInt NOT NULL,
	manager_first_name varchar(45) NOT NULL,
	manager_last_name varchar(45) NOT NULL,
	address varchar(50) NOT NULL,
	address2 varchar(50),
	district varchar(20) NOT NULL,
	city varchar(50) NOT NULL,
	postal_code varchar(10)
);


CREATE TABLE dimMovie
(
	movie_key SERIAL PRIMARY KEY,
	film_id smallInt NOT NULL,
	title varchar(100) NOT NULL,
	description varchar(250),
	release_year smallInt NOT NULL,
	language varchar(100),
	length smallInt NOT NULL,
	rating varchar(100) NOT NULL,
	special_features varchar(100)[]
);


-- Create Fact Table
CREATE TABLE factSales
(
	sales_key SERIAL PRIMARY KEY,
	date_key integer REFERENCES dimDate (date_key),
	customer_key integer REFERENCES dimCustomer (customer_key),
	store_key integer REFERENCES dimStore (store_key),
	movie_key integer REFERENCES dimMovie (movie_key),
	sales_amount numeric
)