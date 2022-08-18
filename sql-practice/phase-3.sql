-- Find the name of the cats co-owned by both George Beatty and Melynda Abshire
-- Your code here

--cats owned by George
--returns 4,5,9
SELECT cat_id
FROM cat_owners
WHERE owner_id IN (SELECT id FROM owners WHERE first_name = 'George' AND last_name = 'Beatty')

--cats owned by Melynda
--returns 4, 5, 6, 7
SELECT cat_id
FROM cat_owners
WHERE owner_id IN (SELECT id FROM owners WHERE first_name = 'Melynda' AND last_name = 'Abshire')

--cat ids from only both
--returns 4, 5, 4, 5
SELECT cat_id
FROM cat_owners
WHERE cat_id IN (4, 5, 6, 7) AND cat_id IN (4, 5, 9)



SELECT cat_id
FROM cat_owners JOIN owners ON owner_id = id
WHERE owner_id IN (SELECT id FROM owners WHERE first_name = 'Melynda' AND last_name = 'Abshire')

SELECT cat_id
FROM cat_owners JOIN owners ON owner_id = id
WHERE owner_id IN (SELECT id FROM owners WHERE first_name = 'George' AND last_name = 'Beatty')

SELECT DISTINCT name FROM cats WHERE id IN
(SELECT cat_id
FROM cat_owners
WHERE cat_id IN
(SELECT cat_id
FROM cat_owners JOIN owners ON owner_id = id
WHERE owner_id IN (SELECT id FROM owners WHERE first_name = 'Melynda' AND last_name = 'Abshire'))
AND cat_id IN
(SELECT cat_id
FROM cat_owners JOIN owners ON owner_id = id
WHERE owner_id IN (SELECT id FROM owners WHERE first_name = 'George' AND last_name = 'Beatty')));
