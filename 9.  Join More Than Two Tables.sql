-- Show each movie with each actor individually (row-wise list)
SELECT 
	m.title, 
    a.name
FROM movies m
JOIN movie_actor ma ON m.movie_id = ma.movie_id
JOIN actors a ON ma.actor_id = a.actor_id;


-- Show each movie with all actors in a comma-separated list
SELECT 
	m.title, 
    GROUP_CONCAT(a.name) AS Actors
FROM movies m
JOIN movie_actor ma ON m.movie_id = ma.movie_id
JOIN actors a ON ma.actor_id = a.actor_id
GROUP BY m.movie_id;


-- Show each movie with actors separated using a " | " symbol
SELECT 
	m.title, 
    GROUP_CONCAT(a.name SEPARATOR ' | ') AS Actors
FROM movies m
JOIN movie_actor ma ON m.movie_id = ma.movie_id
JOIN actors a ON ma.actor_id = a.actor_id
GROUP BY m.movie_id;


-- Show each actor with the list of movies they acted in
SELECT 
	a.name, 
    GROUP_CONCAT(m.title) AS Movies
FROM actors a
JOIN movie_actor ma ON a.actor_id = ma.actor_id
JOIN movies m ON m.movie_id = ma.movie_id
GROUP BY a.actor_id;


SELECT 
	a.name, 
    GROUP_CONCAT(m.title) AS Movies,
    count(m.title) as Movies_count
FROM actors a
JOIN movie_actor ma ON a.actor_id = ma.actor_id
JOIN movies m ON m.movie_id = ma.movie_id
GROUP BY a.actor_id
order by Movies_count desc;


-- 1. Generate a report of all Hindi movies sorted by their revenue amount in millions.
-- Print movie name, revenue, currency, and unit

select 
	m.title,
    f.revenue,
    f.currency,
    f.unit,
    case
		when f.unit = 'Billions' then round(f.revenue * 1000, 2)
        when f.unit = 'Thousands' then round(f.revenue / 1000, 2)
        when f.unit = 'Millions' then round(f.revenue)
    end as Mil_revenue
from movies m
join languages l on m.language_id = l.language_id
join financials f on m.movie_id = f.movie_id
where l.name = 'Hindi'
order by Mil_revenue desc;





