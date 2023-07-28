# ./challenge1/database.sql
CREATE DATABASE challenge1;
USE challenge1;
CREATE TABLE users(
name varchar(255) not null,
pass varchar(255) not null,
id int auto_increment,
primary key(id)
);
INSERT INTO users(name,pass) VALUES('IMAGE','qwesifubaoausfbiaaf'),('asd','adasdbasawerwerwebsd'),('flag','flag{kfccrazythursdayvme50}');
CREATE USER 'challenge1'@'localhost' IDENTIFIED BY 'challenge1'; 
GRANT ALL ON challenge1.* TO 'challenge1'@'localhost'; 