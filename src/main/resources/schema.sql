CREATE TABLE users (
    id INT(11) NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phno VARCHAR(15) NOT NULL,
    password VARCHAR(60) NOT NULL,
    address VARCHAR(255) DEFAULT NULL,
    city VARCHAR(255) DEFAULT NULL,
    state VARCHAR(255) DEFAULT NULL,
    zip VARCHAR(255) DEFAULT NULL,
    accept_terms TINYINT(1) DEFAULT 0,
    profile_image VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE Book (
    Bookid INT NOT NULL AUTO_INCREMENT,
    bookname VARCHAR(255) NOT NULL,
    author VARCHAR(100) NOT NULL,
    price DOUBLE NOT NULL,
    bookCategory VARCHAR(100) NOT NULL,
    status VARCHAR(50) NOT NULL,
    photo VARCHAR(255) DEFAULT NULL,
    user_email VARCHAR(100) NOT NULL,
    PRIMARY KEY (Bookid),
    FOREIGN KEY (user_email) REFERENCES users(email)
);


CREATE TABLE cart (
    cartID INT NOT NULL AUTO_INCREMENT,
    bookID INT NOT NULL,
    userID INT NOT NULL,
    bookName VARCHAR(255) NOT NULL,
    author VARCHAR(100) NOT NULL,
    price DOUBLE NOT NULL,
    total_price DOUBLE NOT NULL,
    PRIMARY KEY (cartID),
    FOREIGN KEY (bookID) REFERENCES Book(Bookid),
    FOREIGN KEY (userID) REFERENCES users(id)
);



CREATE TABLE book_order (
    id INT NOT NULL AUTO_INCREMENT,
    order_id VARCHAR(100) NOT NULL,
    user_name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    book_name VARCHAR(255) NOT NULL,
    author VARCHAR(100) NOT NULL,
    price DOUBLE NOT NULL,
    payment VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);