drop database vk;

create database vk;

use vk;


drop table if exists users;

create table users( 
	id BIGINT unsigned not null auto_increment primary key, 
    firstname varchar(50),
    lastname varchar(50), -- 'Фамилия'
    password_hash varchar(100),
    email varchar(100) unique, 
    phone bigint unsigned unique,
    
	index users_firstname_lastname_idx(firstname, lastname)
);

drop table if exists profiles;

create table profiles(
	user_id BIGINT unsigned not null unique,
	gender char(1),
	birthday date,
	photo_id BIGINT unsigned not null,
	created_at datetime default now(),
	hometown varchar(100)
);

alter table profiles add constraint fk_users_id
foreign key (user_id) references users(id)
on update cascade
on delete restrict;
alter table profiles add constraint profiles_fk_1 
foreign key (photo_id) references media(id);



drop table if exists messages;

create table messages(
	id SERIAL,
	from_user_id BIGINT unsigned not null,
	to_user_id BIGINT unsigned not null,
	body TEXT,
    created_at datetime default now(),
 
    foreign key (from_user_id) references users(id),
	foreign key (to_user_id) references users(id)
);


drop table if exists friends_requests;

create table friends_requests(
    initiator_user_id BIGINT unsigned not null,
    target_user_id BIGINT unsigned not null,
    status enum('requested', 'approved','declined','unfriended'),
    requested_at datetime default now(),
    updated_at datetime on update current_timestamp,
    
    primary key (initiator_user_id, target_user_id),
    foreign key (initiator_user_id) references users(id),
    foreign key (target_user_id) references users(id)
);


alter table friends_requests
add check (initiator_user_id <> target_user_id);

drop table if exists communities;
create table communities(
	id SERIAL,
	name varchar(100) not null,
	admin_user_id BIGINT unsigned not null,

	index communities_name_idx(name),
	foreign key (admin_user_id) references users(id)
);

drop table if exists user_communities;
create table user_communities(
	user_id BIGINT unsigned not null,
	community_id BIGINT unsigned not null,
	
	
	primary key (user_id, community_id),
    foreign key (user_id) references users(id),
    foreign key (community_id) references communities(id)
);

drop table if exists media_types;

create table media_types(
	id serial,
	name varchar(50),
	created_at datetime default now(),
    updated_at datetime on update current_timestamp
);

drop table if exists media;

create table media(
	id serial,
	media_type_id BIGINT unsigned not null, 
	user_id BIGINT unsigned not null,
	body text,
	filename varchar(255),
	size int,
	metadata JSON,
	created_at datetime default now(),
    updated_at datetime on update current_timestamp,
    
    
    foreign key (user_id) references users(id),
    foreign key (media_type_id) references media_types(id)
);

drop table if exists likes; 

create table likes(
	id serial,
	user_id BIGINT unsigned not null,
	media_id BIGINT unsigned not null,
	created_at datetime default now()
);

alter table likes add constraint likes_fk 
foreign key (media_id) references media(id);
alter table likes add constraint likes_fk_1 
foreign key (user_id) references users(id);

drop table if exists photo_albums;
create table photo_albums(
	id serial,
	name varchar(255) default null,
    user_id BIGINT unsigned default null,

    foreign key (user_id) references users(id),
  	primary key (id)
);

drop table if exists photos;
create table photos(
	id serial,
	album_id BIGINT unsigned null,
	media_id BIGINT unsigned not null,

	foreign key (album_id) references photo_albums(id),
    foreign key (media_id) references media(id)
);




