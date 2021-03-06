DROP DATABASE IF EXISTS roam_db;
CREATE DATABASE roam_db;

\c roam_db

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(500) UNIQUE NOT NULL,
  password VARCHAR(500) NOT NULL,
  avatar VARCHAR(500),
  logged_in BOOLEAN DEFAULT FALSE
);

DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
  id SERIAL PRIMARY KEY,
  city VARCHAR(100),
  country VARCHAR(100),
  image_url VARCHAR(500)
);

DROP TABLE IF EXISTS posts;
CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),
  city_id INTEGER REFERENCES cities(id),
  date_added DATE,
  content VARCHAR(1000)
);
