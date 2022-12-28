use vk;


#Заполнение Users

INSERT INTO users VALUES
('1', 'Андрей', 'Андреев', NULL, 'andry@mail.ru', 89999999999),
('2', 'Александр', 'Александров', NULL, 'alex@mail.ru', 88888888888),
('3', 'Семён', 'Семёнов', NULL, 'simon@mail.ru', 87777777777),
('4', 'Сергей', 'Сергеев', NULL, 'serg@mail.ru', 86666666666),
('5', 'Антон', 'Антонов', NULL, 'antiny@mail.ru', 85555555555),
('6', 'Дмитрий', 'Дмитриев', NULL, 'dmitry@mail.ru', 84444444444),
('7', 'Иван', 'Иванов', NULL, 'ivan@mail.ru', 83333333333),
('8', 'Пётр', 'Петров', NULL, 'petr@mail.ru', 82222222222),
('9', 'Евгений', 'Евгеньев', NULL, 'evgen@mail.ru', 81111111111),
('10', 'Илья', 'Ильин', NULL, 'ilya@mail.ru', 80000000000)
;


#Заполнение profiles

alter table profiles 
add is_active BIT default false NULL; -- Добавим колонку is_active с дефолтным значением false (0)

update  profiles
SET is_active = 1
where  year(current_timestamp) - year(birthday) - (right(current_timestamp, 5) < right(birthday, 5)) < 18
;

INSERT INTO profiles (user_id, gender, birthday, photo_id, hometown) VALUES
(1, 1, '1987-12-23', 1, 'Москва'),
(2, 1, '2000-03-16', 2, 'Ростов'),
(3, 1, '2008-04-23', 3, 'Мурманск'),
(4, 1, '2007-09-21', 4, 'Рязань'),
(5, 1, '2006-06-22', 5, 'Анапа'),
(6, 1, '1982-04-27', 6, 'Сочи'),
(7, 1, '1956-08-24', 7, 'Москва'),
(8, 1, '1976-03-22', 8, 'Томск'),
(9, 1, '1985-03-15', 9, 'Смоленск'),
(10, 1, '1968-07-11', 10, 'Екатеринбург')
;

alter table profiles add age bigint(5); -- Выведем в колонку age возраст пользователей

update profiles
SET age = YEAR(CURRENT_TIMESTAMP) - YEAR(birthday) - (RIGHT(CURRENT_TIMESTAMP, 5) < RIGHT(birthday, 5))
;

update profiles -- Сделаеем не уктивнми пользователей моложе 18 лет.
SET is_active = 1
WHERE YEAR(CURRENT_TIMESTAMP) - YEAR(birthday) - (RIGHT(CURRENT_TIMESTAMP, 5) < RIGHT(birthday, 5)) < 18
; 

#Заполнение photo_albums
INSERT INTO photo_albums (id, name, user_id) VALUES
(11, 'Альбом1', 1),
(22, 'Альбом2', 2),
(33, 'Альбом3', 3),
(44, 'Альбом4', 4),
(55, 'Альбом5', 5),
(66, 'Альбом6', 6),
(77, 'Альбом7', 7),
(88, 'Альбом8', 8),
(99, 'Альбом9', 9),
(111, 'Альбом10', 10)
;


#Заполнение photos
INSERT INTO photos (id, album_id, media_id) VALUES
(1, 11, 1),
(2, 22, 2),
(3, 33, 3),
(4, 44, 4),
(5, 55, 5),
(6, 66, 6),
(7, 77, 7),
(8, 88, 8),
(9, 99, 9),
(10, 111, 10)
;

#Заполнение media_types
INSERT INTO media_types (id, name) VALUES 
(1111, 'photo1'),
(2222, 'photo2'),
(3333, 'photo3'),
(4444, 'photo4'),
(5555, 'photo5'),
(6666, 'photo6'),
(7777, 'photo7'),
(8888, 'photo8'),
(9999, 'photo9'),
(1100, 'photo10')
;


#Заполнение media
INSERT INTO media (id, media_type_id, user_id, filename, `size`, metadata)
VALUES 
(1, 1111, 1, 'фото1', 123, null),
(2, 3333, 2, 'фото1', 123, null),
(3, 2222, 3, 'фото1', 123, null),
(4, 6666, 4, 'фото1', 123, null),
(5, 4444, 5, 'фото1', 123, null),
(6, 8888, 6, 'фото1', 123, null),
(7, 9999, 7, 'фото1', 123, null),
(8, 5555, 8, 'фото1', 123, null),
(9, 7777, 9, 'фото1', 123, null),
(10, 1100, 10, 'фото1', 123, null)
;


#Заполнение likes
INSERT into likes (id, user_id, media_id) values
(1, 2, 1),
(2, 2, 3),
(3, 3, 3),
(4, 5, 2),
(5, 1, 4),
(6, 7, 5),
(7, 4, 6),
(8, 7, 7),
(9, 8, 8),
(10, 4, 10),
(11, 10, 9),
(12, 10, 8),
(13, 5, 7)
;


#Заполнение user_communities
INSERT into user_communities (user_id, community_id) values
(1, 222),
(2, 888),
(3, 666),
(4, 777),
(5, 555),
(6, 444),
(7, 333),
(8, 222)
;


#Заполнение communities
INSERT into communities (id, name, admin_user_id) values
(999, 'Спорт', 1),
(888, 'Рыбалка', 1),
(777, 'Охота', 1),
(666, 'Сериалы', 1),
(555, 'Электроника', 1),
(444, 'Работа', 1),
(333, 'Игры', 1),
(222, 'Музыка', 2),
(111, 'Кино', 3)
;


#Заполнение messages
INSERT INTO messages (from_user_id, to_user_id, body, created_at) values
('1','2','Привет как дела?.','2022-12-23 12:08:29'),
('2','1','Нормально как сам?.', now()),
('3','1','С наступающим!', '2022-12-23 11:04:14'),
('1','3','Взаимно!.', now()),
('1','5','.','2022-12-21 17:04:24')
;


#Заполнение friends_requests
INSERT INTO friends_requests (initiator_user_id, target_user_id, status)
VALUES 
('1', '2', 'requested'),
('1', '3', 'approved'),
('1', '4', 'requested'),
('2', '5', 'approved'),
('2', '4', 'requested'),
('7', '10', 'approved'),
('3', '8', 'requested'),
('5', '3', 'approved'),
('2', '9', 'requested'),
('3', '5', 'approved'),
('5', '9', 'requested'),
('5', '1', 'approved'),
('8', '9', 'requested'),
('9', '10', 'approved'),
('7', '5', 'requested'),
('9', '5', 'approved'),
('10', '8', 'requested'),
('5', '7', 'approved')
;


--  Поставим сообщению с id 3 дату из будущего
update messages
	SET created_at='2024-12-24 07:43:12'
	WHERE id = 3;

-- Удалим сообщение из будущего
delete from messages
WHERE created_at > now()
;


	











