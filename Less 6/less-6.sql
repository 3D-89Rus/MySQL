-- ������� 1
/* ����� ����� ��������� ������������. �� ���� ������������� ���. ���� ������� ��������, 
 * ������� ������ ���� ������� � ��������� ������������� (������� ��� ���������).*/

SELECT from_user_id , COUNT(*) AS total
FROM messages
WHERE to_user_id = 1
GROUP BY from_user_id
ORDER BY total DESC
LIMIT 1;

-- ������� 2
-- ���������� ����� ���������� ������, ������� �������� ������������ ������ 10 ���

SELECT COUNT(*) AS total
FROM likes
WHERE media_id IN (
	SELECT id
	FROM media
	WHERE user_id IN (
		SELECT user_id 
		FROM profiles 
		WHERE birthday > (NOW() - INTERVAL 10 YEAR)
	)
);


-- ������� 3
-- ���������� ��� ������ �������� ������ (�����): ������� ��� �������.

SELECT gender, COUNT(*)
FROM (
	SELECT 
		user_id AS liker, 
		(SELECT gender FROM profiles WHERE user_id = liker) AS gender
	FROM likes
) AS name
GROUP BY gender
ORDER BY COUNT(*) DESC;
