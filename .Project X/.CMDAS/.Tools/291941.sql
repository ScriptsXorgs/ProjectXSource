CREATE DATABASE users;

USE users;

CREATE TABLE passwords (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password_hash VARCHAR(255) NOT NULL
);
