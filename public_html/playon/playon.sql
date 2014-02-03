CREATE TABLE playon (
	id int not null AUTO_INCREMENT PRIMARY KEY,
	email varchar(32) not null, 
	name varchar(32),
	country char(2) foreign key not null,
	country_other varchar(32),
	photo char(64),

	city varchar(32),

	address_1 varchar(32),
	address_2 varchar(32),
	address_3 varchar(32),

	tel_country_code int foreign key,
	tel_country_code_other varchar(8),
	telephone varchar(32),
	telephone_mobile varchar(32),
	telephone_other varchar(32),

	email_other varchar(32),

	website varchar(32),
	website_other varchar(32),

	messenger varchar(32),
	messenger_type varchar(32),

	other_profile_info varchar(2048),

	FOREIGN KEY (country char) REFERENCES country(country_id),
	FOREIGN KEY (tel_country_code) REFERENCES country(telephone_code),

) TYPE=INNODB;

CREATE TABLE country (
	id int not null AUTO_INCREMENT PRIMARY KEY,
	country_id char(2),
	name varchar(32) not null,
	telephone_code int
) TYPE=INNODB;

INSERT INTO country VALUES (1, 'ar', 'Argentina', '54');
INSERT INTO country VALUES (2, 'br', 'Brazil', '55');
INSERT INTO country VALUES (3, 'ec', 'Ecuador', '593');
INSERT INTO country VALUES (4, 'fr', 'France', '33');
INSERT INTO country VALUES (5, 'de', 'Germany', '49');
INSERT INTO country VALUES (6, 'it', 'Italy', '39');
INSERT INTO country VALUES (7, 'kr', 'South Korea', '82');
INSERT INTO country VALUES (8, 'mx', 'Mexico', '52');
INSERT INTO country VALUES (9, 'nl', 'Netherlands', '31');
INSERT INTO country VALUES (10, 'pl', 'Poland', '48');
INSERT INTO country VALUES (11, 'cs', 'Serbia and Montenegro', '381');
INSERT INTO country VALUES (12, 'za', 'South Africa', '27');
INSERT INTO country VALUES (13, 'tt', 'Trindad & Tobago', '1868');
INSERT INTO country VALUES (14, 'tg', 'Togo', '228');
INSERT INTO country VALUES (15, 'us', 'United States', '1');
INSERT INTO country VALUES (16, 'hr', 'Croatia', '385');