drop database example;

create database example;

use example;
create table users(
	id BIGINT unsigned not null auto_increment primary key, 
    name varchar(50)
);    