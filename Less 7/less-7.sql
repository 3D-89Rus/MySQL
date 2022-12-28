-- ��������� ������ ������������� users, 
-- ������� ����������� ���� �� ���� ����� orders � �������� ��������.

SELECT * FROM users
WHERE EXISTS (SELECT * FROM orders WHERE user_id = users.id);

-- �������� ������ ������� products � �������� catalogs, 
-- ������� ������������� ������.

SELECT
id,
name,
(SELECT name FROM catalogs WHERE id = catalog_id) AS 'catalog'
FROM
products;
