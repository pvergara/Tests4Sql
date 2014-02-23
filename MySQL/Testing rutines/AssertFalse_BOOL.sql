DROP PROCEDURE `Tests4Sql`.`AssertFalse_BOOL`;

DELIMITER $$
CREATE FUNCTION `Tests4Sql`.`AssertFalse_BOOL`(
	TheValue BOOL
) RETURNS varchar(20) CHARSET utf8
BEGIN
	DEClARE RESULT NVARCHAR(20);

	SELECT
		(
			CASE 
				WHEN TheValue<>TRUE THEN
					'GREEN'
				ELSE
					'___RED___'
			END
		) as TheResult
	INTO
		RESULT;

RETURN RESULT;
END$$
DELIMITER ;
