
-- Display all columns and rows from the items table
SELECT * FROM items;


-- Display all columns and rows from the variants table
SELECT * FROM variants;


-- Combine each item with each variant using CROSS JOIN
-- Create a new product name by concatenating variant_name with item name
-- Calculate the final price by adding item price + variant price, rounded to 2 decimal places
SELECT 
	*, 
    CONCAT(variant_name, ' - ', name) AS Product_name,
    ROUND((price + variant_price), 2) AS final_price
FROM items
CROSS JOIN variants;