
# AWS Redshift DataPipeline
This repository contains scripts and configurations for implementing a DataPipeline on AWS Redshift, utilizing S3 as staging data storage. The pipeline moves data from S3 to Redshift for analysis and reporting purposes.

## Overview
The DataPipeline involves processing data stored in an S3 bucket ('tickit-items') and loading it into AWS Redshift for analysis. Staging data refers to the processed data stored in S3, which acts as an intermediate step before moving it to the Data Warehouse (Redshift).

## Prerequisites
Before setting up the pipeline, ensure the following prerequisites are met:

1. **Install Boto3**: Python library for AWS SDK.
2. **Install Psycopg2**: PostgreSQL adapter for Python.
3. **Create a Role with S3 Full Access**: Assign this role to your Redshift cluster for accessing S3.
4. **Create 'tickit-items' Bucket** : Create an S3 bucket named 'tickit-items' and upload data files from 'tickitdb' into it.
5. Customize cluster.txt file and save it as **cluster.config**: Modify the cluster configuration file according to your Redshift cluster details.

## Technologies Used
- Python
- Amazon S3
- Amazon Redshift
- Amazon IAM
- Amazon VPC

## Usage
1. Clone this repository.
2. Set up AWS credentials on your machine.
3. Customize the cluster.config file with your Redshift cluster details.
5. Run the provided scripts to initiate the data transfer process.

## Files
1. Data Pipeline Practice.ipynb: Jupyter Notebook File for orchestrating the data pipeline process.
2. cluster.config: Configuration file containing Redshift cluster details.
