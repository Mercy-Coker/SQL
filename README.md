# SQL PROJECT ON DEFORESTSTION

### PROJECT OVERVIEW

This data analysis project aims to provide insights into deforestation across various countries over the past years. BY analyzing various features of the deforestation data, we seek to identify the countries involved, the income group of the countries in various regions, and gain a deeper understsnding of the deforestation problems through anwering questions related to deforestation.

### DATA SOURCES

Deforestation Datasets: The datasets used for this analysis includes the "Region.csv", Land_Area.csv" and "Forest_Area.csv" files, containing detailed information about each Data.

### TOOLS

SQL Server - Data cleaning and data analysis.

### CLEANING / PREPARATION

- Data loading and inspection
- Handling null values
- Data cleaning and formatting

### EXPLORATORY DATA ANALYSIS (EDA)

EDA involved exploring the deforestation datasets to answer key questions such as:
- What are the total number of countries involved in deforestation? 
- Show the income groups of countries having total area ranging from 75,000 to 150,000 square meter.
- Calculate average area in square miles for countries in the 'upper middle income region'. Compare the result with the rest of the income categories.
- Determine the total forest area in square km for countries in the 'high income' group. Compare result with the rest of the income categories.
- Show countries from each region(continent) having the highest total forest areas. 

### DATA ANALYSIS

~~~SQL
SELECT L.country_name, R.income_group, L.total_area_sq_mi FROM Region R
JOIN Land_Area L ON 
R.Country_code = L.Country_code
WHERE total_area_sq_mi BETWEEN 75000 AND 150000
GROUP BY L.country_name, R.income_group, L.total_area_sq_mi
ORDER BY R.income_group DESC;
~~~

