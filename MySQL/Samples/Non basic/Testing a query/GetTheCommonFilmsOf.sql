
DROP PROCEDURE `sakila`.`GetTheCommonFilmsOf`;

DELIMITER $$
CREATE PROCEDURE `sakila`.`GetTheCommonFilmsOf`(
	actors_id nvarchar(256)
)
BEGIN
	SET @actors_id = actors_id;

	SELECT @actors_param_counter:=COUNT(*) FROM `sakila`.`actor` WHERE find_in_set(actor_id,actors_id);

	CREATE TABLE IF NOT EXISTS `ResultGetTheCommonFilmsOf` (
		film_id SMALLINT
	);
	
	DELETE FROM
		`ResultGetTheCommonFilmsOf`;

	INSERT INTO
		`ResultGetTheCommonFilmsOf`
	SELECT 
		film_actor.film_id
	FROM
		`sakila`.`film_actor`
	WHERE 
		find_in_set(actor_id,actors_id)
	GROUP BY
		film_actor.film_id
	HAVING
		COUNT(*) >= @actors_param_counter;

END$$
DELIMITER ;
