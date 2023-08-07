
SELECT * FROM users WHERE username = '$input_username' AND password = '$input_password';
SELECT * FROM users WHERE username = 'admin' OR '1'='1' AND password = '$input_password';
SELECT * FROM users WHERE username = 'admin' -- AND password = 'password'
SELECT * FROM users WHERE username = 'admin'' AND password = 'password';
