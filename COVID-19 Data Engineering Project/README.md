# COVID-19 Data Engineering Project

## Overview
This project focuses on building a robust data engineering pipeline to handle COVID-19 data. The pipeline incorporates various AWS services for data storage, extraction,and transformation.

## Prerequisites
Before setting up the pipeline, ensure the following prerequisites are met:

1. **Install Boto3**: Python library for AWS SDK.
2. **Install Psycopg2**: PostgreSQL adapter for Python.
3. **Create a Role with S3 Full Access**: Assign this role to your Redshift cluster for accessing S3.
4. Customize cluster.txt file and save it as **cluster.config**: Modify the cluster configuration file according to your Redshift cluster details.

## Technologies Used
- Python
- Amazon S3 
- Amazon Glue
- Amazon Athena
- Amazon Redshift
- Amazon IAM
- Amazon VPC

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

6. Use Athena Jobs to Run the script and load data to Redshift

## Files
1. COVID-19 Data Engineering Project.ipynb: Jupyter Notebook File contains all necessary file operations, including data loading, processing, and analysis  required for this project.
2. cluster.config: Configuration file containing AWS and Redshift cluster details.

## Dimensional Model
![image](https://github.com/hsmgowtham/Data-Engineering-Analytics-and-Visualization-Projects/assets/123358865/f2b3761c-6f29-4939-a0a8-6b606c6e2e7e)
