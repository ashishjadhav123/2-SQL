-- Show movies with IMDB rating greater than or equal to 9
SELECT * FROM movies
WHERE imdb_rating >= 9;


-- Show movies with IMDB rating between 6 and 9
SELECT * FROM movies
WHERE imdb_rating BETWEEN 6 AND 9;


-- Show movies released in the years 2022, 2019, or 2018
SELECT * FROM movies
WHERE release_year IN (2022, 2019, 2018);


-- Show movies where IMDB rating is missing (NULL)
SELECT * FROM movies
WHERE imdb_rating IS NULL;


-- Show all movies ordered by release year (latest first)
SELECT * FROM movies
ORDER BY release_year DESC;


-- Show all movies ordered by IMDB rating (ascending)
SELECT * FROM movies
ORDER BY imdb_rating;


-- Show Bollywood movies ordered by IMDB rating (highest first)
SELECT * FROM movies
WHERE industry = 'Bollywood'
ORDER BY imdb_rating DESC;


-- Show top 5 Hollywood movies by IMDB rating (highest first)
SELECT * FROM movies
WHERE industry = 'hollywood'
ORDER BY imdb_rating DESC LIMIT 5;


-- Skip first 3 and show next 5 Hollywood movies by rating
SELECT * FROM movies
WHERE industry = 'hollywood'
ORDER BY imdb_rating DESC LIMIT 5 OFFSET 3;


-- Exercise
-- Print all movies in the order of their release year (latest first)
select * from movies
order by release_year desc;


--  All movies released in the year 2022
select * from movies
where release_year = 2022;


-- Now all the movies released after 2020
select * from movies
where release_year > 2020;


-- All movies after the year 2020 that have more than 8 rating
select * from movies
where release_year > 2020
and imdb_rating > 8;


-- Select all movies that are by either Marvel Studios or Hombale Films
select * from movies
where studio IN ('Marvel Studios', 'Hombale Films');


-- Select all THOR movies by their release year
select * from movies
where title like '%thor%'
order by release_year;


-- Select all movies that are not from Marvel Studios
select * from movies
where studio not like '%marvel%';

select * from movies
where studio not in ('Marvel Studios');
