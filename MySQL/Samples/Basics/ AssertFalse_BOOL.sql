SELECT @VALUE:=TRUE;
SELECT Tests4Sql.AssertFalse_BOOL (@VALUE);

SELECT @VALUE:=FALSE;
SELECT Tests4Sql.AssertFalse_BOOL (@VALUE);

SELECT @VALUE:=NULL;
SELECT Tests4Sql.AssertFalse_BOOL (@VALUE);