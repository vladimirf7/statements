sqlite3 shop.db

N/A

N/A

CREATE TABLE "category" (
    category_id INTEGER PRIMARY KEY AUTOINCREMENT,
    category_name VARCHAR(64) NOT NULL
);

INSERT INTO "category" (category_name) VALUES ("Footwear");
INSERT INTO "category" (category_name) VALUES ("Headwear");
INSERT INTO "category" (category_name) VALUES ("Accessories");

CREATE TABLE "item" (
    item_id INTEGER PRIMARY KEY AUTOINCREMENT,
    item_name VARCHAR(64) NOT NULL,
    item_category INT NOT NULL,
    item_price REAL NOT NULL
);

INSERT INTO "item" (item_name, item_category, item_price) VALUES ("Sneakers", 1, 1.0);
INSERT INTO "item" (item_name, item_category, item_price) VALUES ("Loafers", 1, 1.0);
INSERT INTO "item" (item_name, item_category, item_price) VALUES ("Boot", 1, 1.0);
INSERT INTO "item" (item_name, item_category, item_price) VALUES ("Belt", 3, 1.0);
INSERT INTO "item" (item_name, item_category, item_price) VALUES ("Tie", 3, 1.0);
INSERT INTO "item" (item_name, item_category, item_price) VALUES ("Scarf", 3, 1.0);
INSERT INTO "item" (item_name, item_category, item_price) VALUES ("Cap", 2, 1.0);
INSERT INTO "item" (item_name, item_category, item_price) VALUES ("Hat", 2, 1.0);

UPDATE "item" SET item_price = 3.5 WHERE item_id = 1;

UPDATE "item" SET item_price = (item_price + item_price / 10);

DELETE FROM "item" WHERE item_id = 2;

SELECT * FROM "item" ORDER BY item_name;

SELECT * FROM "item" ORDER BY item_price DESC;

SELECT * FROM "item" ORDER BY item_price DESC LIMIT 3;

SELECT * FROM "item" ORDER BY item_price LIMIT 3;

SELECT * FROM "item" ORDER BY item_price DESC LIMIT 3 OFFSET 3;

SELECT item_name FROM "item" ORDER BY item_price DESC LIMIT 1;

SELECT item_name FROM "item" ORDER BY item_price LIMIT 1;

SELECT count(*) FROM "item";

SELECT avg(item_price) FROM "item";

CREATE VIEW "most_expensive" AS
SELECT * FROM "item" ORDER BY item_price DESC LIMIT 3;
