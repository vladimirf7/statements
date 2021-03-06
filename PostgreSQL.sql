CREATE DATABASE shop;

CREATE USER shop;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO shop;

CREATE USER viewer;
GRANT CONNECT ON DATABASE shop TO viewer;
GRANT USAGE ON SCHEMA public TO viewer;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO viewer;

CREATE TABLE "category" (
    category_id SERIAL,
    category_name VARCHAR(64) NOT NULL,
    PRIMARY KEY(category_id),
    UNIQUE (category_id));

INSERT INTO "category" (category_name) VALUES
    ('Footwear'),
    ('Headwear'),
    ('Accessories');

CREATE TABLE "item" (
    item_id SERIAL,
    item_name VARCHAR(64) NOT NULL,
    item_category INT NOT NULL,
    item_price NUMERIC(3, 2) NOT NULL,
    PRIMARY KEY(item_id),
    UNIQUE (item_id));

INSERT INTO "item" (item_name, item_category, item_price) VALUES
    ('Sneakers', 1, 1.0),
    ('Loafers', 1, 1.0),
    ('Boot', 1, 1.0),
    ('Belt', 3, 1.0),
    ('Tie', 3, 1.0),
    ('Scarf', 3, 1.0),
    ('Cap', 2, 1.0),
    ('Hat', 2, 1.0);
);

UPDATE "item" SET item_price = 3.5 WHERE item_id = 1;

UPDATE "item" SET item_price = item_price * 1.1;

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
