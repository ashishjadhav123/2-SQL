-- Retrieve all actor records
SELECT * FROM actors;


-- Show all actor details and calculate their age using birth year
SELECT *, (YEAR(CURDATE()) - birth_year) AS age FROM actors;


-- Retrieve all financial records
SELECT * FROM financials;


-- Show financial details and calculate profit (revenue - budget)
SELECT *, (revenue - budget) AS profit FROM financials;


-- Convert revenue to INR if currency is USD (using IF condition)
SELECT *,
    IF(currency = 'USD', revenue * 89, revenue) AS INR_Revenue
FROM financials;


-- Standardize revenue to millions using CASE:
-- If revenue is in Billions → convert to Millions (*1000)
-- If revenue is in Thousands → convert to Millions (/1000)
-- Else leave as is
SELECT *,
    CASE
        WHEN unit = 'Billions' THEN revenue * 1000
        WHEN unit = 'Thousands' THEN revenue / 1000
        ELSE revenue
    END AS mil_revenue
FROM financials;


--  Print profit % for all the movies
select *, 
((revenue - budget) / budget) * 100 as profit_percentage
from financials;
