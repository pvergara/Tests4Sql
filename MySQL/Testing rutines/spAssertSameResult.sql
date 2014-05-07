DROP PROCEDURE `Tests4Sql`.`spAssertSameResult`;

DELIMITER //
CREATE PROCEDURE `Tests4Sql`.`spAssertSameResult`
(
	oldQryName varchar(256),
	newQryName varchar(256),
	joinSpecification varchar(4000)
)
BEGIN
SET @dyn_sql=CONCAT('
SELECT
    (
        CASE WHEN count(*) = (select count(*) from ',oldQryName,') THEN
            ''GREEN''
        ELSE
            ''___RED___''
        END
    ) as "Assert_SqlCodeSeemsSimilar"
FROM
(
    SELECT * FROM ',newQryName,'
) qryTheNewOne
        INNER JOIN
(
    SELECT * FROM ',oldQryName,'
) qryTheOldOne
    ON
    (
        ',joinSpecification,'
    );');
PREPARE s1 from @dyn_sql; 
EXECUTE s1; 

DEALLOCATE PREPARE s1; 
END //

DELIMITER ;
