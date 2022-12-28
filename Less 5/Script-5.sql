/*ѕрактическое задание по теме Уќператоры, фильтраци€, сортировка и ограничениеФ*/

/* «адание 1. ѕусть в таблице users пол€ created_at и updated_at оказались незаполненными.
 *  «аполните их текущими датой и временем.*/

-- создадим таблицу users
DROP TABLE IF EXISTS users;
CREATE TABLE users(
	id serial primary key,
	created_at datetime,
	updated_at datetime
);

-- заполним таблицу
insert
	into users (created_at, updated_at)
	values
	(null, null),
	(null, null),
	(null, null);

-- помен€ем NULL на текущее врем€
update users
	set created_at = now(),
		updated_at = now();
		
	
/*«адание 2 “аблица users была неудачно спроектирована. «аписи created_at и updated_at были заданы типом VARCHAR
 *  и в них долгое врем€ помещались значени€ в формате "20.10.2017 8:10". Ќеобходимо преобразовать
 *  пол€ к типу DATETIME, сохранив введеные ранее значени€.*/

-- создадим таблицу
DROP TABLE IF EXISTS users;
CREATE TABLE users(
	id serial primary key,
	created_at VARCHAR(255),
	updated_at VARCHAR(255)
);

-- заполним ее данными
insert
	into users (created_at, updated_at)
	values 
	('20.10.2013 8:10', '20.10.2020 8:10'),
	('20.10.1344 8:10', '20.10.2011 8:10'),
	('20.10.1955 8:10', '20.10.2000 8:10');
	
-- заменим формат

update users
	set created_at = str_to_date(created_at, '%d.%m.%Y %k:%i'),
		updated_at = str_to_date(updated_at, '%d.%m.%Y %k:%i');
		
-- изменим тип данных
	
ALTER TABLE users 
	CHANGE created_at created_at DATETIME DEFAULT NOW();
	
ALTER TABLE users 
	CHANGE updated_at updated_at DATETIME DEFAULT NOW() ON UPDATE NOW();
	
/*«адание 3. ¬ таблице складских запасов storehouses_products в поле value могут встречатьс€ самые разные цифры: 
 * 0, если товар закончилс€ и выше нул€, если на складе имеютс€ запасы. Ќеобходимо отсортировать записи таким образом,
 * чтобы они выводились в пор€дке увеличени€ значени€ value. ќднако, нулевые запасы должны выводитьс€ в конце, после
 * всех записей.*/

-- создадим таблицу

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products(
	id serial PRIMARY KEY,
	value INT UNSIGNED
);

-- заполним ее
insert 
	into storehouses_products (value)
	values 
	(0),
	(123),
	(332),
	(3),
	(12);

-- отсортируем

select * from storehouses_products order by if(value > 0, 0, 1), value;


/*ѕрактическое задание теме Ујгрегаци€ данныхФ*/
# «адание 1. ѕодсчитайте средний возраст пользователей в таблице users

-- создадим таблицу

DROP TABLE IF EXISTS users;
CREATE TABLE users(
	id serial PRIMARY KEY,
	birthday_at DATE
);

-- заполним данными
insert 
	into users (birthday_at)
	values 
	('1988-4-4'),
	('1899-9-3'),
	('2011-11-14'),
	('1978-7-28'),
	('2005-12-3'),
	('2011-7-1'),
	('1899-3-20'),
	('1999-6-2'),
	('1966-6-11');

-- подсчитаем средний возраст
select avg(timestampdiff(year, birthday_at, now())) as mid_age from users;

/* «адание 2. ѕодсчитайте количество дней рождени€, которые приход€тс€ на каждый из дней недели.
 * —ледует учесть, что необходимы дни недели текущего года, а не года рождени€.*/

-- используем данные из прошлого задани€

select date_format(date(concat_ws('-', year(now()), month(birthday_at), day(birthday_at))), '%W') AS what_day,
count(*) as total from users
group by what_day;