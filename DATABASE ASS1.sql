-- 1, Write a quary in SQL to find the name and year of the movies.alter

Select mov_title AS 'Movie Title' , mov_year AS 'Year of Movie'
From movie;

-- 2, Write a Query in SQL to find the year when the movie American Beauty released.alter

Select mov_title AS 'Movie Title', mov_year AS 'year of release'
From movie
Where mov_title = 'American Beauty';

-- 3, Write a query in SQL to find the movie which was released in the year 1999
Select mov_title AS 'Movie Title'
From movie
Where mov_year = 1999;

-- 4, Write a query in SQL to find the movie which was released before 1998
select mov_title As 'movie Title'
From Movie
Where mov_year < 1998;

-- 6, Write a query in SQL to return the name of all reviewers and name of movies together in a single list
Select rev_name As 'name of Reviewer', mov_title AS 'Movie Title'
From rating
Join reviewer
using(rev_id)
Where rev_name IS NOT NULL;


-- 7, Write a query in SQL to find the name of all reviewers who have 7 or more starts to their
-- rating

SELECT rev_name AS 'name of Reviewer'
From reviewer
Where rev_name IS NOT NULL AND rev_id IN (
Select rev_id
From rating
Where rev_stas >= 7
);

-- 8, Write a query in SQL to find the title of all movie that have no ratings

Select mov_titlte AS 'Movie Title'
From movie
Where mov_id IN(
Select mov_id
From rating 
Where num_o_rating IS NULL
);

-- 9, Write a query in SQL to find  the name of all reviewers who have rated their rating with a NULL
-- values

Select rev_name AS 'Name of reviewer'
from reviewer
Where rev_id IN(
Select rev_id
From rating
Where rev_stars IS NULL
);

-- 10, Write a query in SQL to find the name of movie and director (first and last names) who directed a movie

Select mov_title As 'movie Title', dir_from AS `Director's First Name`,  dir_lname AS `Director's Last Name`
From movie_direction
Join movie
Using (mov_id)
Join director
Using(dir_id)
Where mov_title = 'Eyes wde Shut' AND mov_id IN(
Select mov_id
From movie_cast
Where role IS NOT NULL

);

-- OR
Select mov_title, dir_fname, dir_lname
From movie_direction
Join movie
Using (mov_id)
Join director
Using(dir_id)
Where mov_title = 'Eyes wide Shut'
