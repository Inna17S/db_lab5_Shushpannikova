-- Select * from Artists;
-- Select * from Genre;
-- Select * from Songs;
-- Select * from Chart;
-- Select * from SongsGenre;
-- Select * from Track_Genre;
-- Select * from Position_energy;
-- Select * from Position_duration;


--1 запит - кількість треків у кожному жанрі
create view Track_Genre as select genre.genre_name, COUNT(Genre.genre_name) AS track_count
FROM SongsGenre
JOIN Genre ON SongsGenre.GenreID = Genre.GenreID
GROUP BY Genre.genre_name;


--2 запит - Вивести таблицю енергійності треку та його позицію в чарті
create view Position_energy as select Chart.position, Songs.energy
FROM Chart
JOIN Songs ON Chart.Song_ID = Songs.Song_ID;


--3 запит - Вивести таблицю тривалості треку та його позицію в чарті
create view Position_duration as SELECT Chart.position, Songs.duration_ms
FROM Chart
JOIN Songs ON Chart.Song_ID = Songs.Song_ID;