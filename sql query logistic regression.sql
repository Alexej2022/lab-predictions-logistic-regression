USE sakila;
select title as film_name, l.name as language, length, rating, special_features, c.name as film_category,
case when date_format(rental_date, '%%m-%%Y') = '06-2005'
then 1 Else 0 End as 'rented'
from film f
join film_category fc
using(film_id)
join language l
using(language_id) 
join category c
using(category_id)
join inventory i
using(film_id)
left join rental r
using(inventory_id)
group by title, l.name, length, rating, special_features, c.name;