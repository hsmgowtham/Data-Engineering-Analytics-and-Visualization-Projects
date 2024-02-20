# COVID-19 Data Engineering Project

## Overview
This project focuses on building a robust data engineering pipeline to handle COVID-19 data. The pipeline incorporates various AWS services for data storage, extraction, transformation, and visualization.

## Technologies Used
- Amazon S3:
- Amazon Glue: Fully Managed ETL(extract, transform, and load) service
- Amazon Athena: An interactive query service that makes it easy to analyze data in Amazon S3 and other federated data sources using standard SQL.


## Architecture

- Amazon S3: Utilized as the primary storage solution leveraging AWS Open Data for acquiring and storing the dataset.

- Crawler: Extracts schema and relevant information from the dataset, facilitating data understanding and organization.

- Amazon Athena: Employs ad-hoc querying capabilities, akin to SQL, on CSV/JSON files for efficient data analysis.

- Amazon Glue: Utilized for data transformation tasks, ensuring data is prepared and structured appropriately for downstream processing.

- Amazon Redshift (In VPC): Serves as the final destination for storing transformed data, providing scalability and performance within a Virtual Private Cloud (VPC) environment.

- Visualization Tools: Visualizes data insights using platforms like Tableau, PowerBI, etc., facilitating comprehensive analysis and decision-making.

## Usage
1. Data Acquisition: Acquire COVID-19 dataset from AWS Open Data and store it in Amazon S3.

2. Data Understanding: Utilize the Crawler to extract schema, pertinent information from the dataset, and build Relational Data Model.

3. Data Analysis: Conduct ad-hoc queries using Amazon Athena for insightful analysis of the data.

4. Data Transformation: Run ETL job in python employing Amazon Glue, for transforming the data into a suitable format for downstream processing.

5. Transformed Data Storage: Store the transformed data securely in S3.

6. Build Tables: Build Dimensional Tables on Redshift and load data to Redshift

6. Data Visualization: Visualize the analyzed data using visualization tools like Tableau or PowerBI for intuitive interpretation and decision-making.