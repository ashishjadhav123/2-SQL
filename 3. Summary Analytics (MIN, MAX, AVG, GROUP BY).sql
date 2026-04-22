-- Show all movies
SELECT * FROM movies;


-- Count total Bollywood movies
SELECT COUNT(*) AS Bolly_Movies FROM movies
WHERE industry = 'Bollywood';


-- Highest IMDB rating among Hollywood movies
SELECT MAX(imdb_rating) FROM movies
WHERE industry = 'Hollywood';


-- Highest IMDB rating among Bollywood movies
SELECT MAX(imdb_rating) FROM movies
WHERE industry = 'Bollywood';


-- Lowest IMDB rating among Bollywood movies
SELECT MIN(imdb_rating) FROM movies
WHERE industry = 'Bollywood';


-- Average IMDB rating of movies made by Marvel Studios
SELECT AVG(imdb_rating) FROM movies
WHERE studio LIKE '%marvel%';


-- Round IMDB rating of Zee studio movies up to 2 decimals
SELECT ROUND((imdb_rating), 2) AS Avg_Zee FROM movies
WHERE studio LIKE '%zee%';


-- Count number of movies per industry
SELECT COUNT(*), industry FROM movies
GROUP BY industry;


-- Highest IMDB rating per studio (excluding empty studio names)
SELECT studio, MAX(imdb_rating) FROM movies
WHERE studio <> ''
GROUP BY studio;


-- Average IMDB rating per industry (excluding empty studio names)
SELECT industry, AVG(imdb_rating) FROM movies
WHERE studio <> ''
GROUP BY industry;


-- Count movies per studio sorted by count in descending order
SELECT studio, COUNT(*) AS cnt FROM movies
WHERE studio <> ''
GROUP BY studio
ORDER BY cnt DESC;


-- Count movies & average IMDB rating per studio sorted by rating (desc)
SELECT studio, 
       COUNT(*) AS cnt,
       ROUND(AVG(imdb_rating), 2) AS Avg_IMDB 
FROM movies
WHERE studio <> ''
GROUP BY studio
ORDER BY Avg_IMDB DESC;


-- Exercise
-- How many movies were released between 2015 and 2022
select
	count(*) as Movies_cnt
from movies
where release_year between 2015 and 2022;


-- Print the max and min movie release year
select 
	max(release_year) as max_year,
    min(release_year) as min_year
from movies;


-- Print a year and how many movies were released in that year starting with the latest year
select 
	release_year,
    count(*) as movie_count
from movies
group by release_year
order by release_year desc;
	

