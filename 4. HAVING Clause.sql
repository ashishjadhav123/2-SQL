
-- Count number of movies released each year, show only years with more than 2 movies,
-- and sort results by movie count in descending order

select 
	release_year,
    count(*) as movies_count
from movies
group by release_year
having movies_count > 2
order by movies_count desc;