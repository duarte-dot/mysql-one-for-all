DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;

CREATE TABLE SpotifyClone.plans(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    price DOUBLE NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.artists(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
) engine = InnoDB;

CREATE TABLE SpotifyClone.users(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    plan_id INT NOT NULL,
    sign_in_date DATE NOT NULL,
    FOREIGN KEY (plan_id) REFERENCES plans(id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.followers(
    user_id INT NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (artist_id) REFERENCES artists(id),
    CONSTRAINT PRIMARY KEY(user_id, artist_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.albums(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(80) NOT NULL
    artist_id INT NOT NULL,
    release_year YEAR(4) NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artists(id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.songs(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES albums(id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.history(
    user_id INT NOT NULL,
    song_id INT NOT NULL,
    reproduction_date DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (song_id) REFERENCES songs(id),
    CONSTRAINT PRIMARY KEY(song_id, user_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.plans (id, name, price)
VALUES
  (1, 'gratuito', '0'),
  (2, 'familiar', '7.99'),
  (3, 'universitário', '5.99');
  (4, 'pessoal', '6.99');

INSERT INTO SpotifyClone.users (name, age, plan_id, sign_in_date)
VALUES
  ('Barbara Liskov', '82', 1, '2019-10-20'),
  ('Robert Cecil Martin', 58, 1, '2017-01-06'),
  ('Ada Lovelace', 37, 2, '2017-12-30'),
  ('Martin Fowler', 46, 2, '2017-01-17'),
  ('Sandi Metz', 58, 2, '2018-04-29'),
  ('Paulo Freire', 19, 3, '2018-02-14'),
  ('Bell Hooks', 26, 3, '2018-01-05'),
  ('Christopher Alexander', 85, 4, '2019-06-05'),
  ('Judith Butler', 45, 4, '2020-05-13'),
  ('Jorge Amado', 58, 4, '2017-02-17');

INSERT INTO SpotifyClone.artists (id, name)
VALUES
  (1, 'Beyoncé'), 
  (2, 'Queen'), 
  (3, 'Elis Regina'), 
  (4, 'Baco Exu do Blues'), 
  (5, 'Blind Guardian'), 
  (6, 'Nina Simone');

INSERT INTO SpotifyClone.followers (user_id, artist_id, sign_in_date)
VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 1),
  (6, 6),
  (7, 6),
  (9, 3),
  (10, 2);

INSERT INTO SpotifyClone.albums (name, artist_id, release_year)
VALUES
  ('Renaissance', 1, 2022),
  ('Jazz', 2, 1978),
  ('Hot Space', 3, 1982),
  ('Falso Brilhante', 4, 1998),
  ('Vinte de Maio', 5, 2001),
  ('QVVJFA?', 6, 2003),
  ('Somewhere Far Beyond', 7, 2007),
  ('I Put A Spell On You', 8, 2012);

INSERT INTO SpotifyClone.songs (name, album_id)
VALUES
  ('BREAK MY SOUL', 1),
  ("VIRGO'S GROOVE", 1),
  ('ALIEN SUPERSTAR', 1),
  ("DON'T STOP ME NOW", 2),
  ('UNDER PRESSURE', 3),
  ('Como Nossos Pais', 4),
  ('O Medo de Amar é o Medo de Ser Livre', 5),
  ('Samba em Paris', 6),
  ("The Bard's Song", 7),
  ('Feeling Good', 8),


INSERT INTO SpotifyClone.history (user_id, song_id, reproduction_date)
VALUES
  (1, 2, "2020-05-02 05:30:35"),
  (1, 8, "2022-02-28 10:45:55"),
  (1, 10, "2020-03-06 11:22:33"),
  (2, 7, "2020-01-02 07:40:33"),
  (2, 10, "2022-08-05 08:05:17"),
  (3, 2, "2020-12-05 18:38:30"),
  (3, 10, "2020-11-13 16:55:13"),
  (4, 8, "2021-08-15 17:10:10"),
  (5, 5, "2020-08-06 15:23:43"),
  (5, 8, "2022-01-09 01:44:33"),
  (6, 1, "2017-10-12 12:35:20"),
  (6, 7, "2017-01-24 00:31:17"),
  (7, 4, "2011-12-15 22:30:49"),
  (8, 4, "2012-03-17 14:56:41"),
  (9, 9, "2022-02-24 21:14:22"),
  (10, 3, "2015-12-13 08:30:22");
