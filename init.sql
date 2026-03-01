-- 1. Create a MySQL user (replace placeholders before running)
CREATE USER '<AUTH_DB_USER>'@'<AUTH_DB_HOST>' IDENTIFIED BY '<AUTH_DB_PASSWORD>';

-- 2. Create the database
CREATE DATABASE <AUTH_DB_NAME>;

-- 3. Grant privileges
GRANT ALL PRIVILEGES ON <AUTH_DB_NAME>.* TO '<AUTH_DB_USER>'@'<AUTH_DB_HOST>';

-- 4. Switch to the database
USE <AUTH_DB_NAME>;

-- 5. Create a secure user table
CREATE TABLE user (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL -- stores bcrypt hash string
);

-- 6. Insert a test user with bcrypt hashed password (optional; replace placeholders)
INSERT INTO user (email, password)
VALUES ('<TEST_USER_EMAIL>', '<BCRYPT_HASH_FOR_TEST_USER_PASSWORD>');
