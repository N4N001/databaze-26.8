CREATE DATABASE Library
CREATE TABLE Author (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    firstname varchar(32),
    lastname varchar(32),
    date_of_birth varchar(10),
    description text);

CREATE TABLE Book (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    ISBN varchar(13),
    name varchar(64),
    pages INT,
    author_id varchar(2),
    description text,
    genre varchar(32));

CREATE TABLE Genre (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name varchar(32),
    description text);

INSERT INTO Author (firstname, lastname, date_of_birth, description)
VALUES
("Joanne Kathleen","Rowling","31.07.1965", "Britská autorka známá jako J.K. Rowling"),
("Ernest","Cline","29.03.1972","Americký spisovatel sci-fi novelů"),
("Karel","Čapek","09.01.1890","Český spisovatel a dramatik"),
("Jules","Verne","08.02.1828","Francouzský spisovatel dobrodružné fikce"),
("Jack","Thorne","06.12.1978","Britský autor"),
("John","Tiffany","27.06.1960","Britský autor a dramatik");

INSERT INTO Book (name, ISBN, pages, genre, author_id, description)
VALUES
("Ready Player One","9783596522583",374,"sci-fi","Sci-fi román který se dočkal zfilmování"),
("Harry Potter and the Sorcerer's Stone","9780545790352",223,"fantasy","První kniha ze světounámé série o Harry Potterovi"),
("Harry Potter and the Chamber of Secrets","9781338299151",251,"fantasy","Druhá kniha ze světounámé série o Harry Potterovi"),
("Harry Potter and the Cursed Child",336,"fantasy","Příběh syna Harryho Pottera navazující na světoznámou sérii knih"),
("Bílá nemoc","9788073900632",112,"drama","Známé dílo Karla Čapka varující o nebezpečí fašistických ideologií"),
("Cesta do středu Země","9788073902513",280,"adventure fiction","Klasika která byla inspirací pro spoustu dalších děl");

INSERT INTO Genre (name, description)
VALUES
("sci-fi","Lazery, budoucnost, vesmír, neuvěřitelné vynálezy, znáte to.."),
("fantasy","Kouzla, jiné světy, neskutečná zvířata atd."),
("drama","Psané původně jako divadelní hra"),
("adventure fiction","Neuvěřitelná dobrodružství");

ALTER TABLE Book
ADD FOREIGN KEY (genre) REFERENCES Genre(name);

CREATE TABLE Book_Author (
    book_id varchar(2), 
    author_id varchar(2));

INSERT INTO Book_Author (book_id, author_id)
VALUES
(1,2),
(2,1),
(3,1),
(4,1),
(4,5),
(4,6),
(5,3),
(6,4);

SELECT id
FROM Book as b,
JOIN Book_Author as ba on ba.book_id=b.id,
JOIN Author as a on ba.author_id=a.id;