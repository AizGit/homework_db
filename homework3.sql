CREATE TABLE IF NOT EXISTS mus_genres
(
genre_id serial PRIMARY KEY,
name varchar (25) NOT NULL
);
INSERT INTO mus_genres(genre_id, name)
VALUES (1, "genre_1");
VALUES (2, "genre_2");
VALUES (3, "genre_3");

CREATE TABLE IF NOT EXISTS singers
(
singer_id serial PRIMARY KEY,
nickname varchar (100) NOT NULL
);
INSERT INTO singers(singer_id, nickname)
VALUES (1, "singer_1");
VALUES (2, "singer_2");
VALUES (3, "singer_3");
VALUES (4, "singer_4");

CREATE TABLE IF NOT EXISTS mus_albums
(
mus_album_id serial PRIMARY KEY REFERENCES track(mus_album_id),
name varchar (25) NOT NULL,
year date NOT NULL,
singer_id int NOT NULL
);
INSERT INTO mus_albums(mus_album_id, name, year)
VALUES (1, "album_1", 2018);
VALUES (2, "album_2", 2019);
VALUES (3, "album_3", 2020);
VALUES (4, "album_4", 2021);

CREATE TABLE IF NOT EXISTS mus_genres_singers
(
genr_id int REFERENCES mus_genres(genre_id),
sing_id int REFERENCES singers(singer_id),
sing_id int REFERENCES mus_albums(singer_id),
mus_alb_id int REFERENCES mus_albums(mus_album_id),
CONSTRAINT mus_genres_singers_pk PRIMARY KEY(genr_id, sing_id, mus_alb_id)
);



CREATE TABLE IF NOT EXISTS collections
(
collection_id serial PRIMARY KEY REFERENCES tracks(track_id),
name varchar (25) NOT NULL,
year date NOT NULL,
track_id int NOT NULL
);
INSERT INTO collections(collection_id, name, year)
VALUES (1, "collection_1", 2018);
VALUES (2, "collection2", 2019);
VALUES (3, "collection_3", 2020);
VALUES (4, "collection_4", 2021);

CREATE TABLE IF NOT EXISTS tracks
(
track_id serial PRIMARY KEY,
track_name varchar (100) NOT NULL,
duration numeric (3,2) NOT NULL,
mus_album_id int NOT NULL
);
INSERT INTO tracks(track_id, track_name, duration)
VALUES (1, "track_1", 4);
VALUES (2, "mytrack_2", 3);
VALUES (3, "track_3", 3);
VALUES (4, "track_4", 3);
VALUES (5, "track_5", 4);
VALUES (6, "track_6", 2);

SELECT nickname, name FROM singers s
LEFT JOIN mus_genres m ON s.singer_id = m.genre_id;

SELECT track_name, name COUNT(amount)  FROM tracks s
LEFT JOIN mus_albums m ON s.track_id = m.track_id
WHERE name BETWEEN 2019 AND 2020
GROUP BY track_name, name;

SELECT AVG (length) FROM tracks;

SELECT  nickname
FROM singers 
WHERE id NOT IN (
    SELECT DISTINCT id 
    FROM mus_albums
    WHERE year = 2020
    );
    
SELECT name, nickname 
FROM collections s
LEFT JOIN singers m ON s.collection_id = m.collection_id
WHERE nickname = 'singer_2'
ORDER BY name;






