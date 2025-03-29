SELECT 
  SUBSTRING(email FROM POSITION('@' IN email)+1) AS domain 
FROM users;
