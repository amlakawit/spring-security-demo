CREATE DATABASE IF NOT EXISTS spring_security_demo;

USE spring_security_demo;

DROP TABLE IF EXISTS users;
CREATE TABLE users(
	username VARCHAR(50) NOT NULL PRIMARY KEY,
   password VARCHAR(50) NOT NULL,
   enabled  TINYINT(1) NOT NULL
);

DROP TABLE IF EXISTS authorities;
CREATE TABLE authorities(
   username VARCHAR(50) NOT NULL ,
   authority VARCHAR(50) NOT NULL,
   UNIQUE KEY authorities_idx_1(username, authority),
   CONSTRAINT authorities_ibfk_1 FOREIGN KEY(username) REFERENCES users(username)
);


INSERT INTO users 	VALUES
				('ala', '{noop}ala', 1),
				('sunny', '{noop}sunny', 1),
				('abebe', '{noop}abebe', 1) ;
                
INSERT INTO authorities 	VALUES
				('ala', 'ROLE_EMPLOYEE'),
				('ala', 'ROLE_MANAGER'),
                ('sunny', 'ROLE_EMPLOYEE'),
                ('sunny', 'ROLE_ADMIN'),
                ('abebe', 'ROLE_EMPLOYEE');
                