CREATE DATABASE transaction_db;

USE transaction_db;

CREATE TABLE persons (
	person_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    address VARCHAR(255)
);

CREATE TABLE accounts (
	account_id INT AUTO_INCREMENT PRIMARY KEY,
    person_id INT NOT NULL,
    account_number VARCHAR(255) NOT NULL,
    balance INT UNSIGNED DEFAULT 0,
    FOREIGN KEY (person_id) REFERENCES persons(person_id)
);


INSERT INTO persons (full_name, address) 
	VALUES ("Linus", "Sagogatan"), ("Anna", "Drömstigen");


SELECT * FROM persons;

INSERT INTO accounts (person_id, account_number)
	VALUES (1, "1337"),  (1, "0042");
    
SELECT * FROM accounts;

UPDATE accounts SET balance=balance+1000000 WHERE account_id=1;
UPDATE accounts SET balance=balance-1000000 WHERE account_id=2;

UPDATE accounts SET balance=0 WHERE account_id=1 OR account_id=2;