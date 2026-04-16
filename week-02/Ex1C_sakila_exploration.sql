/* 
a)
*/ 

/*
a) Answer to first question as a full sentence. film_id, title, description,
release_year, language_id, original_language_id, remtal_duration, rental_rate,lenght, 
replacement_cost, rating ,special_features,last_update. 

b) Answer to second question as another full sentence.
film_actor table.
The rental table tracks every rental transaction. It includes columns like rental_id,
 rental_date, inventory_id, customer_id, return_date, and staff_id. It's hard to read
 because everything is stored as numbers — you can see that something was rented, 
 but not what was rented. You'd need to cross-reference other tables to get 
 any meaningful info.
 
 The inventory table is basically a catalog of every physical copy of a film the 
 store owns. It includes inventory_id, film_id, and store_id.

You need three tables: rental, inventory, and film. Rental tells you the date and which
 inventory item was rented inventory connects that inventory item to a film_id film connects 
 the film_id to the actual title

(etc. until the end of step 4) */

SELECT rental_id, rental_date, inventory_id FROM rental;
SELECT inventory_id, film_id FROM inventory;
SELECT film_id, title FROM film;
