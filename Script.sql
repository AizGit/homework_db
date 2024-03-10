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
INSERT INTO mus_albums(mus_album_id, name)
VALUES (1, "album_1");
VALUES (2, "album_2");
VALUES (3, "album_3");
VALUES (4, "album_4");

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
INSERT INTO collections(collection_id, name)
VALUES (1, "collection_1");
VALUES (2, "collection_2");
VALUES (3, "collection_3");
VALUES (4, "collection_4");

CREATE TABLE IF NOT EXISTS tracks
(
track_id serial PRIMARY KEY,
track_name varchar (100) NOT NULL,
duration numeric (3,2) NOT NULL,
mus_album_id int NOT NULL
);
INSERT INTO tracks(track_id, track_name)
VALUES (1, "track_1");
VALUES (2, "track_2");
VALUES (3, "track_3");
VALUES (4, "track_4");
VALUES (5, "track_5");
VALUES (6, "track_6");
