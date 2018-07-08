CREATE DATABASE IF NOT EXISTS spring_security_demo_bcrypt;

USE spring_security_demo_bcrypt;

DROP TABLE IF EXISTS users;
CREATE TABLE users(
	username VARCHAR(50) NOT NULL PRIMARY KEY,
	password VARCHAR(68) NOT NULL,
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
				('ala', '{bcrypt}$2a$04$QAEr4vjm0ql/up9BPdZ9Tu2x6YO4ydfVcaGLgDvfmCjcEU0m4ZsBO', 1),
				('sunny', '{bcrypt}$2a$04$sFZju2W8vnOmOiGrZxG4MuvcgozJKcgLdMzEIVoZpyAm2hEU.gJJy', 1),
				('abebe', '{bcrypt}$2a$04$CitwnLtDaedESLkjB258QuU.UenNVFm8IXc2.vaYTls9G9/0bq8Oa', 1), 
				('joe', '{bcrypt}$2a$04$9DDDc0qSbef.EXwpU6px6uGVc.8klcaSsABrPiyBVsSDTkrlBdoOu', 1) ,
				('joy', '{bcrypt}$2a$04$9DDDc0qSbef.EXwpU6px6uGVc.8klcaSsABrPiyBVsSDTkrlBdoOu', 1) ;
                
INSERT INTO authorities 	VALUES
				('ala', 'ROLE_EMPLOYEE'),
				('ala', 'ROLE_MANAGER'),
                ('sunny', 'ROLE_EMPLOYEE'),
                ('sunny', 'ROLE_ADMIN'),
                ('abebe', 'ROLE_EMPLOYEE'),
                ('joy', 'ROLE_EMPLOYEE'),
                ('joe', 'ROLE_EMPLOYEE'),
                ('joe', 'ROLE_MANAGER');
                