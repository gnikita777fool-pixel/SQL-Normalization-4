CREATE TABLE Representatives (
    rep_id INT PRIMARY KEY,
    rep_name VARCHAR(100) NOT NULL
);

CREATE TABLE Products (
    prod_id INT PRIMARY KEY,
    prod_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE NOT NULL,
    client_id INT NOT NULL,
    rep_id INT NOT NULL,
    FOREIGN KEY (rep_id) REFERENCES Representatives(rep_id)
);

CREATE TABLE Order_Items (
    order_id INT,
    prod_id INT,
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, prod_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (prod_id) REFERENCES Products(prod_id)
);