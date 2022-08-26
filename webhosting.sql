CREATE DATABASE Webhosting

CREATE TABLE Client (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name varchar(32), 
    description text, 
    year_created INT);

CREATE TABLE Website (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    domain varchar(64),
    date_created INT,
    description text,
    category varchar(32));

CREATE TABLE Category (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name varchar(32),
    description text);

INSERT INTO Client (name, description date_created)
VALUES
("OSSP","škola",1992),
("ALZA", "společnost zabívající se elektronikou",1994),
("Seznam.cz","web portál",1996),
("Velká Pecka","společnost zabývající se doručováním potravin",2014),
("DámeJídlo","rozvoz jídla a fastfoodu",2012);

INSERT INTO Website (domain, date_created, description, category)
VALUES
("ossp.cz",2007,"oficiální stránky školy","informační"),
("alza.cz",2004,"e-shop zaměřený převážně na elektroniku","e-shop"),
("seznam.cz",1996,"web-portál a vyhledávací nástroj","search engine"),
("rohlik.cz",2000,"e-shop s potravinami","e-shop"),
("damejidlo.cz",2012,"e-shop pro fastfood","e-shop");

INSERT INTO Category (name, description)
VALUES
("informační", "Obsahuje aktuální informace a aktuality o určité věci"),
("search engine", "Vyhledávající nástroj díky kterému se dostaneme na jiné stránky bez pamatování si jejich webové adresy"),
("e-shop", "stránky určené pro nákup produktů");

ALTER TABLE Website
ADD FOREIGN KEY (category) REFERENCES Category(name);

CREATE TABLE Company_Website (
    company_id INT,
    website_id INT);

INSERT INTO Client_Website (client_id, website_id)
VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5);

SELECT id
from Client as c,
JOIN Client_Website as cw on cw.client_id=c.id,
JOIN Website as w on cw.website_id=w.id;