DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;

CREATE TABLE plans(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    price DOUBLE NOT NULL
) engine = InnoDB;

CREATE TABLE artists(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
) engine = InnoDB;

CREATE TABLE users(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    plan_id INT NOT NULL,
    FOREIGN KEY (plan_id) REFERENCES plans(id)
) engine = InnoDB;

CREATE TABLE following(
    id INT NOT NULL,
    artist_id INT,
    FOREIGN KEY (id) REFERENCES users(id),
    FOREIGN KEY (artist_id) REFERENCES artists(id),
    CONSTRAINT PRIMARY KEY(id, artist_id)
) engine = InnoDB;

CREATE TABLE albums(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    artist_id INT NOT NULL,
    release_year YEAR(4) NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artists(id)
) engine = InnoDB;

CREATE TABLE songs(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    song_duration INT NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES albums(id)
) engine = InnoDB;

CREATE TABLE history(
    user_id INT NOT NULL,
    song_id INT NOT NULL,
    reproduction_date DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (song_id) REFERENCES songs(id),
    CONSTRAINT PRIMARY KEY(song_id, user_id)
) engine = InnoDB;

INSERT INTO plans(id, name, price)
VALUES
  (1, 'gratuito', 0.00),
  (2, 'familiar', 7.99),
  (3, 'universitario', 5.99),
  (4, 'pessoal', 6.99);

INSERT INTO users(id, name, age, plan_id)
VALUES
  (1, 'Barbara Liskov', '82', 1),
  (2, 'Robert Cecil Martin', 58, 1),
  (3, 'Ada Lovelace', 37, 2),
  (4, 'Martin Fowler', 46, 2),
  (5, 'Sandi Metz', 58, 2),
  (6, 'Paulo Freire', 19, 3),
  (7, 'Bell Hooks', 26, 3),
  (8, 'Christopher Alexander', 85, 4),
  (9, 'Judith Butler', 45, 4),
  (10, 'Jorge Amado', 58, 4);

INSERT INTO artists(id, name)
VALUES
  (1, 'Beyoncé'),
  (2, 'Queen'),
  (3, 'Elis Regina'),
  (4, 'Baco Exu do Blues'),
  (5, 'Blind Guardian'),
  (6, 'Nina Simone');

INSERT INTO following(id, artist_id)
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
  (6, 6),
  (6, 1),
  (7, 6),
  (9, 3),
  (10, 2);

INSERT INTO albums(id, name, artist_id, release_year)
VALUES
  (1,	'Renaissance', 1, 2022),
  (2,	'Jazz', 2, 1978),
  (3,	'Hot Space', 2, 1982),
  (4,	'Falso Brilhante', 3, 1998),
  (5,	'Vento de Maio', 3, 2001),
  (6,	'QVVJFA?', 4, 2003),
  (7,	'Somewhere Far Beyond', 5, 2007),
  (8,	'I Put A Spell On You', 6, 2012);

INSERT INTO songs(id, name, song_duration, album_id)
VALUES
  (1,	'BREAK MY SOUL', 279, 1),
  (2,	'VIRGO''S GROOVE', 369, 1),
  (3,	'ALIEN SUPERSTAR', 116, 1),
  (4,	'Don''t Stop Me Now', 203, 2),
  (5,	'Under Pressure', 152, 3),
  (6,	'Como Nossos Pais', 105, 4),
  (7,	'O Medo de Amar é o Medo de Ser Livre', 207, 5),
  (8,	'Samba em Paris', 267, 6),
  (9,	'The Bard''s Song', 244, 7),
  (10, 'Feeling Good', 100, 8);

INSERT INTO history(user_id, song_id, reproduction_date)
VALUES
  (1, 8, "2022-02-28 10:45:55"),
  (1, 2, "2020-05-02 05:30:35"),
  (1, 10, "2020-03-06 11:22:33"),
  (2, 10, "2022-08-05 08:05:17"),
  (2, 7, "2020-01-02 07:40:33"),
  (3, 10, "2020-11-13 16:55:13"),
  (3, 2, "2020-12-05 18:38:30"),
  (4, 8, "2021-08-15 17:10:10"),
  (5, 8, "2022-01-09 01:44:33"),
  (5, 5, "2020-08-06 15:23:43"),
  (6, 7, "2017-01-24 00:31:17"),
  (6, 1, "2017-10-12 12:35:20"),
  (7, 4, "2011-12-15 22:30:49"),
  (8, 4, "2012-03-17 14:56:41"),
  (9, 9, "2022-02-24 21:14:22"),
  (10, 3, "2015-12-13 08:30:22");