SELECT * FROM Forest_Area;
SELECT * FROM Land_Area;
SELECT * FROM Region;

SELECT DISTINCT country_name FROM Forest_Area;

SELECT * FROM Forest_Area
WHERE year IS NULL;

SELECT * FROM Forest_Area
WHERE country_code IS NULL;

SELECT * FROM Forest_Area
WHERE forest_area_sqkm IS NULL;

--CALCULATING THE MEDIAN

SELECT DISTINCT PERCENTILE_CONT(0.5)
WITHIN GROUP (ORDER BY forest_area_sqkm) OVER() AS 'MEDIAN'
FROM Forest_Area;

-- REPLACING THE NULL VALUES WITH THE MEDIAN

UPDATE Forest_Area SET forest_area_sqkm = 
(SELECT DISTINCT PERCENTILE_CONT(0.5)
WITHIN GROUP (ORDER BY forest_area_sqkm) OVER() AS 'MEDIAN'
FROM Forest_Area)
WHERE forest_area_sqkm IS NULL;

SELECT * FROM Land_Area
WHERE country_code IS NULL;

SELECT * FROM Land_Area
WHERE country_name IS NULL;

SELECT * FROM Land_Area
WHERE total_area_sq_mi IS NULL;

SELECT DISTINCT PERCENTILE_CONT(0.5)
WITHIN GROUP (ORDER BY total_area_sq_mi) OVER() AS 'MEDIAN'
FROM Land_Area;

-- REPLACING THE NULL VALUES WITH THE MEDIAN

UPDATE Land_Area SET total_area_sq_mi = 
(SELECT DISTINCT PERCENTILE_CONT(0.5)
WITHIN GROUP (ORDER BY total_area_sq_mi) OVER() AS 'MEDIAN'
FROM Land_Area)
WHERE total_area_sq_mi IS NULL;

SELECT * FROM Region
WHERE country_code IS NULL;

SELECT * FROM Region 
WHERE income_group IS NULL;

SELECT DISTINCT income_group FROM Region;

SELECT DISTINCT year FROM Forest_Area;

-- CALCULATING THE TOTAL NUMBER OF COUNTRIES INVOLVED IN DEFORESTATION

SELECT COUNT(DISTINCT Country_name) AS Total_number_of_countries FROM Forest_Area;

--Show the income groups of countries having total area ranging from 75,000 to 150,000 square meter

SELECT * FROM Region R
JOIN Land_Area L ON 
R.Country_code = L.Country_code;

SELECT L.country_name, R.income_group, L.total_area_sq_mi FROM Region R
JOIN Land_Area L ON 
R.Country_code = L.Country_code
WHERE total_area_sq_mi BETWEEN 75000 AND 150000
GROUP BY L.country_name, R.income_group, L.total_area_sq_mi
ORDER BY R.income_group DESC;

SELECT DISTINCT income_group FROM Region R
JOIN Land_Area L ON 
R.Country_code = L.Country_code; 

/* Calculate average area in square miles for countries in the 'upper middle income region'.
Compare the result with the rest of the income categories */

SELECT AVG(total_area_sq_mi) AS UMI_Average_Area FROM
Region R JOIN Land_Area L ON 
R.Country_code = L.Country_code
WHERE income_group = 'UPPER MIDDLE INCOME';
SELECT AVG(total_area_sq_mi) AS LMI_Average_Area FROM
Region R JOIN Land_Area L ON 
R.Country_code = L.Country_code
WHERE income_group = 'LOWER MIDDLE INCOME';
SELECT AVG(total_area_sq_mi) AS HI_Average_Area FROM
Region R JOIN Land_Area L ON 
R.Country_code = L.Country_code
WHERE income_group = 'HIGH INCOME';
SELECT AVG(total_area_sq_mi) AS LI_Average_Area FROM
Region R JOIN Land_Area L ON 
R.Country_code = L.Country_code
WHERE income_group = 'LOW INCOME';


SELECT * FROM Forest_Area;

/* Determine the total forest area in square km for countries in the 'high income' group. 
Compare result with the rest of the income categories */

SELECT SUM(forest_area_sqkm) AS HI_Total_forest_area 
FROM Forest_Area F JOIN Region R ON 
F.country_code=R.country_code
WHERE income_group = 'HIGH INCOME';
SELECT SUM(forest_area_sqkm) AS LI_Total_forest_area 
FROM Forest_Area F JOIN Region R ON 
F.country_code=R.country_code
WHERE income_group = 'LOW INCOME';
SELECT SUM(forest_area_sqkm) AS UMI_Total_forest_area 
FROM Forest_Area F JOIN Region R ON 
F.country_code=R.country_code
WHERE income_group = 'UPPER MIDDLE INCOME';
SELECT SUM(forest_area_sqkm) AS LMI_Total_forest_area 
FROM Forest_Area F JOIN Region R ON 
F.country_code=R.country_code
WHERE income_group = 'LOWER MIDDLE INCOME';

-- Show countries from each region(continent) having the highest total forest areas.

SELECT country_name, region, 
(SELECT MAX(forest_area_sqkm) 
FROM Forest_Area WHERE Forest_Area.country_code = Region.country_code) AS Highest_forest_area 
FROM Region
ORDER BY Highest_forest_area DESC;

SELECT * FROM Forest_Area;
SELECT * FROM Land_Area;
SELECT * FROM Region;

-- Country with highest total Area.

SELECT country_name, total_area_sq_mi
FROM Land_Area
WHERE total_area_sq_mi = (SELECT MAX(total_area_sq_mi) HTLA FROM Land_Area);

-- Country with lowest total Area.

SELECT DISTINCT country_name, total_area_sq_mi FROM Land_Area
WHERE total_area_sq_mi = (SELECT MIN(total_area_sq_mi) LTLA FROM Land_Area);

-- Country with highest Forest Area.

SELECT country_name,forest_area_sqkm FROM Forest_Area
WHERE forest_area_sqkm = (SELECT MAX(forest_area_sqkm) HTFA FROM Forest_Area);

-- Country with lowest Forest Area

SELECT TOP 1 country_name,forest_area_sqkm
FROM Forest_Area
WHERE forest_area_sqkm = (SELECT MIN(forest_area_sqkm) LTFA FROM Forest_Area);
