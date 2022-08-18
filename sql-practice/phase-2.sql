-- Using subqueries,
-- find the names of the cats whose owners
-- are either George Beatty or Melynda Abshire
-- Your code here
/*
SELECT DISTINCT cats.name
FROM cats
JOIN cat_owners ON cats.id = cat_owners.cat_id
JOIN owners ON owners.id = cat_owners.owner_id
WHERE (owners.first_name = 'George' AND owners.last_name = 'Beatty')
  OR (owners.first_name = 'Melynda' AND owners.last_name = 'Abshire');
*/
-- returns Bella ,Tiger, Oscar, Garfield, Red

SELECT DISTINCT cats.name
FROM cats
WHERE id IN (
  SELECT cat_id
  FROM cat_owners
  WHERE owner_id IN (
    SELECT owners.id
    FROM owners
    WHERE (owners.first_name = 'George' AND owners.last_name = 'Beatty')
      OR (owners.first_name = 'Melynda' AND owners.last_name = 'Abshire')
  )
);
