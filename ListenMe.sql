-- Buat Database
CREATE DATABASE IF NOT EXISTS listenme;
USE listenme;

-- Tabel Bundling
CREATE TABLE IF NOT EXISTS Bundlings(
    bundling_id int(10) NOT NULL AUTO_INCREMENT,
    bundling_name varchar(255) NOT NULL,
    bundling_price bigint(255) NOT NULL,
    access_level int(1) NOT NULL,
    PRIMARY KEY (bundling_id)
);

INSERT INTO Bundling (bundling_id) VALUES ('1','2','3','4')
INSERT INTO Bundling (bundling_name) VALUES ('Paket Harian','Paket Mingguan','Paket Bulanan','Paket Tahunan')
INSERT INTO Bundling (bundling_price) VALUES ('Rp.2.000','Rp.7.500','Rp.45.000','Rp.250.000')
INSERT INTO Bundling (access_level) VALUES ('1','2','3','4')

-- Tabel User
CREATE TABLE IF NOT EXISTS Users(
    user_id int(10) NOT NULL AUTO_INCREMENT,
    username varchar(255) NOT NULL,
    password varchar(255) NOT NULL,
    name varchar(255) NOT NULL,
    gender varchar(2) NOT NULL,
    email varchar(255) NOT NULL,
    bundling_id int(10) NOT NULL,
    PRIMARY KEY (user_id),
    FOREIGN KEY (bundling_id) REFERENCES Bundlings(bundling_id)
);

INSERT INTO User (user_id) VALUES ('1');
INSERT INTO User (username) VALUES ('zeddonly');
INSERT INTO User (password) VALUES ('aezakmi123');
INSERT INTO User (name) VALUES ('zedd');
INSERT INTO User (gender) VALUES ('L');
INSERT INTO User (email) VALUES ('dunno@gmail.com');
INSERT INTO User (bundling_id) VALUES ('1');

-- Tabel Payment Methods
CREATE TABLE IF NOT EXISTS PaymentMethods(
    payment_methods_id int(10) NOT NULL AUTO_INCREMENT,
    payment_methods_name varchar(255) NOT NULL,
    payment_methods_details varchar(255) NOT NULL,
    PRIMARY KEY(payment_methods_id)
);

INSERT INTO PaymentMethods (payment_methods_id) VALUES ('001','002','003','004')
INSERT INTO PaymentMethods (payment_methods_name) VALUES ('Virtual Account','Bank Transfer','E-Wallet','Debit Card')
INSERT INTO PaymentMethods (payment_methods_details) VALUES ('')

-- Tabel Transaction
CREATE TABLE IF NOT EXISTS transactions(
    transactions_id int(10) NOT NULL AUTO_INCREMENT,
    user_id int(10) NOT NULL,
    payment_methods_id int(10) NOT NULL,
    amount bigint(255) NOT NULL,
    is_paid int(1) NOT NULL,
    PRIMARY KEY (transactions_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (payment_methods_id) REFERENCES PaymentMethods(payment_methods_id)
);

INSERT INTO transactions (transactions_id) VALUES ('1')
INSERT INTO transactions (user_id) VALUES ('1')
INSERT INTO transactions (payment_methods_id) VALUES ('001')
INSERT INTO transactions (amount) VALUES ('Rp.250.000')
INSERT INTO transactions (is_paid) VALUES ('1')

-- Tabel Genre
CREATE TABLE IF NOT EXISTS genres(
    genre_id int(10) NOT NULL AUTO_INCREMENT,
    genre_name varchar(255) NOT NULL,
    PRIMARY KEY(genre_id)
);

INSERT INTO Genre (genre_id) VALUES ('1','2')
INSERT INTO Genre (genre_name) VALUES ('R&B','Hip Hop')

-- Tabel Artist 
CREATE TABLE IF NOT EXISTS artists(
    artist_id int(10) NOT NULL AUTO_INCREMENT,
    artist_name varchar(255) NOT NULL,
    artist_location varchar(255) NOT NULL,
    PRIMARY KEY(artist_id)
);

INSERT INTO Artist (artist_id) VALUES ('1','2','3')
INSERT INTO Artist (artist_name) VALUES ('Harry Styles','One Direction','DJ Snake')
insert INTO Artist (artist_location) VALUES ('U.K','U.K','France')

-- Tabel Album
CREATE TABLE IF NOT EXISTS albums(
    album_id int(10) NOT NULL AUTO_INCREMENT,
    artist_id int(10) NOT NULL,
    album_name varchar(255) NOT NULL,
    album_year year NOT NULL,
    PRIMARY KEY(album_id),
    FOREIGN KEY(artist_id) REFERENCES artists(artist_id)
);

INSERT INTO Album (album_id) VALUES ('001','002','003')
INSERT INTO Album (album_name) VALUES ('Harrys House','Made in the A.M','Encore')
INSERT INTO Album (artist_id) VALUES ('1','2','3')
INSERT INTO Album (year) VALUES ('2022','2015','2016')

-- Tabel Song 
CREATE TABLE IF NOT EXISTS songs(
    song_id int(10) NOT NULL AUTO_INCREMENT,
    song_title varchar(255) NOT NULL,
    album_id int(10) NOT NULL,
    genre_id int(10) NOT NULL,
    song_duration int(4) NOT NULL,
    song_link varchar(255) NOT NULL,
    PRIMARY KEY(song_id),
    FOREIGN KEY(album_id) REFERENCES albums(album_id),
    FOREIGN KEY(genre_id) REFERENCES genres(genre_id)
);

INSERT INTO Song (song_id) VALUES ('1','2','3')
INSERT INTO Song (song_title) VALUES ('As it was','History','Middle')
INSERT INTO Song (album_id) VALUES ('001','002','003')
INSERT INTO Song (genre_id) VALUES ('1','2','3')
INSERT INTO Song (song_duration) VALUES ('2 menit','3 menit','2 menit')

-- Tabel Playlist
CREATE TABLE IF NOT EXISTS playlists(
    playlist_id int(10) NOT NULL AUTO_INCREMENT,
    playlist_name varchar(255) NOT NULL,
    song_id int(10) NOT NULL,
    user_id int(10) NOT NULL,
    PRIMARY KEY(playlist_id),
    FOREIGN KEY(song_id) REFERENCES songs(song_id),
    FOREIGN KEY(user_id) REFERENCES Users(user_id)
);

INSERT INTO Playlist (playlist_id) VALUES ('01','02')
INSERT INTO Playlist (playlist_name) VALUES ('Mood','Chill day')
INSERT INTO Playlist (user_id) VALUES ('1','1')


-- Tabel Song Play
CREATE TABLE IF NOT EXISTS songplays(
    song_play_id int(10) NOT NULL AUTO_INCREMENT,
    song_id int(10) NOT NULL,
    playlist_id int(10),
    user_id int(10) NOT NULL,
    PRIMARY KEY(song_play_id),
    FOREIGN KEY(song_id) REFERENCES songs(song_id),
    FOREIGN KEY(playlist_id) REFERENCES playlists(playlist_id),
    FOREIGN KEY(user_id) REFERENCES Users(user_id)
);

INSERT INTO songplays (song_play_id) VALUES ('1','2','3')
INSERT INTO songplays (song_id) VALUES ('1','2','3')
INSERT INTO songplays (playlist_id) VALUES ('01','02','03')
INSERT INTO songplays (user_id) VALUES ('1','1','1')
