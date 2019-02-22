USE MASTER;

DROP DATABASE hearthstone;
CREATE DATABASE hearthstone;
GO

USE hearthstone;

CREATE TABLE decks(
	deckId	INT	IDENTITY(1,1),
	heroId	INT,
	name	VARCHAR(20)
);

CREATE TABLE heros(
	heroId		INT IDENTITY(1,1),
	classId		INT,
	name		VARCHAR(20),
	power		VARCHAR(100)
);

CREATE TABLE cardDecks(
	deckId		INT,
	cardId		INT
);

CREATE TABLE cards(
	cardId		INT	IDENTITY(1,1),
	classId		INT,
	rarityId	INT,
	typeId		INT,
	name		VARCHAR(50),
	description	VARCHAR(200),
	cost		INT,
	attack		INT,
	hp			INT
);

CREATE TABLE classes(
	classId		INT IDENTITY(1,1),
	name		VARCHAR(20)
);

CREATE TABLE rarities(
	rarityId	INT IDENTITY(1,1),
	name		VARCHAR(20)
);

CREATE TABLE types(
	typeId		INT IDENTITY(1,1),
	name		VARCHAR(20)
);


-- PK
ALTER TABLE decks
ADD CONSTRAINT PK_deckId
PRIMARY KEY (deckId);

ALTER TABLE heros
ADD CONSTRAINT PK_heroId
PRIMARY KEY (heroId);

ALTER TABLE cards
ADD CONSTRAINT PK_cardId
PRIMARY KEY (cardId);

ALTER TABLE classes
ADD CONSTRAINT PK_classId
PRIMARY KEY (classId);

ALTER TABLE rarities 
ADD CONSTRAINT PK_rarityId
PRIMARY KEY (rarityId);

ALTER TABLE types 
ADD CONSTRAINT PK_typeId
PRIMARY KEY (typeId);


-- FK
ALTER TABLE cards
ADD CONSTRAINT FK_cardClassId
FOREIGN KEY (classId)
REFERENCES classes(classId);

ALTER TABLE cards
ADD CONSTRAINT FK_rarityId
FOREIGN KEY (rarityId)
REFERENCES rarities(rarityId);

ALTER TABLE cards
ADD CONSTRAINT FK_typeId
FOREIGN KEY (typeId)
REFERENCES types(typeId);

ALTER TABLE decks
ADD CONSTRAINT FK_heroId
FOREIGN KEY (heroId) 
REFERENCES heros(heroId);

ALTER TABLE heros 
ADD CONSTRAINT FK_heroClassId
FOREIGN KEY (classId)
REFERENCES classes(classId);

ALTER TABLE cardDecks
ADD CONSTRAINT FK_cardId
FOREIGN KEY (cardId)
REFERENCES cards(cardId);

ALTER TABLE cardDecks
ADD CONSTRAINT FK_deckId
FOREIGN KEY (deckId)
REFERENCES decks(deckId);


-- Data
INSERT INTO heros(name, power)
VALUES ('Magni Bronzebeard', 'Gain 2 armor'),
	('Rexxar', 'Deal 2 damage tothe enemy hero.');
	
INSERT INTO decks(name, heroId)
VALUES ('King''s deck', 1), ('Deck of Putricide', 2); 

INSERT INTO classes(name)
VALUES('Warrior'), ('Hunter');

INSERT INTO rarities(name)
VALUES('Free'), ('Rare'), ('Epic'), ('Legendary');

INSERT INTO types(name)
VALUES('General'), ('Beast');

INSERT INTO cards(name, rarityId, typeId, classId, cost, attack, hp, description)
VALUES ('Kor''kron Elite', 1, 1, 1, 4, 4, 3, 'Charge The Kor''kron are the elite forces of Garrosh Hellscream. Let''s just say you don''t want to run into these guys while wearing a blue tabard'),
	('Seeping Oozeling', 2, 1, 2, 6, 5, 4, 'Battlecry:Gain theDeathrattleof a random minion in your deck.Uh, you might want to get that looked at.'),
	('Geosculptor', 3, 1, 1, 8, 4, 8, 'At the end of your turn, summon a random minion with Cost equal to your Armor(up to 10).Once crafted a gauntlet out ofearwax and pure ambition.'),
	('Houndmaster', 1, 1, 2, 4, 4, 3, 'Battlecry: Give a friendly Beast +2/+2 and Taunt. "Who let the dogs out?" he asks. It''s rhetorical.'),
	('Giant Sand Worm', 2, 2, 2, 8, 8, 8, 'Whenever this attacks and kills a minion, it may attack again.Banned from every all-you-can-eat buffet on Azeroth.'),
	('Raptor Hatchling', 2, 2, 2, 1, 2, 1, 'Deathrattle:Shuffle a 4/3 Raptor into your deck.They’re just baby teeth. Lots and lots of baby teeth.');

INSERT INTO cardDecks(deckId, cardId)
VALUES (1, 1), (1, 2), (1, 3),
	(2, 4), (2, 5), (2, 6);