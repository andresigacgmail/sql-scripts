-- funciones
select count(payment_id) from payment;

select avg(amount) from payment;

select max(amount) from payment;

select max(length) from film;

select min(length) from film;

select count(rental_id) from rental;

-- group by

select last_name, count(last_name) as veces from actor group by last_name order by veces desc;

select last_name, first_name, count(last_name) as veces from actor
    group by last_name, first_name;

select last_name, first_name, count(last_name) as veces from actor
    group by 1,2;


-- HAVING

select last_name, count(*) from actor group by 1 having count(*) > 3;

SELECT * FROM customer;

select c.customer_id, c.last_name, c.first_name, sum(amount) as total
    from payment p inner join customer c on p.customer_id = c.customer_id 
    group by 1,2,3 having total < 100 order by total desc;


select first_name, last_name from actor where last_name = 'allen';

select last_name, count(last_name) as cantidad from actor 
    GROUP by last_name HAVING cantidad > 2;

-- FUNCIONES UTILES

select name, char_length(name) from category;

select city, char_length(city) from city;

select first_name, last_name, concat(first_name,' ', last_name) from customer;

select concat_ws(" - ", title, description, release_year) from film;

select amount, round(amount) from payment;

select *, lcase(concat(first_name, " ",last_name)) as "nombre completo" from actor;

-- CASE

select address, address2, 
    case
        when address2 is null then 
            "sin direccion"
    else
        "con direccion"
    end 
    as comentario from address;


select * from payment;

select payment_id, amount,
    case
        when amount < 1 then "precio minimo"
        when amount between 1 and 3 then "precio intermedio"
        else "precio maximo"
    end
    as precio from payment;

select * from film;

select title, rental_rate,
    case 
        when rental_rate < 1 then "pelicula mala"
        when rental_rate between 1 and 3 then "pelicula buena"
        else "pelicula excelente"
    end 
    as evaluacion from film;


-- SUBQUERIES

select title, language_id from film where title like 'K%' or title like 'Q%' 
    and title in (select title from film where language_id 
    in (select language_id from language where name = 'English'));

select first_name, last_name from actor where actor_id 
    in (select actor_id from film_actor where film_id 
    in (select film_id from film where title = 'Alone Trip'));

select title from film where film_id 
    in (select film_id from film_category where category_id
    in (select category_id from category where name = 'Family' ));

select concat_ws(' ', first_name, last_name) , email from customer where customer_id 
    in (select customer_id from rental where inventory_id 
    in (select inventory_id from inventory where film_id 
    in (select film_id from film_category where category_id 
    in (select category_id from category where name = 'Children' ))));

select * from customer c join rental r on c.customer_id = r.customer_id 
    join inventory i on r.inventory_id = i.inventory_id
    join film f on i.film_id = f.film_id
    join film_category fi on fi.film_id = f.film_id
    join category ca on ca.category_id = fi.category_id where name = 'Children';


select * from customer, rental where customer.customer_id = rental.customer_id;

select * from customer c join rental r on c.customer_id = r.customer_id;



select avg(amount) from payment;
select customer_id, avg(amount) from payment group by customer_id;
select customer_id, avg(amount) from payment group by customer_id having avg(amount) > (select avg(amount) from payment);

-- VIEW

create or replace view peliculas_rentadas_por_cliente as
    select c.customer_id, c.store_id, concat_ws(' ', c.first_name, c.last_name), c.email, 
        r.rental_date, f.title, f.description, ca.name as categoria
    from customer c join rental r on c.customer_id = r.customer_id 
        join inventory i on r.inventory_id = i.inventory_id
        join film f on i.film_id = f.film_id
        join film_category fi on fi.film_id = f.film_id
        join category ca on ca.category_id = fi.category_id;

select * from peliculas_rentadas_por_cliente;

drop view peliculas_rentadas_por_cliente;

show tables;
describe peliculas_rentadas_por_cliente;


select * from customer;
select * from address;
select * from city;
select * from country;

create view lista_de_clientes as
    select c.customer_id, concat_ws(' ', c.first_name, c.last_name) as full_name, a.address, ci.city, 
           a.district, co.country
        from customer c inner join address a on c.address_id = a.address_id
        inner join city ci on ci.city_id = a.city_id 
        inner join country co on co.country_id = ci.country_id order by co.country, a.district;

select * from lista_de_clientes;

select c.customer_id, concat_ws(' ', c.first_name, c.last_name) as full_name, a.address, ci.city, 
        a.district, co.country 
            from customer c, address a, city ci, country co where
            c.address_id = a.address_id and
            ci.city_id = a.city_id and
            co.country_id = ci.country_id order by co.country, a.district;



-- consultas varias
-- ¿quien vendio mas del staff en agosto de 2005?
select s.first_name, s.last_name, sum(p.amount) from staff s inner join payment p 
    on s.staff_id = p.staff_id where p.payment_date like '2005-08%' 
    group by s.first_name, 2;

-- lista de cada pelicula y el número de actores, film_actor Y film
select * from film_actor;
select * from film;
select * from actor;

select fa.film_id, f.title, count(fa.film_id) as 'can actores' from film f inner join film_actor fa 
    on f.film_id = fa.film_id group by fa.film_id;

-- ¿cuantas copias de la pelicula Hunchback impossible existen?

show tables;
select * from inventory;
select f.title, count(f.film_id) as cantidad from film f inner join inventory i on f.film_id = i.film_id 
    where f.title = 'Hunchback impossible';

-- total pagado por cada cliente, listar alfabeticamente

show tables;
select * from customer;
select * from payment;

select p.customer_id, c.first_name, sum(p.amount) from payment p inner join customer c 
    on p.customer_id = c.customer_id group by p.customer_id order by c.first_name;


-- la tabla city auto_incremet el city_id y current_timestamp() para el campo last_update, 
-- además, on update current_timestamp(),
describe city;
select * from city order by city_id desc;
insert into city (city, country_id) values ('runcat', 83);
delete from city where city_id = 602;


-- update
show tables;
select * from customer order by customer_id desc;

insert into customer (store_id, first_name, last_name, email, address_id, active) 
    values (1, 'pepe', 'patch', 'pepe@mail.com', 5, 1);

update customer set first_name = 'Pepe', last_name = 'Patch' where customer_id = 600;


-- alter table
select * from actor;
alter table actor add column genero char (1);
alter table actor drop column genero;


select * from film_text;
alter table film_text add column categoria varchar (30);
alter table film_text drop column categoria;
update film_text set categoria = 'Horror' where film_id between 1 and 10;
update film_text set categoria = 'Horror' where film_id <= 10;

-- ejercicios complementarios 

-- ¿Qué actores tienen el primer nombre 'Scarlett'?
select * from actor where first_name = 'Scarlett';
-- ¿Qué actores tienen el apellido "Johansson"?
select * from actor where last_name = 'Johansson';
-- ¿Cuántos apellidos de actores distintos hay?
select count( distinct( last_name ) ) from actor;
-- ¿Qué apellidos no se repiten?
select last_name, count( last_name  ) from actor group by last_name having count( last_name ) = 1;
-- ¿Qué actor ha aparecido en la mayoría de las películas?
select count(a.actor_id) as movies_by_actor, concat_ws(' ',a.first_name , a.last_name) as name 
    from actor a, film f, film_actor fa where a.actor_id = fa.actor_id 
    and fa.film_id = f.film_id group by a.actor_id order by movies_by_actor desc limit 1;
-- ¿Se puede alquilar ‘Academy Dinosaur’ en la tienda 1?
select * from film f, store s, inventory i where f.film_id = i.film_id and s.store_id = i.store_id
    and f.title = 'ACADEMY DINOSAUR' and s.store_id = 1;

select film.film_id, film.title, store.store_id, inventory.inventory_id
    from inventory join store using (store_id) join film using (film_id)
    where film.title = 'Academy Dinosaur' and store.store_id = 1;



show TABLES;
select * from store;
select * from rental;
select * from film;
select * from inventory;






SHOW GLOBAL VARIABLES LIKE 'slow_query_log';



