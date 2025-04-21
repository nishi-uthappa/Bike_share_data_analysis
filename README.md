# Bike Share Usage and Profitability Dashboard  
![bike analysis gif](https://github.com/user-attachments/assets/dd8fdc9a-455d-49ac-8ccd-76b530eae7f2)  

## Introduction  
This project analyzes bike share data to gain insights into usage patterns and financial performance. By combining bike trip information with cost data, the analysis aims to identify key factors influencing revenue and profitability. The findings can help stakeholders make informed decisions to optimize operations and maximize revenue.  
### The following questions were answered  
- What are the peak hours and days of the week for bike rentals?
- How does revenue vary by hour and day?
- What is the profit generated from bike rentals, considering associated costs?
- What is the revenue by season?
- What are the rider demographics?

## Tools/Skills Used  
- SQL Queries (PostgreSQL): SQL queries executed in VS Code editor was used to extract, transform, create tables and combine data from multiple tables.
- Power BI: Power BI was used to create measures and visualize the data to present the findings.
- pgAdmin: pgAdmin was used as a database management tool for PostgreSQL.
- DAX Measures (Power BI): DAX formulas were used within Power BI to create calculated measures for analysis.

## The Analysis  

### Analysis through SQL  
Find the sql files here [SQL Queries Folder](https://github.com/nishi-uthappa/Bike_share_data_analysis/tree/main/SQL_Queries)  

The SQL queries that were executed before importing the data into Power BI:
- 1_create_tables.sql:  This script contains the SQL queries to create the necessary tables in the database.
- 2_loading_data.sql:   This script contains the SQL queries to load data into the tables created in the previous step.
- 3_joining_tables.sql: This script contains the SQL queries to join the tables to combine the data from multiple tables.  
```sql
/* 1. Combined rows from bike_share_year_0 and bike_share_year_1 within a subquery using UNION ALL.
 2. Merged the result of the UNION ALL subquery with cost_table based on matching year values using LEFT JOIN.
 3. Stored the joined result in a new table, combined_bike_data.
 */
DROP TABLE IF EXISTS combined_bike_data;
CREATE TABLE combined_bike_data AS
WITH full_table AS (
    SELECT *
    FROM bike_share_year_0
    UNION ALL
    SELECT *
    FROM bike_share_year_1
)
SELECT ft.date,
    ft.season,
    ft.year,
    ft.month,
    ft.hour,
    ft.holiday,
    ft.weekday,
    ft.working_day,
    ft.weathersit,
    ft.temp,
    ft.atemp,
    ft.hum,
    ft.windspeed,
    ft.rider_type,
    ft.riders,
    ct.price,
    ct.COGS
FROM full_table AS ft
    LEFT JOIN cost_table AS ct ON ft.year = ct.year;
SELECT *
FROM combined_bike_data;
```

- 4_create_new_values_columns.sql:   This script contains the SQL queries to create new columns, by performing calculations on existing columns.  
```sql
-- Adding new columns to the new combined table and updating those columns with calculated values.

DROP TABLE IF EXISTS combined_bike_data;
CREATE TABLE combined_bike_data AS
WITH full_table AS (
    SELECT *
    FROM bike_share_year_0
    UNION ALL
    SELECT *
    FROM bike_share_year_1
)
SELECT ft.date,
    ft.season,
    ft.year,
    ft.month,
    ft.hour,
    ft.holiday,
    ft.weekday,
    ft.working_day,
    ft.weathersit,
    ft.temp,
    ft.atemp,
    ft.hum,
    ft.windspeed,
    ft.rider_type,
    ft.riders,
    ct.price,
    ct.COGS
FROM full_table AS ft
    LEFT JOIN cost_table AS ct ON ft.year = ct.year;
-- Add the revenue and profit columns to the existing combined_bike_data table
ALTER TABLE combined_bike_data
ADD COLUMN revenue DECIMAL,
    ADD COLUMN profit DECIMAL;
-- Update the revenue and profit columns with the calculated values
UPDATE combined_bike_data
SET revenue = riders * price,
    profit = (riders * price) - (COGS * riders);
SELECT *
FROM combined_bike_data;
```
### Analysis and Visualization in Power BI  
Find the Power BI file here [Bike Share Dashboard.pbix](https://github.com/nishi-uthappa/Bike_share_data_analysis/blob/main/Bike%20Share%20Dashboard.pbix)  

- **DAX Measures (Power BI):**  DAX formulas were used within Power BI to create calculated measure, Profit Margin for analysis,  
```dax
Profit Margin = (SUM('public combined_bike_data'[revenue])-SUM('public combined_bike_data'[profit]))/SUM('public combined_bike_data'[revenue])
```
- **Power BI:**  Power BI was used to visualize the data and present the findings.
- A heatmap was created to illustrate revenue patterns by hour and day of the week.
- Bar charts were used to show revenue by season.
- A donut chart was used to show rider demographics.
- Slicer button was created to filter between the two years.


## Dashboard View  
![FINAL BIKE DASHBOARD](https://github.com/user-attachments/assets/a64a7b42-0e58-40ec-836c-00c373832cb8)

