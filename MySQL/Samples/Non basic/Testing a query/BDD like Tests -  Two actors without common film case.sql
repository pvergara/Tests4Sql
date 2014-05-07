/*****************************************************************/
SET 		
	@actorKevinBloom_id=25,  
	@actressPenelopeGUINNESS_id=1;

SELECT   
		'Given two actors who DO NOT appear in any common film' as  
	"Given",  
		@actorKevinBloom_id,  
		@actressPenelopeGUINNESS_id;
/*****************************************************************/


/*****************************************************************/
SET @actors_id=concat(@actorKevinBloom_id, ',', @actressPenelopeGUINNESS_id) ;
SELECT   
		'I query the common films of that two actors' as  
	"When",   
		@actors_id as  
	"(two actors)";

CALL `sakila`.`GetTheCommonFilmsOf`(@actors_id);

/*****************************************************************/

/*****************************************************************/
SELECT @actual:=COUNT(*) FROM `sakila`.`ResultGetTheCommonFilmsOf`;

SELECT   
		'It returns the exact number of common films (no movie)' as  
	"Then",    
		@expected:=0 as  
	"Expected",    
		@actual as  
	"Actual",    
		`Tests4Sql`.`AssertEquals_DECIMAL`(@expected,@actual) as 
	"Assert";
/*****************************************************************/

