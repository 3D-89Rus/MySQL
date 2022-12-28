/*������������ ������� �� ���� ����������, ����������, ���������� � �����������*/

/* ������� 1. ����� � ������� users ���� created_at � updated_at ��������� ��������������.
 *  ��������� �� �������� ����� � ��������.*/

-- �������� ������� users
DROP TABLE IF EXISTS users;
CREATE TABLE users(
	id serial primary key,
	created_at datetime,
	updated_at datetime
);

-- �������� �������
insert
	into users (created_at, updated_at)
	values
	(null, null),
	(null, null),
	(null, null);

-- �������� NULL �� ������� �����
update users
	set created_at = now(),
		updated_at = now();
		
	
/*������� 2 ������� users ���� �������� ��������������. ������ created_at � updated_at ���� ������ ����� VARCHAR
 *  � � ��� ������ ����� ���������� �������� � ������� "20.10.2017 8:10". ���������� �������������
 *  ���� � ���� DATETIME, �������� �������� ����� ��������.*/

-- �������� �������
DROP TABLE IF EXISTS users;
CREATE TABLE users(
	id serial primary key,
	created_at VARCHAR(255),
	updated_at VARCHAR(255)
);

-- �������� �� �������
insert
	into users (created_at, updated_at)
	values 
	('20.10.2013 8:10', '20.10.2020 8:10'),
	('20.10.1344 8:10', '20.10.2011 8:10'),
	('20.10.1955 8:10', '20.10.2000 8:10');
	
-- ������� ������

update users
	set created_at = str_to_date(created_at, '%d.%m.%Y %k:%i'),
		updated_at = str_to_date(updated_at, '%d.%m.%Y %k:%i');
		
-- ������� ��� ������
	
ALTER TABLE users 
	CHANGE created_at created_at DATETIME DEFAULT NOW();
	
ALTER TABLE users 
	CHANGE updated_at updated_at DATETIME DEFAULT NOW() ON UPDATE NOW();
	
/*������� 3. � ������� ��������� ������� storehouses_products � ���� value ����� ����������� ����� ������ �����: 
 * 0, ���� ����� ���������� � ���� ����, ���� �� ������ ������� ������. ���������� ������������� ������ ����� �������,
 * ����� ��� ���������� � ������� ���������� �������� value. ������, ������� ������ ������ ���������� � �����, �����
 * ���� �������.*/

-- �������� �������

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products(
	id serial PRIMARY KEY,
	value INT UNSIGNED
);

-- �������� ��
insert 
	into storehouses_products (value)
	values 
	(0),
	(123),
	(332),
	(3),
	(12);

-- �����������

select * from storehouses_products order by if(value > 0, 0, 1), value;


/*������������ ������� ���� ���������� �������*/
# ������� 1. ����������� ������� ������� ������������� � ������� users

-- �������� �������

DROP TABLE IF EXISTS users;
CREATE TABLE users(
	id serial PRIMARY KEY,
	birthday_at DATE
);

-- �������� �������
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

-- ���������� ������� �������
select avg(timestampdiff(year, birthday_at, now())) as mid_age from users;

/* ������� 2. ����������� ���������� ���� ��������, ������� ���������� �� ������ �� ���� ������.
 * ������� ������, ��� ���������� ��� ������ �������� ����, � �� ���� ��������.*/

-- ���������� ������ �� �������� �������

select date_format(date(concat_ws('-', year(now()), month(birthday_at), day(birthday_at))), '%W') AS what_day,
count(*) as total from users
group by what_day;