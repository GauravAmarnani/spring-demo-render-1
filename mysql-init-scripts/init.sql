CREATE DATABASE IF NOT EXISTS demodb;
USE demodb;

CREATE TABLE IF NOT EXISTS `USER` (
    `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) DEFAULT NULL,
    `email` VARCHAR(255) UNIQUE DEFAULT NULL
);

INSERT INTO USER (name, email) VALUES ('John Doe', 'john.doe@example.com');
