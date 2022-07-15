BEGIN TRAN tran1   
INSERT INTO HumanResources.JobCandidate  VALUES( 31, null, getdate());  
ROLLBACK TRAN tran1;

BEGIN TRANSACTION 
   SELECT @@TRANCOUNT AS '1' 
   INSERT INTO HumanResources.JobCandidate  VALUES( 4, null, getdate());  
   SAVE TRANSACTION FirstInsert

   BEGIN TRANSACTION
   SELECT @@TRANCOUNT AS '2' 
   COMMIT

   INSERT INTO HumanResources.JobCandidate  VALUES( 2, null, getdate());  
   ROLLBACK TRANSACTION FirstInsert
   SELECT @@TRANCOUNT AS '3' 
COMMIT