use vk;


#���������� Users

INSERT INTO users VALUES
('1', '������', '�������', NULL, 'andry@mail.ru', 89999999999),
('2', '���������', '�����������', NULL, 'alex@mail.ru', 88888888888),
('3', '����', '������', NULL, 'simon@mail.ru', 87777777777),
('4', '������', '�������', NULL, 'serg@mail.ru', 86666666666),
('5', '�����', '�������', NULL, 'antiny@mail.ru', 85555555555),
('6', '�������', '��������', NULL, 'dmitry@mail.ru', 84444444444),
('7', '����', '������', NULL, 'ivan@mail.ru', 83333333333),
('8', 'ϸ��', '������', NULL, 'petr@mail.ru', 82222222222),
('9', '�������', '��������', NULL, 'evgen@mail.ru', 81111111111),
('10', '����', '�����', NULL, 'ilya@mail.ru', 80000000000)
;


#���������� profiles

alter table profiles 
add is_active BIT default false NULL; -- ������� ������� is_active � ��������� ��������� false (0)

update  profiles
SET is_active = 1
where  year(current_timestamp) - year(birthday) - (right(current_timestamp, 5) < right(birthday, 5)) < 18
;

INSERT INTO profiles (user_id, gender, birthday, photo_id, hometown) VALUES
(1, 1, '1987-12-23', 1, '������'),
(2, 1, '2000-03-16', 2, '������'),
(3, 1, '2008-04-23', 3, '��������'),
(4, 1, '2007-09-21', 4, '������'),
(5, 1, '2006-06-22', 5, '�����'),
(6, 1, '1982-04-27', 6, '����'),
(7, 1, '1956-08-24', 7, '������'),
(8, 1, '1976-03-22', 8, '�����'),
(9, 1, '1985-03-15', 9, '��������'),
(10, 1, '1968-07-11', 10, '������������')
;

alter table profiles add age bigint(5); -- ������� � ������� age ������� �������������

update profiles
SET age = YEAR(CURRENT_TIMESTAMP) - YEAR(birthday) - (RIGHT(CURRENT_TIMESTAMP, 5) < RIGHT(birthday, 5))
;

update profiles -- �������� �� �������� ������������� ������ 18 ���.
SET is_active = 1
WHERE YEAR(CURRENT_TIMESTAMP) - YEAR(birthday) - (RIGHT(CURRENT_TIMESTAMP, 5) < RIGHT(birthday, 5)) < 18
; 

#���������� photo_albums
INSERT INTO photo_albums (id, name, user_id) VALUES
(11, '������1', 1),
(22, '������2', 2),
(33, '������3', 3),
(44, '������4', 4),
(55, '������5', 5),
(66, '������6', 6),
(77, '������7', 7),
(88, '������8', 8),
(99, '������9', 9),
(111, '������10', 10)
;


#���������� photos
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

#���������� media_types
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


#���������� media
INSERT INTO media (id, media_type_id, user_id, filename, `size`, metadata)
VALUES 
(1, 1111, 1, '����1', 123, null),
(2, 3333, 2, '����1', 123, null),
(3, 2222, 3, '����1', 123, null),
(4, 6666, 4, '����1', 123, null),
(5, 4444, 5, '����1', 123, null),
(6, 8888, 6, '����1', 123, null),
(7, 9999, 7, '����1', 123, null),
(8, 5555, 8, '����1', 123, null),
(9, 7777, 9, '����1', 123, null),
(10, 1100, 10, '����1', 123, null)
;


#���������� likes
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


#���������� user_communities
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


#���������� communities
INSERT into communities (id, name, admin_user_id) values
(999, '�����', 1),
(888, '�������', 1),
(777, '�����', 1),
(666, '�������', 1),
(555, '�����������', 1),
(444, '������', 1),
(333, '����', 1),
(222, '������', 2),
(111, '����', 3)
;


#���������� messages
INSERT INTO messages (from_user_id, to_user_id, body, created_at) values
('1','2','������ ��� ����?.','2022-12-23 12:08:29'),
('2','1','��������� ��� ���?.', now()),
('3','1','� �����������!', '2022-12-23 11:04:14'),
('1','3','�������!.', now()),
('1','5','.','2022-12-21 17:04:24')
;


#���������� friends_requests
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


--  �������� ��������� � id 3 ���� �� ��������
update messages
	SET created_at='2024-12-24 07:43:12'
	WHERE id = 3;

-- ������ ��������� �� ��������
delete from messages
WHERE created_at > now()
;


	











