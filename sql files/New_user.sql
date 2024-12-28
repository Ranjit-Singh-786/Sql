-- To show the users 
SELECT user, host FROM mysql.user;    

-- To  create users  
create user 'ranjit'@'localhost' IDENTIFIED WITH 'mysql_native_password' by 'ranjit786';

-- To assign the all access to the user 
GRANT ALL PRIVILEGES ON *.* TO 'ranjit'@'localhost';

