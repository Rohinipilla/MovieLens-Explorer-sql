-- Creating the database MovieLens
Create database MovieLens;

-- using the database
use MovieLens;

-- Creating the tables

-- creating Movies Table
CREATE TABLE movies (
    movieId INT PRIMARY KEY,
    title VARCHAR(255),
    genres VARCHAR(255)
);

-- creating ratings table
CREATE TABLE ratings (
    userId INT,
    movieId INT,
    rating FLOAT,
    timestamp BIGINT,
    FOREIGN KEY (movieId) REFERENCES movies(movieId)
);

-- creating tags tavle
CREATE TABLE tags (
    userId INT,
    movieId INT,
    tag VARCHAR(255),
    timestamp BIGINT,
    FOREIGN KEY (movieId) REFERENCES movies(movieId)
);

-- creating Links table
CREATE TABLE links (
    movieId INT PRIMARY KEY,
    imdbId INT,
    tmdbId INT,
    FOREIGN KEY (movieId) REFERENCES movies(movieId)
);