-- View all data from the financials table
SELECT * FROM financials;


-- Calculate profit (Revenue - Budget) for all movies
SELECT 
	m.movie_id, 
    m.title, 
    f.budget, 
    f.revenue, 
    f.unit,
    ROUND((f.revenue - f.budget), 2) AS profit
FROM movies m
INNER JOIN financials f ON m.movie_id = f.movie_id;


-- Show profit only for Bollywood movies and sort by highest profit
SELECT 
	m.movie_id, 
    m.title, 
    f.budget, 
    f.revenue, 
    f.unit,
    ROUND((f.revenue - f.budget), 2) AS profit
FROM movies m
INNER JOIN financials f ON m.movie_id = f.movie_id
WHERE m.industry = 'Bollywood'
ORDER BY profit DESC;


-- Convert all profits to 'Million' unit and show Bollywood movies only
SELECT 
	m.movie_id, 
    m.title, 
    f.budget, 
    f.revenue, 
    f.unit,
    CASE
		WHEN f.unit = 'Thousands' THEN ROUND((f.revenue - f.budget) / 1000, 2)  -- Convert thousands → millions
        WHEN f.unit = 'Billions' THEN ROUND((f.revenue - f.budget) * 1000, 2)  -- Convert billions → millions
        WHEN f.unit = 'Millions' THEN ROUND((f.revenue - f.budget), 2)         -- Already in millions
    END AS profit_Mill
FROM movies m
INNER JOIN financials f ON m.movie_id = f.movie_id
WHERE m.industry = 'Bollywood'
ORDER BY profit_Mill DESC;
