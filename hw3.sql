# Assignment3DBMS
CREATE TABLE Artist ( 
  artID serial NOT NULL, 
  artName VARCHAR(255) NOT NULL, 
  CONSTRAINT pk_artist PRIMARY KEY (artID), 
  CONSTRAINT ck_artist UNIQUE (artName) 
); 
 
CREATE TABLE CD ( 
  cdID serial NOT NULL,
  artID INT NOT NULL, 
  cdTitle VARCHAR(255) NOT NULL, 
  cdPrice REAL NOT NULL, 
  cdGenre VARCHAR(255) NULL, 
  cdNumTracks INT NULL, 
  CONSTRAINT pk_cd PRIMARY KEY (cdID), 
  CONSTRAINT  fk_cd_art  FOREIGN  KEY  (artID)  REFERENCES  Artist 
(artID) 
); 


-- 1 insert (OUTPUTS)
INSERT INTO Artist (artName) Values ('Muse'), ('Mr. Scruff'),
('Deadmau5 '), ('Mark Ronson '),('Animal Collective ');

SELECT * FROM Artist order by artID;

INSERT INTO CD (artID, cdTitle, cdPrice, cdGenre)
VALUES (1, 'Black Holes and Revelations', 9.99, 'Rock'),
(1, 'The Resistance ', 11.99, 'Rock'),
(2, 'Ninja Tuna ', 9.99, 'Electronica '),
(3, 'For Lack of a Better Name ', 9.99, 'Electro House '),
(4, 'Record Collection ', 11.99, 'Alternative Rock'),
(4, 'Version', 12.99, 'Pop'),
(5, 'Merriweather Post Pavilion', 12.99, 'Electronica ');

SELECT *FROM CD;


-- 2 Update(OUTPUTS)
UPDATE Artist SET artName = ('Mrs. Scruff') WHERE artName = 'Mr. Scruff';

-- Output 2
UPDATE Artist SET artName = ('Musa') WHERE artName = 'Muse';
SELECT *FROM Artist;

-- Output 3
UPDATE CD SET cdPrice = cdPrice + 1;
SELECT *FROM CD;
rollback;


UPDATE CD SET cdPrice = cdPrice + 0.5 WHERE cdPrice > 10;
SELECT *FROM CD;


-- Output 4
INSERT INTO Artist (artName) Values ('Mark Ronson & The Business Intl');
UPDATE CD SET artID = (SELECT artID FROM Artist WHERE artName = 'Mark Ronson & The Business Intl');

SELECT *FROM Artist;
SELECT * FROM CD; 


-- Output 5
DELETE FROM  Artist WHERE artName = 'Animal Collective ';
SELECT *FROM Artist;
SELECT * FROM CD; 


-- usefull

SHOW TABLES; 
  DESCRIBE Artist; 
  ALTER TABLE Artist DROP serial; 
