BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "publishing_info" (
	"companyID"	INT AUTO_INCREMENT,
	"publisher_name"	TEXT,
	PRIMARY KEY("companyID")
);
CREATE TABLE IF NOT EXISTS "sales" (
	"salesID"	INT AUTO_INCREMENT,
	"na_sales"	INT,
	"eu_sales"	INT,
	"jp_sales"	INT,
	"other_sales"	INT,
	"global_sales"	INT,
	PRIMARY KEY("salesID")
);
CREATE TABLE IF NOT EXISTS "genre" (
	"genreID"	INT AUTO_INCREMENT,
	"name"	TEXT,
	PRIMARY KEY("genreID")
);
CREATE TABLE IF NOT EXISTS "console" (
	"consoleID"	INT AUTO_INCREMENT,
	"name"	TEXT,
	PRIMARY KEY("consoleID")
);
CREATE TABLE IF NOT EXISTS "esrb" (
	"esrbID"	INT AUTO_INCREMENT,
	"rating"	INT,
	PRIMARY KEY("esrbID")
);
CREATE TABLE IF NOT EXISTS "games" (
	"gameID"	INTEGER,
	"name"	TEXT,
	"genreID"	INT,
	"esrbID"	INT,
	"player_amount"	INT,
	"rank"	INT,
	"companyID"	INT,
	"consoleID"	INT,
	"salesID"	INT,
	"yearOfRelease"	INT,
	PRIMARY KEY("gameID" AUTOINCREMENT),
	CONSTRAINT "company_fk" FOREIGN KEY("companyID") REFERENCES "publishing_info"("companyID"),
	CONSTRAINT "console_fk" FOREIGN KEY("consoleID") REFERENCES "console"("consoleID"),
	CONSTRAINT "sales_fk" FOREIGN KEY("salesID") REFERENCES "sales"("salesID"),
	CONSTRAINT "genre_fk" FOREIGN KEY("genreID") REFERENCES "genre"("genreID"),
	CONSTRAINT "esrb_fk" FOREIGN KEY("esrbID") REFERENCES "esrb"("esrbID")
);
INSERT INTO "publishing_info" VALUES (1,'Nintendo');
INSERT INTO "publishing_info" VALUES (2,'Sony Computer Entertainment');
INSERT INTO "publishing_info" VALUES (3,'Activision');
INSERT INTO "publishing_info" VALUES (4,'Microsoft Game Studios');
INSERT INTO "publishing_info" VALUES (5,'Mojang');
INSERT INTO "publishing_info" VALUES (6,'Take-Two Interactive');
INSERT INTO "sales" VALUES (1,9.67,3.73,0.11,1.13,14.64);
INSERT INTO "sales" VALUES (2,4.02,3.87,2.54,0.52,10.95);
INSERT INTO "sales" VALUES (3,12.07,10.15,1.15,3.29,26.66);
INSERT INTO "sales" VALUES (4,29.08,3.58,6.81,0.77,40.24);
INSERT INTO "sales" VALUES (5,9.63,5.31,0.06,1.38,16.38);
INSERT INTO "sales" VALUES (6,7.97,2.83,0.13,1.21,12.14);
INSERT INTO "sales" VALUES (7,41.49,29.02,3.77,8.46,82.74);
INSERT INTO "genre" VALUES (1,'Shooter');
INSERT INTO "genre" VALUES (2,'Action');
INSERT INTO "genre" VALUES (3,'Fighting');
INSERT INTO "genre" VALUES (4,'Racing');
INSERT INTO "genre" VALUES (5,'Platform');
INSERT INTO "genre" VALUES (6,'Simulation');
INSERT INTO "genre" VALUES (7,'Role-Playing');
INSERT INTO "genre" VALUES (8,'Adventure');
INSERT INTO "genre" VALUES (9,'Sprots');
INSERT INTO "console" VALUES (1,'Pc');
INSERT INTO "console" VALUES (2,'Wii');
INSERT INTO "console" VALUES (3,'Xbox');
INSERT INTO "console" VALUES (4,'Playstation');
INSERT INTO "console" VALUES (5,'NES');
INSERT INTO "esrb" VALUES (1,'M');
INSERT INTO "esrb" VALUES (2,'E');
INSERT INTO "esrb" VALUES (3,'eC');
INSERT INTO "esrb" VALUES (4,'T');
INSERT INTO "esrb" VALUES (5,'Ao');
INSERT INTO "esrb" VALUES (6,'E10+');
INSERT INTO "games" VALUES (1,'Call of Duty: Black Ops',1,1,'Online Multiplayer',32,3,3,1,2010);
INSERT INTO "games" VALUES (2,'Gran Turismo',4,2,'Single Player',53,2,4,2,1997);
INSERT INTO "games" VALUES (3,'Minecraft',8,6,'Online Multiplayer',2,5,1,3,2009);
INSERT INTO "games" VALUES (4,'Super Mario Bros.',5,2,'Singe Player',2,1,5,4,1985);
INSERT INTO "games" VALUES (5,'Grand Theft Auto V',2,1,'Single Player',17,1,3,5,2013);
INSERT INTO "games" VALUES (6,'Halo 3',1,1,'Online Multiplayer',44,4,3,6,2007);
INSERT INTO "games" VALUES (7,'Wii Sports',9,2,'Multiplayer',1,1,2,7,2006);
INSERT INTO "games" VALUES (8,'lol',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
COMMIT;
