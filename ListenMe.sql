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

-- Tabel Payment Methods
CREATE TABLE IF NOT EXISTS PaymentMethods(
    payment_methods_id int(10) NOT NULL AUTO_INCREMENT,
    payment_methods_name varchar(255) NOT NULL,
    payment_methods_details varchar(255) NOT NULL,
    PRIMARY KEY(payment_methods_id)
);

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

-- Tabel Genre
CREATE TABLE IF NOT EXISTS genres(
    genre_id int(10) NOT NULL AUTO_INCREMENT,
    genre_name varchar(255) NOT NULL,
    PRIMARY KEY(genre_id)
);

-- Tabel Artist 
CREATE TABLE IF NOT EXISTS artists(
    artist_id int(10) NOT NULL AUTO_INCREMENT,
    artist_name varchar(255) NOT NULL,
    artist_location varchar(255) NOT NULL,
    PRIMARY KEY(artist_id)
);

-- Tabel Album
CREATE TABLE IF NOT EXISTS albums(
    album_id int(10) NOT NULL AUTO_INCREMENT,
    artist_id int(10) NOT NULL,
    album_name varchar(255) NOT NULL,
    album_year year NOT NULL,
    PRIMARY KEY(album_id),
    FOREIGN KEY(artist_id) REFERENCES artists(artist_id)
);

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
