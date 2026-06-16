create table if not exists users (
	id bigint generated always as identity primary key,
	id_person bigint not null,
	code varchar(255) not null unique,
	is_active boolean default true not null,
	creation_date timestamp not null,
	id_creator_user bigint not null,
	last_edition_date timestamp not null,
	id_editor_user bigint not null,
	foreign key (id_person) references persons(id),
	foreign key (id_creator_user) references users(id),
	foreign key (id_editor_user) references users(id)
);

create table if not exists persons (
	id bigint generated always as identity primary key,
	dni varchar(8) not null unique,
	first_names varchar(255) not null,
	last_names varchar(255) not null,
	telephone_number varchar(20) not null unique,
	email varchar(255) not null unique,
	address varchar(500) not null,
	birth_date date not null,
	is_active boolean default true not null,
	creation_date timestamp not null,
	id_creator_user bigint not null,
	last_edition_date timestamp not null,
	id_editor_user bigint not null,
	foreign key (id_creator_user) references users(id),
	foreign key (id_editor_user) references users(id)
);

create table if not exists records_persons (
	id bigint generated always as identity primary key,
	id_person bigint not null,
	modified_field varchar(100) not null,
	previous_value varchar(100) not null,
	new_value varchar(100) not null,
	edition_date timestamp not null,
	id_editor_user bigint not null,
	foreign key (id_person) references persons(id),
	foreign key (id_editor_user) references users(id),
);


create table if not exists records_users (
	id bigint generated always as identity primary key,
	id_user bigint not null,
	modified_field varchar(100) not null,	
	edition_date timestamp not null,
	id_editor_user bigint not null,
	foreign key (id_editor_user) references users(id),
);

create table if not exists roles (
	id bigint generated always as identity primary key,	
	name varchar(100) not null unique	
);

create table if not exists users_roles (
	id bigint generated always as identity primary key,
	id_user bigint not null,
	id_role bigint not null,
	foreign key (id_user) references users(id),
	foreign key (id_role) references roles(id)
);

create table if not exists orders (
	id bigint generated always as identity primary key,
	total_price money not null,
	tip money,
	issue_date timestamp not null,
	id_issuing_user bigint not null,
	id_client bigint,	
	foreign key (id_issuing_user) references users(id),
	foreign key (id_client) references persons(id)
);

create table if not exists orders_details (
	id bigint generated always as identity primary key,
	id_order bigint not null,
	id_item bigint not null,	
	amount integer not null,
	unit_price money not null,
	subtotal money not null,	
	foreign key (id_order) references orders(id),
	foreign key (id_item) references items(id)
);

create table if not exists items (
	id bigint generated always as identity primary key,
	name varchar(100) not null unique,
	description varchar(500),	
	amount integer not null,
	item_type enum('dish', 'drink'),
	is_active boolean default true not null
);

create table if not exists dishes (
	id bigint generated always as identity primary key,
	id_item bigint not null,
	max_garnishes integer not null,
	is_active boolean default true not null,
	foreign key (id_item) references items(id)
);

create table if not exists drinks (
	id bigint generated always as identity primary key,
	id_item bigint not null,
	id_measure_type bigint not null,
	volume_ml integer not null,
	is_alcoholic boolean not null	
	is_active boolean default true not null,
	foreign key (id_item) references items(id),
	foreign key (id_measure_type) references measures_types(id)
);

create table if not exists measures_types (
	id bigint generated always as identity primary key,	
	name varchar(100) not null unique
);

create table if not exists supplies_categories (
	id bigint generated always as identity primary key,	
	name varchar(100) not null unique
);

create table if not exists supplies (
	id bigint generated always as identity primary key,
	name varchar(100) not null unique,
	id_supply_category bigint not null,
	id_measure_type bigint not null,
	price money not null,
	description varchar(500),
	is_active boolean default true not null,
	foreign key (id_supply_category) references supplies_categories(id),
	foreign key (id_measure_type) references measures_types(id)
);

create table if not exists supplies_dishes (
	id bigint generated always as identity primary key,	
	id_supply bigint not null,
	id_dish bigint not null,
	amount integer not null,
	foreign key (id_supply) references supplies(id),
	foreign key (id_dish) references dishes(id)
);

create table if not exists dishes_garnishes (
	id bigint generated always as identity primary key,	
	id_supply bigint not null,
	id_dish bigint not null,	
	foreign key (id_supply) references supplies(id),
	foreign key (id_dish) references dishes(id)
);

create table if not exists orders_details_garnishes (
	id bigint generated always as identity primary key,	
	id_order_detail bigint not null,
	id_supply bigint not null,	
	foreign key (id_order_detail) references orders_details(id),
	foreign key (id_supply) references supplies(id)	
);

create table if not exists dishes_additions (
	id bigint generated always as identity primary key,	
	id_supply bigint not null,
	id_dish bigint not null,
	extra_price money not null,
	foreign key (id_supply) references supplies(id),
	foreign key (id_dish) references dishes(id)
);

create table if not exists orders_details_additions (
	id bigint generated always as identity primary key,	
	id_order_detail bigint not null,
	id_supply bigint not null,	
	amount integer not null,
	unit_price money not null,
	foreign key (id_order_detail) references orders_details(id),
	foreign key (id_supply) references supplies(id)
);



