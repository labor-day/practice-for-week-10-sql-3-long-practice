-- Give "Red" the cat one of every toy the other cats have
-- Your code here

--id of Red
--9
SELECT id FROM cats WHERE name = 'Red'

-- all toys from other cats
SELECT name
FROM toys
WHERE cat_id != 9

SELECT name
FROM toys
WHERE cat_id != (SELECT id FROM cats WHERE name = 'Red')

INSERT INTO
toys (cat_id, name)
SELECT (SELECT id FROM cats WHERE name = 'Red'), name
FROM toys
WHERE cat_id != (SELECT id FROM cats WHERE name = 'Red');


-- Query spoiled cats reporting the most spoiled first
-- Your code here

-- gets cat ids with 2 or more toysa
SELECT cat_id, COUNT(*)
FROM toys
GROUP BY cat_id
HAVING COUNT(*) >= 2
ORDER BY COUNT(*) DESC;

SELECT cats.name, COUNT(*)
FROM cats
WHERE cats.id IN
(SELECT cat_id
FROM toys
GROUP BY cat_id
HAVING COUNT(*) >= 2);

SELECT cats.name, COUNT(*)
FROM cats JOIN toys ON cats.id = toys.cat_id
GROUP BY cats.name
HAVING COUNT(*) >= 2
ORDER BY COUNT(*) DESC;
