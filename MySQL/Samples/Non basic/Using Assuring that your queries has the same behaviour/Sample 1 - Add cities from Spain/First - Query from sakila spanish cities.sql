SELECT `city`.`city_id`,
    `city`.`city`,
    `city`.`country_id`,
    `city`.`last_update`
FROM 
	`sakila`.`city`
		INNER JOIN
	`sakila`.`country`
		ON `sakila`.`city`.`country_id` = `sakila`.`country`.`country_id`
WHERE
	 `sakila`.`country`.`country` like '%spain%'