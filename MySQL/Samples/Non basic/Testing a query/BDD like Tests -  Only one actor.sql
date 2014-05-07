/*****************************************************************/
SET 		@actorKevinBloom_id=25;
SELECT 
	@expected:=COUNT(*) 
FROM 
	`sakila`.`film_actor` 
WHERE 
	actor_id = @actorKevinBloom_id;

SELECT   
		concat('One actor that appears in ',@expected,' movies') as  
	"Given",  
		@actorKevinBloom_id;
/*****************************************************************/


/*****************************************************************/
SET @actors_id=concat(@actorKevinBloom_id) ;
SELECT   
		'I query the films of that actor' as  
	"When",   
		@actors_id as  
	"(Actor id)";

CALL `sakila`.`GetTheCommonFilmsOf`(@actors_id);

/*****************************************************************/

/*****************************************************************/
SELECT @actual:=COUNT(*) FROM `sakila`.`ResultGetTheCommonFilmsOf`;

SELECT   
		concat('It returns ',@expected,' films') as  
	"Then",    
		@expected as  
	"Expected",    
		@actual as  
	"Actual",    
		`Tests4Sql`.`AssertEquals_DECIMAL`(@expected,@actual) as 
	"Assert";
/*****************************************************************/

