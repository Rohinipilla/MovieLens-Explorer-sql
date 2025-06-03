use movielens;

-- 1.Find top 10 highest-rated movies (with at least 10 ratings)
-- to know the movies with highest rating we have to have the movies table and ratings table 

select r.movieId,m.title,avg(r.rating) as avg_rating , count(*) as num_ratings
from ratings r
join movies m on r.movieId = m.movieId
group by r.movieId
having num_ratings>=10
order by avg_rating desc
limit 10;

-- 2.Get the total number of tags used per user.
select userId,count(*) as total_tags from tags group by userId;

-- 3.Find the number of movies released each year
select substring_index(substring_index(title,'(',-1),')',1) as year,
count(*) as movies_count from movies
group by year
order by year;

-- 4.List all users who rated more than 50 movies 
select userId from ratings group by userId having count(*)>50;

-- 5.Find users who have tagged and rated the same movie. 
select distinct r.userId,r.movieId,r.rating,t.tag
from ratings r
join tags t on r.userId = t.userId and r.movieId = t.movieId;

-- 6.List movies with more than 5 tags
select movieId from tags group by movieId having count(*)>5;

-- 7.Find movies with no ratings. 
select * from movies where movieId not in (
	select distinct movieId from ratings);
    
-- 8.Find users who gave 5-star ratings 
select distinct userId from ratings where rating = 5;

-- 9.List top 5 most active users. 
select userId,count(*) as rating_count from ratings
group by userId
order by rating_count desc
limit 5;

-- 10.Count how many tags contain the word "funny" 
select count(*) from tags where tag like "%funny%";

-- 11.Find the oldest and most recent rating timestamp.
select min(from_unixtime(timestamp)),max(from_unixtime(timestamp)) from ratings;

-- 12.Show top 3 genres by number of ratings 
select m.genres, count(*) as rating_count
from ratings r
join movies m on r.movieId = m.movieId
group by genres
order by rating_count desc
limit 3;

-- 13.List movies rated more than 100 times 
select movieId,count(*) as rating_count from ratings
group by movieId
having rating_count>100;

-- 14.Find the movie with the most tags. 
select m.title ,count(*) as tag_count from tags t
join movies m on m.movieId = t.movieId
group by t.movieId
order by tag_count desc
limit 1;

-- 15.Find the top 5 tagged genres
select m.genres ,count(*) as tag_count from tags t
join movies m on m.movieId = t.movieId
group by m.genres
order by tag_count desc
limit 5;

-- 16.List users who only gave 5-star ratings 
select userId from ratings
group by userId
having min(rating)=5.0 and max(rating)=5.0;


-- 17.Average number of tags per user. 
select avg(tag_count) from (
select userId,count(*) as tag_count from tags group by userId
) as avg_tags_user;
