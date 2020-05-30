# CodeClan_Cinema

## Practicing inner join in psql

```
cinema=> select * from films
inner join tickets
on tickets.film_id = id
where tickets.customer_id = 4;
 id |    title     | price | customer_id | film_id 
----+--------------+-------+-------------+---------
  4 | Bee Movie    |    15 |           4 |       4
  5 | Pulp Fiction |    60 |           4 |       5
(2 rows)
```
