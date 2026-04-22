-- Show movie and financial details for only matched movie IDs
SELECT 
    movies.movie_id, title, budget, revenue, currency, unit
FROM movies
JOIN financials
ON movies.movie_id = financials.movie_id;



-- Show highest budget and revenue per studio (excluding empty studios)
SELECT 
    movies.studio,
    MAX(budget) AS max_budget,
    MAX(revenue) AS max_revenue,
    MAX(financials.currency) AS currency
FROM movies
JOIN financials ON movies.movie_id = financials.movie_id
GROUP BY movies.studio
ORDER BY max_budget DESC;



-- LEFT JOIN: Show all movies even if financial data is missing
SELECT
    m.movie_id, m.title, f.budget, f.revenue, f.currency
FROM movies m
LEFT JOIN financials f ON m.movie_id = f.movie_id
ORDER BY f.budget DESC;



-- RIGHT JOIN: Show all financial records even if movie data is missing
SELECT
    m.movie_id, m.title, f.budget, f.revenue, f.currency
FROM movies m
RIGHT JOIN financials f ON m.movie_id = f.movie_id
ORDER BY f.budget DESC;



-- FULL JOIN equivalent in MySQL:
-- Combines LEFT JOIN + RIGHT JOIN results to include all movies and financials
SELECT
    m.movie_id, m.title, f.budget, f.revenue, f.currency
FROM movies m
LEFT JOIN financials f ON m.movie_id = f.movie_id
UNION
SELECT
    m.movie_id, m.title, f.budget, f.revenue, f.currency
FROM movies m
RIGHT JOIN financials f ON m.movie_id = f.movie_id
ORDER BY budget DESC;


-- Exercise - SQL Joins (INNER, LEFT, RIGHT, FULL)
-- 1. Show all the movies with their language names
select * from languages;

select * from movies;

SELECT
		m.title, l.name
FROM movies m
LEFT JOIN languages l ON m.language_id = l.language_id;


-- 2. Show all Telugu movie names (assuming you don't know the languageid for Telugu)
SELECT
		m.title, l.name
FROM movies m
LEFT JOIN languages l ON m.language_id = l.language_id
WHERE l.name = 'Telugu';


-- 3. Show the language and number of movies released in that language
SELECT
		l.name, count(m.language_id) as movies_count
FROM movies m
LEFT JOIN languages l ON m.language_id = l.language_id
GROUP BY l.name;