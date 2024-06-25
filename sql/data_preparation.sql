- - Overview of Dataset --
SELECT *
FROM bankchurners
LIMIT 10;

- - Checking for Unique Records --
SELECT
COUNT(*) AS total_records,
COUNT(DISTINCT CLIENTNUM) AS distinct_records
FROM bankchurners;
-- We have 10127 records with no duplicated clients --

- - Checking for Missing Values in key categories --
SELECT
COUNT(*) AS null_values
FROM bankchurners
WHERE
Attrition_Flag IS NULL
OR
Gender IS NULL
OR
Income_Category IS NULL
OR
Credit_Limit IS NULL
OR
Avg_Utilization_Ratio IS NULL;
-- There are no null values in key fields --

- - Selecting the data that we need to explore --
With final_data AS(SELECT
CLIENTNUM, Customer_Age, Gender, Dependent_count, Education_Level, Marital_Status,
Income_Category, Months_on_book, Credit_Limit, Total_Revolving_Bal, Total_Trans_Amt, Total_Trans_Ct, Avg_Utilization_Ratio
FROM bankchurners
WHERE
Attrition_Flag = "Existing Customer"
AND
Months_on_book >= 12
AND
(AVG_Utilization_Ratio BETWEEN 0.001 AND 0.30)
AND
Income_Category <> "Unknown"
ORDER BY Dependent_count ASC)

SELECT *
FROM final_data;