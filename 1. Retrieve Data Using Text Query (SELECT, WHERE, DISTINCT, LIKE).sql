-- Retrieve Data Using Text Query (SELECT, WHERE, DISTINCT, LIKE)

-- Show all records from the movies table
SELECT * FROM moviesdb.movies;


-- Show all Bollywood movies
SELECT * FROM movies
WHERE industry = 'Bollywood';


-- Count total number of Bollywood movies
SELECT COUNT(*) AS No_Bollywood_Movies FROM movies
WHERE industry = 'Bollywood';


-- Show all Hollywood movies
SELECT * FROM movies
WHERE industry = 'Hollywood';


-- Show all unique industries
SELECT DISTINCT(industry) FROM movies;


-- Find movies with 'thor' in the title
SELECT * FROM movies
WHERE title LIKE '%thor%';


-- Count movies with Marvel studio
SELECT COUNT(*) AS Marvel_movies_count FROM movies
WHERE studio LIKE '%marvel%';


-- Show movies where studio field is empty
SELECT * FROM movies
WHERE studio = '';

-- Exercise
-- Print all movie titles and release year for all Marvel Studios movies
select title, release_year from movies
where studio = 'Marvel Studios';


-- Print all movies that have Avenger in their name
select * from movies
where title like '%avenger%';


-- Print the year in which "The Godfather" move was released
select release_year from movies
where title = 'The Godfather';


-- Print all distinct movie studios on Bollywood industry
select distinct(studio) from movies
where industry = 'Bollywood' and studio <> '';