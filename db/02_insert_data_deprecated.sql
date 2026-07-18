

-- https://www.postgresql.org/docs/current/sql-insert.html

-- Orden de inserción mínimo para generar un pedido de prueba:
-- Utilizar un CTE: Common Table Expression
-- rollback:
-- begin;
-- 1.	persons
insert into persons (dni, first_names, last_names, telephone_number, email, address, birth_date, is_active, creation_date)
values ('87654321', 'Primera Persona', 'de Prueba', '987654321', 'primera_persona_de_prueba@email.com', 'dirección 1', '01-01-2026', true, current_timestamp);
select * from persons;
-- 2.	users
insert into users (id_person, code, is_active, creation_date)
values (1, 'usuario-prueba-1', true, current_timestamp);

-- 3.	supplies_categories
insert into supplies_categories (name)
values ('papas'), ('ensalada'), ('arroz'), ('pollo'), ('res');


-- 4.	measures_types
insert into measures_types (name)
values ('porcion'), ('palo'), ('botella');


-- 5.	supplies
insert into supplies (name, id_supply_category, id_measure_type, price, description, is_active)
values 
	('Papas fritas', 1, 1, 0, 'una porción papas fritas', true),
	('Pollo', 4, 1, 0, 'una porción de pollo', true),
	('Arroz', 3, 1, 0, 'una porción de arroz', true),
	('Anticuchos', 5, 2, 0, 'un palo de anticuchos', true);



-- 6.	items
-- Como defino aqui una porción de papas fritas como guarnición, si ya esta como insumo(supplies)?
insert into items (name, description, sell_price, item_type, is_active)
values 
	('Pollo a la plancha', 'Una porción de pollo a la plancha con dos guarniciones de papás fritas, papas sancochadaz, arroz o ensalada', 34.00, 'dish', true),
	('Gaseosa personal', 'Una bebida gaseosa de tamaño personal', 6.50, 'drink', true);


-- 7.	dishes
insert into dishes (id_item, max_garnishes, is_active)
values (1, 2, true);


-- 8.	drinks
insert into drinks (id_item, id_measure_type, brand, volume_ml, is_alcoholic)
values (2, 3, 'Inka-Cola', 600, false);

-- 9.	supplies_dishes
insert into supplies_dishes (id_supply, id_dish, amount)
values 
	(1, 1, 1),
	(2, 1, 1),
	(3, 1, 1);

-- 10.	dishes_garnishes
insert into dishes_garnishes (id_supply, id_dish)
values 
	(1, 1),
	(3, 1);	

-- 11.	dishes_additions
insert into dishes_additions (id_supply, id_dish, extra_price)
values 
	(4, 1, 5.00);	

-- 12.	orders
insert into orders (total_price, tip, issue_date, id_issuing_user, id_client)
values (50.50, 5.00, current_timestamp, 1, null);

-- 13.	orders_details
insert into orders_details (id_order, id_item, amount, unit_price, subtotal)
values
	(1, 1, 1, 34.00, 34.00),
	(1, 2, 1, 6.50, 6.50);

-- 14.	orders_details_garnishes
insert into orders_details_garnishes (id_order_detail, id_supply)
values
	(1, 1),
	(1, 3);

-- 15.	orders_details_additions
insert into orders_details_additions (id_order_detail, id_supply, amount, unit_price)
values (1, 4, 2, 5.00);

-- rollback;