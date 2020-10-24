

--------------------------------------------------------------------------------
--------------------------------- CREATE TABLE ---------------------------------
--------------------------------------------------------------------------------

CREATE TABLE Adres(
  ID_Adres        number(4) NOT NULL,
  Ulica           varchar(30),
  NrBudynku       number(4),
  NrLokalu        number(4),
  KodPocztowy     varchar(6),
  Miasto          varchar(20),
  
  CONSTRAINT PK_Adres PRIMARY KEY (ID_Adres)
);


--------------------------------------------------------------------------------
--Wykladowcy

CREATE TABLE TytulNaukowy(
  ID_Tytul        number(4) NOT NULL,
  Nazwa           varchar(25),
  
  CONSTRAINT PK_Tytul PRIMARY KEY (ID_TYTUL)
);

CREATE TABLE Wykladowca(
  ID_Wykladowca   number(4) NOT NULL,
  Imie            varchar(20),
  Nazwisko        varchar(30),
  ID_Adres        number(4),
  ID_Tytul        number(4),    
  
  CONSTRAINT PK_Wykladowca PRIMARY KEY (ID_Wykladowca),
  CONSTRAINT FK_AdresW     FOREIGN KEY (ID_Adres) REFERENCES Adres(ID_Adres),
  CONSTRAINT FK_Tytul      FOREIGN KEY (ID_Tytul) REFERENCES TytulNaukowy(ID_Tytul)
);


--------------------------------------------------------------------------------
--Studenci

CREATE TABLE Kierunek(
  ID_Kierunek     number(4) NOT NULL,
  Nazwa           varchar(40),
  
  CONSTRAINT PK_Kierunek PRIMARY KEY (ID_Kierunek)
);

CREATE TABLE Grupa(
  ID_Grupa        number(4) NOT NULL,
  Nazwa           varchar(10),
  ID_Kierunek     number(4),
  
  
  CONSTRAINT PK_Grupa    PRIMARY KEY (ID_Grupa),
  CONSTRAINT FK_Kierunek FOREIGN KEY (ID_Kierunek) REFERENCES Kierunek(ID_Kierunek)
);

CREATE TABLE Student(
  ID_Student      number(4) NOT NULL,
  Imie            varchar(20),
  Nazwisko        varchar(30),
  ID_Adres        number(4),
  NrAlbumu        number(10), 
  ID_Grupa        number(4),
  
  CONSTRAINT PK_Student  PRIMARY KEY (ID_Student),
  CONSTRAINT FK_AdresS   FOREIGN KEY (ID_Adres) REFERENCES Adres(ID_Adres),
  CONSTRAINT FK_GrupaS   FOREIGN KEY (ID_Grupa) REFERENCES Grupa(ID_Grupa),
  UNIQUE (NrAlbumu)
);


--------------------------------------------------------------------------------
--Sale

CREATE TABLE Budynek(
  ID_Budynek      number(4) NOT NULL,
  Nazwa           varchar(50),
  ID_Adres        number(4),
  
  CONSTRAINT PK_Budynek  PRIMARY KEY (ID_Budynek),
  CONSTRAINT FK_AdresB   FOREIGN KEY (ID_Adres) REFERENCES Adres(ID_Adres)
);

CREATE TABLE Sala(
  ID_Sala         number(4) NOT NULL,
  ID_Budynek      number(4),
  KodSali         varchar(20),
  
  CONSTRAINT PK_Sala    PRIMARY KEY (ID_Sala),
  CONSTRAINT FK_Budyenk FOREIGN KEY (ID_Budynek) REFERENCES Budynek(ID_Budynek)
);


--------------------------------------------------------------------------------
--Przedmioty

CREATE TABLE Przedmiot(
  ID_Przedmiot    number(4) NOT NULL,
  Nazwa           varchar(50),
  Ects            number(1),
  
  CONSTRAINT PK_Przedmiot PRIMARY KEY (ID_Przedmiot)
);

CREATE TABLE Charakter(
  ID_Charakter    number(4) NOT NULL,
  Nazwa           varchar(20),

  CONSTRAINT PK_Charakter PRIMARY KEY (ID_Charakter)  
);


--------------------------------------------------------------------------------
--Zajecia

CREATE TABLE Zajecia(
  ID_Zajecia      number(4) NOT NULL,
  ID_Przedmiot    number(4),
  ID_Charakter    number(4),
  ID_Sala         number(4),
  ID_Wykladowca   number(4),
  ID_Grupa        number(4),
  DzienTyg        varchar(12),

  CONSTRAINT PK_Zajecia      PRIMARY KEY (ID_Zajecia),
  CONSTRAINT FK_PrzedmiotZ   FOREIGN KEY (ID_Przedmiot)  REFERENCES Przedmiot(ID_Przedmiot),
  CONSTRAINT FK_CharakterZ   FOREIGN KEY (ID_Charakter)  REFERENCES Charakter(ID_Charakter),
  CONSTRAINT FK_Sala         FOREIGN KEY (ID_Sala)       REFERENCES Sala(ID_Sala),
  CONSTRAINT FK_WykladowcaZ  FOREIGN KEY (ID_Wykladowca) REFERENCES Wykladowca(ID_Wykladowca),
  CONSTRAINT FK_Grupa        FOREIGN KEY (ID_Grupa)      REFERENCES Grupa(ID_Grupa)
);

CREATE TABLE Ocena(
  ID_Ocena        number(4) NOT NULL,
  ID_Student      number(4),
  ID_Zajecia      number(4),
  Ocena           number(4,1),
  Data            date,          
  
  CONSTRAINT PK_Ocena       PRIMARY KEY (ID_Ocena),
  CONSTRAINT FK_Student     FOREIGN KEY (ID_Student)    REFERENCES Student(ID_Student),
  CONSTRAINT FK_Zajecia     FOREIGN KEY (ID_Zajecia)    REFERENCES Zajecia(ID_Zajecia)
);
commit; 

INSERT INTO Adres Values (1,  'Irysowa',	                    78,	12,	12341,  'Znamirowice');
INSERT INTO Adres Values (2,  'Kwiatowa',	                      39,	38,	13894,  'Starachowice');
INSERT INTO Adres Values (3,  'Krzywa',	                      83,	64, 85860,  'Kielce');
INSERT INTO Adres Values (4,  'Sosnowa',  93,	99,	79996,  'Mo�cice');
INSERT INTO Adres Values (5,  'Snopowa',	                    22,	82,	26811,  'Rudniki');
INSERT INTO Adres Values (6,  'PCK',	                        20,	16,	22886,  'Chorz�w');
INSERT INTO Adres Values (7,  'Ojcowska',	                    61,	15,	18829,  'L�dziny');
INSERT INTO Adres Values (8,  'Markowa',	                    92,	81,	89485,  'Rudno');
INSERT INTO Adres Values (9,  'Zana Tomasza',	                 3,	 1,	65595,  '�eba');
INSERT INTO Adres Values (10, 'Topolowa',	                    78,	61,	11739,  'D�browa G�rnicza');
INSERT INTO Adres Values (11, 'Wilsona',	                    63,	24,	17294,  'Ska�a');
INSERT INTO Adres Values (12, 'Irysow',             	        28,	56,	33538,  'Wroc�aw');
INSERT INTO Adres Values (13, 'Wodnika',                       7,	47,	59934,  'Krak�w');
INSERT INTO Adres Values (14, 'Grottgera Artura',              7,	53,	13007,  'Warszwa');
INSERT INTO Adres Values (15, 'Piastowska',	                  56,	85,	54650,  'Warszawa');
INSERT INTO Adres Values (16, 'Wojska Polskiego',	            80,	35,	25982,  'Koszalin');
INSERT INTO Adres Values (17, 'Wejherowska',	                28,	33,	48390,  'Gda�sk');
INSERT INTO Adres Values (18, 'Frezjowa',	                    14,	63,	67599,  'Wroc�aw');
INSERT INTO Adres Values (19, 'Broniewskiego Wladyslawa',	    50,	96,	12199,  'Rzesz�w');
INSERT INTO Adres Values (20, 'Gnieznienska',	                57,	 3,	89162,  'Warszawa');
INSERT INTO Adres Values (21, 'Wrzosowa',	                    16,	89,	75925,  'Lublin');
INSERT INTO Adres Values (22, 'Wielkanocna',	                89,	12,	85558,  'Krak�w');
INSERT INTO Adres Values (23, 'Zachodnia',	                  54,	59,	92280,  'Pozna�');
INSERT INTO Adres Values (24, 'Klonowa	',	                  74,	20,	75080,  'Kielce');
INSERT INTO Adres Values (25, 'Z�ota	',	                  27,	97,	73506,  'Krak�w');
INSERT INTO Adres Values (26, 'Micha�owska	',	          61,	 9,	77006,  'Kielce');
INSERT INTO Adres Values (27, 'Zielona	',	                  42,	48,	54118,  'Tarn�w');
INSERT INTO Adres Values (28, 'Grochowa	',	                    11,100,	45110,  'Warszawa');
INSERT INTO Adres Values (29, 'Marynarki Polskiej	',	        43,	38,	82446,  'Gda�sk');
INSERT INTO Adres Values (30, 'Janosika	',	                  27,	75,	97042,  'Bydgoszcz');
INSERT INTO Adres Values (31, 'Siedlecka	',	                89,	41,	55190,  'Bydgoszcz');
INSERT INTO Adres Values (32, 'Frycza Modrzewskiego Andrzeja', 5,	59,	97131,  'Otwock');
INSERT INTO Adres Values (33, 'Kocmyrzowska	',	              76,	60,	80990,  'Ko�obrzeg');
INSERT INTO Adres Values (34, 'Marciniaka Floriana	',	      80,	18,	66069,  'Warszawa');
INSERT INTO Adres Values (35, 'Prosta	',                    	27,	73,	15066,  'Wroc�aw');
INSERT INTO Adres Values (36, 'Pi�sudskiego J�zefa	',	      60,	30,	24024,  'Warszawa');
INSERT INTO Adres Values (37, 'Bohater�w Warszawy	',	        79,	34,	37441,  'Katowice');
INSERT INTO Adres Values (38, 'Moniuszki Stanis�awa	',	      97,	18,	85568,  'Krak�w');
INSERT INTO Adres Values (39, 'Stanowa	',	    36,	69,	84375,  'Ciechan�w');
INSERT INTO Adres Values (40, 'Bratkowa	',	    99,	 8,	55169,  'Kielce');
INSERT INTO Adres Values (41, 'Koralowa	',	            25,	69,	69801,  'Kraszewo');
INSERT INTO Adres Values (42, 'Rolna	',	                    33,	32,	64144,  'Pozna�');
INSERT INTO Adres Values (43, 'Jana Pawla II	',	            56,	47,	74920,  'Cieszyn');
INSERT INTO Adres Values (44, 'Szramka Emila	',	            74,	47,	76185,  'Ostr�w Wielkopolski');
INSERT INTO Adres Values (45, 'Robotnicza	',	                26,	97,	71584,  'Siekierki');
INSERT INTO Adres Values (46, 'Sienkiewicza Henryka	',	      52,	35,	15620,  'Radom');
INSERT INTO Adres Values (47, 'Szeroka Droga	',	             2,	25,	11857,  'Warszawa');
INSERT INTO Adres Values (48, 'Miedzyborska	',	              16,	39,	73711,  'Wroc�aw');
INSERT INTO Adres Values (49, 'Jana Paw�a II	',	             3,	54,	11437,  'Bydgoszcz');
INSERT INTO Adres Values (50, 'Trojanowska	',	                93,	47,	97307,  'Otwock');
INSERT INTO Adres Values (51, 'Kolonijna	',	               100,	52,	11246,  'Jaworzno');
INSERT INTO Adres Values (52, 'Milewska	',	  92,	41,	22685,  'Sopot');
INSERT INTO Adres Values (53, 'Lotnicza', 35, 17,	28804,  'Wybranowo');
INSERT INTO Adres Values (54, 'Klonowa	',	              33,	20,	61471,  'Mys�owice');
INSERT INTO Adres Values (55, 'Pierwiosnkowa	',	            95,	40,	93160,  'Ponice');
INSERT INTO Adres Values (56, 'Olchowa	',	                  97,	28,	63941,  'Sosnowiec');
INSERT INTO Adres Values (57, 'Gadomskiego Jana	',	          44,	65,	51183,  'Siedlce');
INSERT INTO Adres Values (58, 'Jarzynowa	',	          15,	88,	47867,  'Lublin');
INSERT INTO Adres Values (59, 'Mostowa	',	              81,	96,	54088,  'Szczecin');
INSERT INTO Adres Values (60, 'Chociszewska	',	    98,100,	91595,  'Konary');
INSERT INTO Adres Values (61, 'Per�owa	',	      85,	86,	65767,  'Wroc�aw');
INSERT INTO Adres Values (62, 'Pigonia Stanis�awa	',	        40,	96,	13230,  'Legionowo');
INSERT INTO Adres Values (63, 'Rubinowa	',	                    70,	62,	45112,  'Lublin');
INSERT INTO Adres Values (64, 'Szlachecka	',	                15,	47,	71040,  'Bydgoszcz');
INSERT INTO Adres Values (65, 'Olsza	',	          61,	42,	98965,  'Krak�w');
INSERT INTO Adres Values (66, 'Stra�acka	',	            54,	57,	75443,  'Trybsz');
INSERT INTO Adres Values (67, 'Sielska	',	      89,	 5,	57331,  'Opole');
INSERT INTO Adres Values (68, 'Cicha',	                    99,	81,	52055,  'Leszczyny');
INSERT INTO Adres Values (69, 'Jasna',	                    84,	57,	99274,  'Grodzisk Mazowiecki');
INSERT INTO Adres Values (70, 'Ognista',	              59,	16,	24003,  'Baran�w');
INSERT INTO Adres Values (71, 'Malinowa',		                  69,	27,	58053,  'Legnica');
INSERT INTO Adres Values (72, 'Krakowska',			                  38,	63,	83550,  'Gorz�w Wielkopolski');
INSERT INTO Adres Values (73, 'Rybnicka',		                  34,	11,	62852,  'Legnica');
INSERT INTO Adres Values (74, 'Bartosza', 	      48,	20,	75034,  'Tarnowiec');
INSERT INTO Adres Values (75, 'Pi�kna',			                  82,	96,	50676,  'Wilan�w');
INSERT INTO Adres Values (76, 'Akacjowa',		                  15,	92,	36316,  'Stara Mi�osna');
INSERT INTO Adres Values (77, 'Rolna',			                   7,	28,	70515,  'Bydgoszcz');
INSERT INTO Adres Values (78, 'Stalowa',		                  42,	 4,	29205,  'Krak�w');
INSERT INTO Adres Values (79, 'Leszczyny',		                25,	93,	75234,  'Lubin');
INSERT INTO Adres Values (80, 'Lubczykowa',		                90,	46,	90961,  'Jaworzno');
INSERT INTO Adres Values (81, 'Podchor��ych',                   1, 1, 30084,  'Krak�w');
INSERT INTO Adres Values (82, 'Warszawska',                   24,  1, 31155,  'Krak�w');
INSERT INTO Adres Values (83, 'Nowa',                   24,  2, 31155,  'Krak�w');
INSERT INTO Adres Values (84, 'Majowa',                   24,  3, 31155,  'Krak�w');
INSERT INTO Adres Values (85, 'Warszawska',                   24,  4, 31155,  'Krak�w');
INSERT INTO Adres Values (86, 'Wlotowa',                   24,  5, 31155,  'Krak�w');
INSERT INTO Adres Values (87, 'Bia�a',                   24,  6, 31155,  'Krak�w');
INSERT INTO Adres Values (88, 'Warszawska',                   24,  7, 31155,  'Krak�w');
INSERT INTO Adres Values (89, 'Wi�niowa',                   24,  8, 31155,  'Krak�w');
INSERT INTO Adres Values (90, 'Kielecka',                   24,  9, 31155,  'Krak�w');
INSERT INTO Adres Values (91, 'Warszawska',                   24, 10, 31155,  'Krak�w');
INSERT INTO Adres Values (92, 'Wile�ska',                   24, 11, 31155,  'Krak�w');
INSERT INTO Adres Values (93, 'Warszawska',                   24, 12, 31155,  'Krak�w');
INSERT INTO Adres Values (94, 'Warszawska',                   24, 13, 31155,  'Krak�w');
INSERT INTO Adres Values (95, 'Warszawska',                   24, 14, 31155,  'Krak�w');
INSERT INTO Adres Values (96, 'Wroc�awska',                   24, 15, 31155,  'Krak�w');
INSERT INTO Adres Values (97, 'Warszawska',                   24, 16, 31155,  'Krak�w');
INSERT INTO Adres Values (98, 'Kamienna',                     17,NULL,30001,  'Krak�w'); 
commit;

INSERT INTO Budynek Values (1,  'Wydzia� Informatyki i Telekomunikacji',       81);
INSERT INTO Budynek Values (2,  'Wydzia� In�ynierii L�dowej',                     82);
INSERT INTO Budynek Values (3,  'Wydzia� In�ynierii Elektrycznej i Komputerowej', 83);
INSERT INTO Budynek Values (4,  'Wydzia� In�ynierii �rodowiska',                  84);
INSERT INTO Budynek Values (5,  'Galeria "GIL"',                                  85);
INSERT INTO Budynek Values (6,  'Czytelnia czasopism Biblioteki PK',              86);
INSERT INTO Budynek Values (7,  'Wydzia� Architektury',                           87);
INSERT INTO Budynek Values (8,  'Studium Praktycznej Nauki J�zyk�w Obcych',       88);
INSERT INTO Budynek Values (9,  'Biblioteka PK',                                  89);
INSERT INTO Budynek Values (10, 'Muzeum PK',                                      90);
INSERT INTO Budynek Values (11, 'Wydzia� In�ynierii i Technologii Chemicznej',    91);
INSERT INTO Budynek Values (12, 'Budynek �Houston�',                               92);
INSERT INTO Budynek Values (13, 'Rektorat',  93);
INSERT INTO Budynek Values (14, 'Dzia�ownia',                                     94);
INSERT INTO Budynek Values (15, 'Pawilon Konferencyjno-Wystawowy "Kot�ownia"',    95);
INSERT INTO Budynek Values (16, 'Gara�e',                                         96);
INSERT INTO Budynek Values (17, 'Magazyn',                                        97);
INSERT INTO Budynek Values (18, 'Centrum Sportu i Rekreacji PK',                  98);
commit;

INSERT INTO Sala Values (1,   1, 'F201');
INSERT INTO Sala Values (2,   1, 'F101');
INSERT INTO Sala Values (3,   1, 'F111');
INSERT INTO Sala Values (4,   1, 'F016');
INSERT INTO Sala Values (5,   1, 'F012');
INSERT INTO Sala Values (6,   1, 'F011');
INSERT INTO Sala Values (7,   1, 'F204');
INSERT INTO Sala Values (8,   1, 'F123');
INSERT INTO Sala Values (9,   1, 'F124');
INSERT INTO Sala Values (10,  3, 'K001');
INSERT INTO Sala Values (11,  3, 'K021');
INSERT INTO Sala Values (12,  3, 'K122');
INSERT INTO Sala Values (13,  3, 'K213');
INSERT INTO Sala Values (14,  5, 'S1');
INSERT INTO Sala Values (15,  5, 'S2');
INSERT INTO Sala Values (16,  5, 'S3');
INSERT INTO Sala Values (17,  5, 'S4');
INSERT INTO Sala Values (18, 18, 'Hala');
INSERT INTO Sala Values (19, 18, 'Si�ownia');
INSERT INTO Sala Values (20, 11, '143');
INSERT INTO Sala Values (21, 11, '142');
INSERT INTO Sala Values (22, 11, '136');
INSERT INTO Sala Values (23, 11, '151');
INSERT INTO Sala Values (24, 11, 'IMK');
INSERT INTO Sala Values (25, 11, 'Seminaryjna');
INSERT INTO Sala Values (26, 12, 'H213');
INSERT INTO Sala Values (27, 12, 'H211');
INSERT INTO Sala Values (28,  8, '89');
INSERT INTO Sala Values (29,  8, '12');
commit;

INSERT INTO TytulNaukowy Values (1, 'mgr');
INSERT INTO TytulNaukowy Values (2, 'mgr in�.');
INSERT INTO TytulNaukowy Values (3, 'dr');
INSERT INTO TytulNaukowy Values (4, 'dr in�.');
INSERT INTO TytulNaukowy Values (5, 'dr hab.');
INSERT INTO TytulNaukowy Values (6, 'dr hab. in�.');
INSERT INTO TytulNaukowy Values (7, 'prof.');
INSERT INTO TytulNaukowy Values (8, 'prof. dr hab.');
INSERT INTO TytulNaukowy Values (9, 'prof. dr hab. in�.');
commit;

--WF
INSERT INTO Wykladowca Values (4,	  'Piotr',    'Breit',	53,	1	);
INSERT INTO Wykladowca Values (8,	  'Walenty',      'Drul',	          57,	1	);
INSERT INTO Wykladowca Values (10,	'Pawe�',    'Krzepa',	      59,	1	);
--ANG
INSERT INTO Wykladowca Values (1,	  'Marian',       'Skryba',	      80,	1	);
INSERT INTO Wykladowca Values (5,	  'Bartosz',      'Monita',	        54,	1	);
INSERT INTO Wykladowca Values (15,	'Marek',       'Hegier',	        64,	3	);
INSERT INTO Wykladowca Values (17,	'Jacek',    'Bukera',    66,	1	);
INSERT INTO Wykladowca Values (20,	'Iwona',         'Juka',	          69,	3	);
--inf
INSERT INTO Wykladowca Values (2,	  'Salomea',         'Nowak',	      51,	2	);
INSERT INTO Wykladowca Values (3,	  'Kondrad',      'Czerwinski',	    52,	6	);
INSERT INTO Wykladowca Values (6,	  'Dymitr',       'Dudek',	        55,	5	);
INSERT INTO Wykladowca Values (7,	  'Tomasz',       'Wieleczek',	    56,	7	);
INSERT INTO Wykladowca Values (9,	  'Witek',      'Wentuch',	    58,	7	);
INSERT INTO Wykladowca Values (11,	'Tomasz',      'Hoty�a',	        60,	3	);
INSERT INTO Wykladowca Values (12,	'Dominika',       'Bikry�a',	    61,	2	);
INSERT INTO Wykladowca Values (13,	'Dolores',      'Badina',	        62,	9	);
--fiz&nn
INSERT INTO Wykladowca Values (14,	'Juliusz',      'Igrzycki',	      63,	2	);
INSERT INTO Wykladowca Values (16,	'Mateusz',         'Cagan',	      65,	6	);
INSERT INTO Wykladowca Values (18,	'Damaris',      'Kuku�ka',  67,	4	);
INSERT INTO Wykladowca Values (19,	'Ludmi�a',      'W�czy�ska',	    68,	8	);
INSERT INTO Wykladowca Values (21,	'Roman',       'Paszyk',	      70,	3	);
INSERT INTO Wykladowca Values (22,	'Sergiusz',     'Aborowicz',	    71,	9	);
INSERT INTO Wykladowca Values (23,	'Cyryl',        'Klepato',	      72,	2	);
INSERT INTO Wykladowca Values (24,	'Filip',  'Pragowski',	          73,	5	);
INSERT INTO Wykladowca Values (25,	'Bartosz',     'Kamecki',	    74,	7	);
--mat
INSERT INTO Wykladowca Values (26,	'Igor',         'Marwankowski',	  75,	9	);
INSERT INTO Wykladowca Values (27,	'Agata',      'Krog',	          76,	5	);
INSERT INTO Wykladowca Values (28,	'Geralt',     'Skarga',	    77,	8	);
INSERT INTO Wykladowca Values (29,	'Jan',     'Simiak',	        78,	7	);
INSERT INTO Wykladowca Values (30,  'Wiktor',   'Bialec',	        79,	8	);
commit;

INSERT INTO Kierunek Values (1, 'Fizyka Techniczna');
INSERT INTO Kierunek Values (2, 'Matematyka');
INSERT INTO Kierunek Values (3, 'Informatyka');
INSERT INTO Kierunek Values (4, 'Nanotechnologie i nanomateria�y');
commit;

INSERT INTO Grupa Values (1,  'GRUPA 11',   1);
INSERT INTO Grupa Values (2,  'GRUPA 21',   1);
INSERT INTO Grupa Values (3,  'GRUPA 31',   1);
INSERT INTO Grupa Values (4,  'GRUPA 11',   2);
INSERT INTO Grupa Values (5,  'GRUPA 21',   2);
INSERT INTO Grupa Values (6,  'GRUPA 11',   3);
INSERT INTO Grupa Values (7,  'GRUPA 21',   3);
INSERT INTO Grupa Values (8,  'GRUPA 31',   3);
INSERT INTO Grupa Values (9,  'GRUPA 32',   3);
INSERT INTO Grupa Values (10, 'GRUPA 10n1', 4);
INSERT INTO Grupa Values (11, 'GRUPA 20n1', 4);
INSERT INTO Grupa Values (12, 'GRUPA 21n1', 4);
INSERT INTO Grupa Values (13, 'GRUPA 30n1', 4);
commit;

INSERT INTO Student Values(1,	  'Stanis�aw',	  'Pasicz',	           1,	90934,	 9);
INSERT INTO Student Values(2,	  'Karol',	  'Stawowy',	         2,	91383,	11);
INSERT INTO Student Values(3,   'Jan',	    'Na��cz',	 3,	92838,	10);
INSERT INTO Student Values(4,	  'Seweryn',	    'Seget',	           4,	89469,	 7);
INSERT INTO Student Values(5,	  'Adam',	        'Olang',	         5,	85382,	 3);
INSERT INTO Student Values(6,	  'Gra�yna',	  'Bodaronek',	       6,	89495,	11);
INSERT INTO Student Values(7,	  'Dominik',	    'Framiak',        	 7,	91810,	12);
INSERT INTO Student Values(8,	  'Radek',	    'Mitka',        	 8,	87446,	 7);
INSERT INTO Student Values(9,   'Henryk',	      'Dawina',          	 9,	90709,	 7);
INSERT INTO Student Values(10,	'Witek', 'Grak',     	10,	86493,	 6);
INSERT INTO Student Values(11,  'Sonia',	  'Ig�a',	        11,	92924,	 8);
INSERT INTO Student Values(12,	'Jacenty',	    'Burzej',	          12,	93416,	 6);
INSERT INTO Student Values(13,	'Hieronim',	    'Fiord',	            13,	92703,	 8);
INSERT INTO Student Values(14,	'Gustaw',	      'Milczek',	  14,	90867,	11);
INSERT INTO Student Values(15,	'Roland',	      'Wiosna',	          15,	92123,	12);
INSERT INTO Student Values(16,	'Alina',	      'Wios�o',	          16,	91027,	 7);
INSERT INTO Student Values(17,	'Tycjan',	      'Wieko',          	17,	88959,	 5);
INSERT INTO Student Values(18,	'Janina',	        'Sznecka',          	18,	87291,	 7);
INSERT INTO Student Values(19,	'Dariusz',	    'Zelen',	          19,	91321,	11);
INSERT INTO Student Values(20,	'Zuzanna',	    'Kuchmiewska',	    20,	91330,	13);
INSERT INTO Student Values(21,	'Helena',	    'So�owicz',	        21,	86896,	 1);
INSERT INTO Student Values(22,	'Natanael',	    'Kojca',	          22,	92470,	12);
INSERT INTO Student Values(23,	'Martyna',	    'Salmoniak',	      23,	87532,	12);
INSERT INTO Student Values(24,	'Beata',	      'Toska',	          24,	86718,	11);
INSERT INTO Student Values(25,	'Olga',	      'Darwinek',	        25,	91703,	10);
INSERT INTO Student Values(26,	'Piotr',	    'Boluchowski',	    26,	89875,	 4);
INSERT INTO Student Values(27,	'Damian',	    'Piast',	      27,	93023,	 6);
INSERT INTO Student Values(28,	'Witold',	      'Ob�ok',	          28,	89237,	 8);
INSERT INTO Student Values(29,	'Hugon',	      'Grabowski',	      29,	91797,	 4);
INSERT INTO Student Values(30,	'Tadeusz',	    'Starak',	      30,	93551,	 8);
INSERT INTO Student Values(31,	'Norbert',	  'Tarabura',	        31,	93513,	 6);
INSERT INTO Student Values(32,	'Anna',	      'Domaziak',	        32,	89029,	 9);
INSERT INTO Student Values(33,	'Augustyn',	    'Bryza',	          33,	86986,	 2);
INSERT INTO Student Values(34,	'Balbina',	    'Fizyk',	        34,	89431,	 5);
INSERT INTO Student Values(35,	'Jan',	        'Wlak',	        35,	92382,	13);
INSERT INTO Student Values(36,	'Arkadiusz',	      'Komit',	          36,	89140,	10);
INSERT INTO Student Values(37,	'Protazy',	    'Ciesiek',	        37,	91773,	 8);
INSERT INTO Student Values(38,	'Sylwester',	    'Kasior',	          38,	91085,	 6);
INSERT INTO Student Values(39,	'Baltazar',	    'Kreda',	          39,	90439,	 5);
INSERT INTO Student Values(40,	'Miko�aj',	    'Gawrych',	    40,	92235,	10);
INSERT INTO Student Values(41,	'Pawe�',	      'Kura',	        41,	92658,	 3);
INSERT INTO Student Values(42,	'Kalina',	  'Burak',	            42,	89264,	 3);
INSERT INTO Student Values(43,	'Aldona',	'Kryszenko',	      43,	91743,	 3);
INSERT INTO Student Values(44,	'Olaf',	      'Branak',	          44,	93766,	 3);
INSERT INTO Student Values(45,	'Leszek',	      'Rajdak',	    45,	90835,	12);
INSERT INTO Student Values(46,	'Ilona',	    'Jamroga',	    46,	92404,	 5);
INSERT INTO Student Values(47,	'Justyna',	  'Szyd�o',	      47,	86701,	 2);
INSERT INTO Student Values(48,	'Katarzyna',	      'Pi�ka',	          48,	85351,	 9);
INSERT INTO Student Values(49,	'Maciej',	  'Matuszek',	        49,	89769,	 5);
INSERT INTO Student Values(50,	'Celina',   'Watek',	        50,	86066,	 5);
commit;


INSERT INTO Charakter Values(1, 'Laboratoria');
INSERT INTO Charakter Values(2, '�wiczenia');
INSERT INTO Charakter Values(3, 'Wyk�ady');
INSERT INTO Charakter Values(4, 'Lektorat');
INSERT INTO Charakter Values(5, 'Seminarium');
INSERT INTO Charakter Values(6, 'Fakultet');
commit;


INSERT INTO Przedmiot Values(3,  'Wychowanie Fizyczne',   0);
INSERT INTO Przedmiot Values(4,  'J�zyk Angielski',       1);
--inf
INSERT INTO Przedmiot Values(1,  'Analiza Matematyczna',  5);
INSERT INTO Przedmiot Values(2,  'Algebra i Geometria',   5);
INSERT INTO Przedmiot Values(5,  'Bazy Danych I',         5);
INSERT INTO Przedmiot Values(6,  'Bazy Danych II',        5);
INSERT INTO Przedmiot Values(7,  'Metody Obliczeniowe',   6);
INSERT INTO Przedmiot Values(8,  'Aplikacje Internetowe', 5);
INSERT INTO Przedmiot Values(17, 'Metody Autoprezentacji',1);
INSERT INTO Przedmiot Values(23, 'J�zyki Programowania',  6);
INSERT INTO Przedmiot Values(25, 'Algorytmy i Struktury', 5);
--fiz&nn
INSERT INTO Przedmiot Values(9,  'Modelowanie',           3);
INSERT INTO Przedmiot Values(10, 'Meteorologia',          4);
INSERT INTO Przedmiot Values(11, 'Mechanika Plynow',      4);
INSERT INTO Przedmiot Values(12, 'Analiza Danych',        2);
INSERT INTO Przedmiot Values(13, 'Fotografia',            4);
INSERT INTO Przedmiot Values(14, 'Mechanika Kwantowa',    7);
INSERT INTO Przedmiot Values(15, 'Uklady Elektroniczne',  5);
INSERT INTO Przedmiot Values(16, 'Prog. dla Fizyki',      1);
INSERT INTO Przedmiot Values(22, 'PEiTC',                 4);
INSERT INTO Przedmiot Values(24, 'Systemy Wbudowane',     3);
--mat
INSERT INTO Przedmiot Values(18, 'Statystyka',            5);
INSERT INTO Przedmiot Values(19, 'Rachunek Prawdopodob.', 4);
INSERT INTO Przedmiot Values(20, 'R�wnania R�niczkowe',  6);
INSERT INTO Przedmiot Values(21, 'Podstawy Kryptologii',  6);
INSERT INTO Przedmiot Values(26, 'Ekonometria',           5);





commit;
  
INSERT INTO Zajecia Values( 1,   3,  2, 18, 10,  1, 'PTA');
INSERT INTO Zajecia Values( 2,   3,  2, 18,  4,  2, 'SRO');
INSERT INTO Zajecia Values( 3,   3,  2, 18, 10,  3, 'PTA');
INSERT INTO Zajecia Values( 4,   3,  2, 18,  4,  4, 'SRO');
INSERT INTO Zajecia Values( 5,   3,  2, 19,  4,  5, 'PON');
INSERT INTO Zajecia Values( 6,   3,  2, 19, 10,  6, 'CZW');
INSERT INTO Zajecia Values( 7,   3,  2, 18,  8,  7, 'SRO');
INSERT INTO Zajecia Values( 8,   3,  2, 19,  4,  8, 'WTO');
INSERT INTO Zajecia Values( 9,   3,  2, 19, 10,  9, 'WTO');
INSERT INTO Zajecia Values(10,   3,  2, 18, 10, 10, 'PTA');
INSERT INTO Zajecia Values(11,   3,  2, 19,  8, 11, 'PON');
INSERT INTO Zajecia Values(12,   3,  2, 18, 10, 12, 'CZW');
INSERT INTO Zajecia Values(13,   3,  2, 18,  8, 13, 'PON');
INSERT INTO Zajecia Values(14,   4,  5, 24, 17,  1, 'CZW');
INSERT INTO Zajecia Values(15,   4,  5, 24, 20,  2, 'SRO');
INSERT INTO Zajecia Values(16,   4,  4, 24, 20,  3, 'PON');
INSERT INTO Zajecia Values(17,   4,  4, 25, 15,  4, 'PTA');
INSERT INTO Zajecia Values(18,   4,  4, 25, 20,  5, 'PTA');
INSERT INTO Zajecia Values(19,   4,  5, 24,  5,  6, 'PTA');
INSERT INTO Zajecia Values(20,   4,  5, 29, 20,  7, 'WTO');
INSERT INTO Zajecia Values(21,   4,  4, 29, 17,  8, 'SRO');
INSERT INTO Zajecia Values(22,   4,  5, 29, 17,  9, 'CZW');
INSERT INTO Zajecia Values(23,   4,  4, 29,  5, 10, 'SRO');
INSERT INTO Zajecia Values(24,   4,  5, 29, 17, 11, 'CZW');
INSERT INTO Zajecia Values(25,   4,  4, 29, 17, 12, 'PTA');
INSERT INTO Zajecia Values(26,   4,  5, 24, 17, 13, 'CZW');
INSERT INTO Zajecia Values(27,  24,  1, 20, 14,  1, 'WTO');
INSERT INTO Zajecia Values(28,  16,  1,  6, 16, 10, 'WTO');
INSERT INTO Zajecia Values(29,  10,  2, 20, 22, 12, 'PTA');
INSERT INTO Zajecia Values(30,  22,  3,  5, 22, 12, 'PTA');
INSERT INTO Zajecia Values(31,  12,  3,  6, 16, 11, 'WTO');
INSERT INTO Zajecia Values(32,  16,  1, 15, 14, 11, 'PTA');
INSERT INTO Zajecia Values(33,  22,  1,  4, 19, 11, 'PON');
INSERT INTO Zajecia Values(34,  22,  2,  5, 25, 12, 'SRO');
INSERT INTO Zajecia Values(35,  11,  2,  2, 24, 10, 'SRO');
INSERT INTO Zajecia Values(36,  14,  2,  5, 22,  2, 'WTO');
INSERT INTO Zajecia Values(37,  11,  1,  1, 19,  2, 'PON');
INSERT INTO Zajecia Values(38,  13,  2,  5, 22, 11, 'PON');
INSERT INTO Zajecia Values(39,  11,  3, 16, 23,  2, 'PON');
INSERT INTO Zajecia Values(40,  15,  2, 14, 24, 13, 'PON');
INSERT INTO Zajecia Values(41,  14,  3,  8, 21,  2, 'WTO');
INSERT INTO Zajecia Values(42,  12,  2,  9, 21, 12, 'WTO');
INSERT INTO Zajecia Values(43,  11,  3,  3, 22,  3, 'PON');
INSERT INTO Zajecia Values(44,  11,  3, 27, 25, 11, 'PON');
INSERT INTO Zajecia Values(45,  12,  2, 10, 21,  3, 'WTO');
INSERT INTO Zajecia Values(46,  24,  3,  6, 25, 11, 'SRO');
INSERT INTO Zajecia Values(47,  16,  1, 23, 16,  1, 'PTA');
INSERT INTO Zajecia Values(48,  11,  1,  5, 18, 11, 'SRO');
INSERT INTO Zajecia Values(49,  15,  1, 16, 18, 11, 'PTA');
INSERT INTO Zajecia Values(50,  14,  1, 11, 23, 13, 'WTO');
INSERT INTO Zajecia Values(51,  12,  1, 10, 23, 12, 'CZW');
INSERT INTO Zajecia Values(52,  16,  2, 16, 22, 12, 'WTO');
INSERT INTO Zajecia Values(53,  11,  3, 20, 23, 10, 'PTA');
INSERT INTO Zajecia Values(54,  15,  3,  7, 24,  2, 'PON');
INSERT INTO Zajecia Values(55,  24,  1,  8, 14, 10, 'SRO');
INSERT INTO Zajecia Values(56,  13,  3,  2, 25, 13, 'SRO');
INSERT INTO Zajecia Values(57,  12,  1, 17, 18, 13, 'PON');
INSERT INTO Zajecia Values(58,  22,  2,  1, 22, 10, 'CZW');
INSERT INTO Zajecia Values(59,  13,  1,  4, 16, 13, 'WTO');
INSERT INTO Zajecia Values(60,   9,  3,  1, 25,  3, 'WTO');
INSERT INTO Zajecia Values(61,  16,  3, 21, 24, 12, 'SRO');
INSERT INTO Zajecia Values(62,  16,  1, 11, 16,  2, 'SRO');
INSERT INTO Zajecia Values(63,  22,  1,  6, 25, 13, 'PTA');
INSERT INTO Zajecia Values(64,  22,  1,  7, 14, 10, 'WTO');
INSERT INTO Zajecia Values(65,  13,  3,  5, 21, 12, 'WTO');
INSERT INTO Zajecia Values(66,  13,  2, 26, 21,  2, 'SRO');
INSERT INTO Zajecia Values(67,  23,  1, 25,  6,  9, 'PTA');
INSERT INTO Zajecia Values(68,   7,  1, 16,  6,  9, 'PTA');
INSERT INTO Zajecia Values(69,  25,  3, 21,  6,  9, 'CZW');
INSERT INTO Zajecia Values(70,   8,  2, 26,  6,  6, 'WTO');
INSERT INTO Zajecia Values(71,  17,  3, 17,  2,  6, 'WTO');
INSERT INTO Zajecia Values(72,  25,  2,  5, 11,  9, 'PTA');
INSERT INTO Zajecia Values(73,   1,  1, 13, 13,  8, 'PON');
INSERT INTO Zajecia Values(74,   8,  3, 25, 13,  6, 'CZW');
INSERT INTO Zajecia Values(75,   6,  1,  1,  6,  9, 'SRO');
INSERT INTO Zajecia Values(76,   2,  2, 21, 13,  9, 'CZW');
INSERT INTO Zajecia Values(77,  25,  3,  4,  7,  6, 'SRO');
INSERT INTO Zajecia Values(78,  17,  2, 15, 11,  8, 'SRO');
INSERT INTO Zajecia Values(79,   2,  1, 13,  2,  6, 'PTA');
INSERT INTO Zajecia Values(80,  23,  2, 24, 13,  9, 'WTO');
INSERT INTO Zajecia Values(81,   5,  3,  8, 11,  7, 'PON');
INSERT INTO Zajecia Values(82,   5,  3, 11, 11,  8, 'CZW');
INSERT INTO Zajecia Values(83,  23,  2, 25,  9,  7, 'PON');
INSERT INTO Zajecia Values(84,  23,  2,  9, 11,  8, 'PTA');
INSERT INTO Zajecia Values(85,  25,  2, 27, 12,  8, 'PTA');
INSERT INTO Zajecia Values(86,   2,  1,  9,  2,  9, 'CZW');
INSERT INTO Zajecia Values(87,  17,  3, 13, 11,  7, 'WTO');
INSERT INTO Zajecia Values(88,   7,  2,  2,  7,  8, 'CZW');
INSERT INTO Zajecia Values(89,   2,  3,  2,  9,  8, 'CZW');
INSERT INTO Zajecia Values(90,   8,  2, 23, 12,  8, 'WTO');
INSERT INTO Zajecia Values(91,   7,  2,  8, 11,  9, 'PTA');
INSERT INTO Zajecia Values(92,  25,  1, 20,  6,  6, 'WTO');
INSERT INTO Zajecia Values(93,   1,  1,  6, 11,  7, 'SRO');
INSERT INTO Zajecia Values(94,  25,  1, 12, 11,  9, 'WTO');
INSERT INTO Zajecia Values(95,   1,  2, 25,  3,  8, 'PON');
INSERT INTO Zajecia Values(96,   1,  3,  9, 12,  6, 'PON');
INSERT INTO Zajecia Values(97,  18,  2, 23, 27,  5, 'PTA');
INSERT INTO Zajecia Values(98,  26,  1, 15, 28,  5, 'CZW');
INSERT INTO Zajecia Values(99,  21,  1, 13, 26,  5, 'WTO');
INSERT INTO Zajecia Values(100, 18,  2, 24, 29,  4, 'CZW');
INSERT INTO Zajecia Values(101, 19,  1, 20, 29,  5, 'WTO');
INSERT INTO Zajecia Values(102, 20,  1,  8, 29,  4, 'CZW');
INSERT INTO Zajecia Values(103, 18,  3, 25, 29,  5, 'PTA');
INSERT INTO Zajecia Values(104, 26,  2, 22, 28,  5, 'PON');
INSERT INTO Zajecia Values(105, 20,  3, 27, 26,  5, 'WTO');
INSERT INTO Zajecia Values(106, 19,  2, 22, 27,  4, 'PON');
INSERT INTO Zajecia Values(107, 21,  3,  6, 26,  4, 'PTA');
INSERT INTO Zajecia Values(108, 21,  2,  4, 27,  5, 'CZW');
commit;

INSERT INTO Ocena Values (1,    21,   1,  2.0,  to_date('2020-06-23', 'YYYY-MM-DD'));
INSERT INTO Ocena Values (2,     1,  14,  4.0,  to_date('2020-06-21', 'YYYY-MM-DD'));
INSERT INTO Ocena Values (3,    11,  27,  3.5,  to_date('2019-11-09', 'YYYY-MM-DD'));
INSERT INTO Ocena Values (4,    21,  47,  3.0,  to_date('2019-06-18', 'YYYY-MM-DD'));
INSERT INTO Ocena Values (5,    33,   2,  3.0,  to_date('2020-04-23', 'YYYY-MM-DD'));
INSERT INTO Ocena Values (6,    33,  15,  3.5,  to_date('2020-06-23', 'YYYY-MM-DD'));
INSERT INTO Ocena Values (7,    34,  36,  4.0,  to_date('2018-12-21', 'YYYY-MM-DD'));
INSERT INTO Ocena Values (8,    36,  37,  2.0,  to_date('2020-11-18', 'YYYY-MM-DD'));
INSERT INTO Ocena Values (9,    33,  39,  4.5,  to_date('2019-11-12', 'YYYY-MM-DD'));
INSERT INTO Ocena Values (10,   39,  41,  3.0,  to_date('2019-06-29', 'YYYY-MM-DD'));
INSERT INTO Ocena Values (11,   33,  54,  3.5,  to_date('2019-12-12', 'YYYY-MM-DD'));
INSERT INTO Ocena Values (12,   13,  62,  2.0,  to_date('2019-06-11', 'YYYY-MM-DD'));
INSERT INTO Ocena Values (13,   33,  66,  3.0,  to_date('2019-06-23', 'YYYY-MM-DD'));
INSERT INTO Ocena Values (14,   13,   2,  3.0,  to_date('2019-05-23', 'YYYY-MM-DD'));
INSERT INTO Ocena Values (15,   47,  15,  4.0,  to_date('2020-06-21', 'YYYY-MM-DD'));
INSERT INTO Ocena Values (16,   20,  36,  5.0,  to_date('2020-03-01', 'YYYY-MM-DD'));
INSERT INTO Ocena Values (17,   47,  37,  4.0,  to_date('2019-06-12', 'YYYY-MM-DD'));
INSERT INTO Ocena Values (18,   47,  39,  4.5,  to_date('2019-04-01', 'YYYY-MM-DD'));
INSERT INTO Ocena Values (19,   47,  41,  5.0,  to_date('2020-06-22', 'YYYY-MM-DD'));
INSERT INTO Ocena Values (20,   47,  54,  5.0,  to_date('2020-10-21', 'YYYY-MM-DD'));
INSERT INTO Ocena Values (21,   17,  3,   3.5,  to_date('2019-06-21', 'YYYY-MM-DD'));
INSERT INTO Ocena Values (22,   17,  66,  3.0,  to_date('2019-03-30', 'YYYY-MM-DD'));
INSERT INTO Ocena Values (23,   50,  54,  5.0,  to_date('2019-02-25', 'YYYY-MM-DD'));
INSERT INTO Ocena Values (24,  	 2,  3,   3.5,  to_date('2020-01-21', 'YYYY-MM-DD'));
INSERT INTO Ocena Values (25,    4,  6,   3.0,  to_date('2020-03-30', 'YYYY-MM-DD'));
INSERT INTO Ocena Values (26,   47,  41,  5.0,  to_date('2020-06-26', 'YYYY-MM-DD'));
INSERT INTO Ocena Values (27,   47,  54,  5.0,  to_date('2020-02-25', 'YYYY-MM-DD'));
INSERT INTO Ocena Values (28,   17,  3,   3.5,  to_date('2020-06-21', 'YYYY-MM-DD'));
INSERT INTO Ocena Values (29,   17,  66,  4.0,  to_date('2018-05-30', 'YYYY-MM-DD'));
INSERT INTO Ocena Values (30,   50,  54,  2.0,  to_date('2020-02-25', 'YYYY-MM-DD'));
INSERT INTO Ocena Values (31,  	 3,  5,   3.5,  to_date('2020-01-21', 'YYYY-MM-DD'));
INSERT INTO Ocena Values (32,    4,  6,   3.0,  to_date('2020-03-30', 'YYYY-MM-DD'));
INSERT INTO Ocena Values (33,    5,  54,  5.0,  to_date('2020-02-25', 'YYYY-MM-DD'));
INSERT INTO Ocena Values (34,  	26,  5,   3.5,  to_date('2020-01-21', 'YYYY-MM-DD'));
INSERT INTO Ocena Values (35,   44,  8,   4.0,  to_date('2020-03-30', 'YYYY-MM-DD'));



commit;




--------------------------------- zad 1 --------------------------------------
SELECT
w.imie, w.nazwisko,
(SELECT COUNT(*) FROM zajecia z WHERE z.id_wykladowca = w.id_wykladowca) as liczba_zajec
FROM
wykladowca w;
------------------------------- zad 2 -------------------------------------
SELECT
s.imie, s.nazwisko,
(SELECT AVG(o.ocena) FROM ocena o WHERE o.id_student = s.id_student) as srednia
FROM
student s;
------------------------------ zad 3 --------------------------------------
SELECT
p.nazwa, w.imie, count(*) liczba from zajecia
NATURAL JOIN przedmiot p
NATURAL JOIN wykladowca w
NATURAL JOIN ocena o
WHERE o.ocena <3
GROUP BY p.nazwa, w.imie
ORDER BY liczba desc;


----------------------------- zad 4 ---------------------

SELECT
w.imie, w.nazwisko, count(*)
FROM
wykladowca w
LEFT JOIN zajecia z ON z.id_wykladowca = w.id_wykladowca
GROUP BY z.id_wykladowca, w.imie, w.nazwisko
HAVING COUNT(*) > (SELECT avg(count(*)) FROM zajecia GROUP BY zajecia.id_wykladowca);

------------- zad 5 -------------------

SELECT
s.imie, s.nazwisko, g.nazwa as grupa, k.nazwa as kierunek
FROM
student s
LEFT JOIN grupa g ON g.id_grupa = s.id_grupa
LEFT JOIN kierunek k ON k.id_kierunek = g.id_kierunek
ORDER BY k.id_kierunek, g.id_grupa ASC



-----zad 8 -----

SELECT nazwisko || ' '|| imie "DANE STUDENTA". miasto
FROM student s, adres a
where s.id_adres=a.id_adres


------------------ zestaw 2 zad 1 --------------------
set serveroutput on

declare

imie varchar2(20) :='&a';
nazwisko varchar2(30) :='&b';
begin
dbms_output.put_line('Witaj ' || imie || ' ' || nazwisko || ' !');
end;
















