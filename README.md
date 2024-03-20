# SQL PROJECT ON DEFORESTATION

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

THE FULL PROJECT CAN BE SEEN [HERE](https://github.com/Mercy-Coker/SQL/blob/main/SQL_PROJECT..sql)

### RESULTS AND FINDINGS

The analysis results are summarized as follows:

 - The total number of countries involved in the deforestation is 218

![image](https://github.com/Mercy-Coker/SQL/assets/163846267/ec596eda-6774-4e85-accd-d776edb78da1)

![image](https://github.com/Mercy-Coker/SQL/assets/163846267/02034ac1-7e2c-449d-b144-8ef1d3b9020f)

![image](https://github.com/Mercy-Coker/SQL/assets/163846267/f0ad4075-b601-4334-9d68-3b6493afe77a)

![image](https://github.com/Mercy-Coker/SQL/assets/163846267/22a08c96-c715-41bf-bbd8-be81236ec58a)

