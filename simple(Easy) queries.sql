use MovieLens;

-- 1.Listing  all movies
select * from movies;

-- 2.Finding number of movies in dataset
select count(*) from movies;

-- 3.List all  genres
select distinct genres from movies;

-- 4.Find all movies in the "Comedy" genre
select * from movies where genres like "%comedy%";

-- 5.Show top 10 movies by movieId
select * from movies order by movieId limit 10;

-- 6.Count how many ratings each user has given.
select userId,count(*) as no_of_ratings from ratings group by userId;

-- 7.Find the average rating of all movies.
select avg(rating) from ratings;

-- 8.Show all tags used by user 18
select tag from tags where userId=18;

-- 9.Show all movies tagged with "classic"
select movieId from tags where tag ="classic";

-- 10.Find how many users rated the movie with movieId = 1
select count(*) from ratings where movieId=1;

-- 11.Find all ratings given in the year 2018
-- Timestamps represent seconds since midnight Coordinated Universal Time (UTC) of January 1, 1970.
select * from ratings where FROM_UNIXTIME(timestamp) like '2018%';

-- 12.Get the number of distinct users.
select count(distinct userId) from ratings;

-- 13.Get all movies released in 1995
select * from movies;
select * from movies where title like "%(1995)";

-- 14.Count tags per movie.
select movieId,count(*) as no_of_tags from tags group by movieId;

-- 15.Find the highest rating ever given
select max(rating) from ratings;

-- 16.List the 5 most given tags
select tag,count(*) as frequency  from tags group by tag order by frequency desc limit 5;

-- 17.List the 5 most recent tags
select tag from tags order by timestamp desc limit 5;

-- 18.Find all Sci-Fi movies
select * from movies;
select * from movies where genres like "%Sci-Fi%";

-- 19.Show all movies with multiple genres
select * from movies where genres like "%|%%";

-- 20.Find the total number of ratings
select count(*) as total_number_of_ratings from ratings;

-- 21.Find all movies without a genre listed
select * from movies where genres is NULL;











