CREATE DATABASE essential_db;
USE essential_db;

CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    user_email VARCHAR(100),
    user_phone VARCHAR(20),
    user_address VARCHAR(255)
);

CREATE TABLE Admin (
    admin_id INT AUTO_INCREMENT PRIMARY KEY,
    admin_username VARCHAR(100) NOT NULL,
    admin_email VARCHAR(100),
    admin_phone VARCHAR(20),
    admin_address VARCHAR(255)
);

CREATE TABLE Book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(100),
    price DECIMAL(10, 2),
    status VARCHAR(50)
);

CREATE TABLE `Order` (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE NOT NULL,
    payment_method VARCHAR(50),
    total_amount DECIMAL(10, 2),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
        ON DELETE SET NULL ON UPDATE CASCADE
);
