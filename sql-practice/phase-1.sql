--Insert new cat named "Red" born this year
-- Your code here
INSERT INTO
cats (name, birth_year)
VALUES ('Red', 2022);

--Assign ownership of new cat to George Beatty using subqueries
-- Your code here
INSERT INTO
cat_owners (cat_id, owner_id)
VALUES (
(SELECT id FROM cats WHERE name = 'Red'),
(SELECT id FROM owners WHERE last_name = 'Beatty')
);

--Query to verify INSERTs worked properly
-- Your code here
SELECT * FROM cats;
SELECT * FROM owners;
SELECT * FROM cat_owners;
