-- Create the PRODUCT table
CREATE TABLE PRODUCT (
    Product_id INT PRIMARY KEY,
    Product_name VARCHAR2(100) NOT NULL,
    Price NUMBER(10, 2) NOT NULL,
    Category VARCHAR2(20)  -- Category column (added later)
);

-- Create the CUSTOMER table
CREATE TABLE CUSTOMER (
    Customer_id INT PRIMARY KEY,
    Customer_name VARCHAR2(100) NOT NULL,
    Email VARCHAR2(100),
    Phone VARCHAR2(15),
    Address VARCHAR2(200)
);

-- Create the SUPPLIERS table
CREATE TABLE SUPPLIERS (
    Supplier_id INT PRIMARY KEY,
    Supplier_name VARCHAR2(100) NOT NULL,
    Contact_name VARCHAR2(100),
    Phone VARCHAR2(15)
);

-- Create the ORDERS table
CREATE TABLE ORDERS (
    Order_id INT PRIMARY KEY,
    Customer_id INT,
    OrderDate DATE DEFAULT SYSDATE,  -- Adding the OrderDate column with default SYSDATE
    Order_total NUMBER(10, 2) NOT NULL,
    CONSTRAINT fk_customer FOREIGN KEY (Customer_id) REFERENCES CUSTOMER (Customer_id)
);

-- Create the ORDER_DETAILS table
CREATE TABLE ORDER_DETAILS (
    Order_detail_id INT PRIMARY KEY,
    Order_id INT,
    Product_id INT,
    Quantity INT NOT NULL,
    Price NUMBER(10, 2) NOT NULL,
    CONSTRAINT fk_order FOREIGN KEY (Order_id) REFERENCES ORDERS (Order_id),
    CONSTRAINT fk_product FOREIGN KEY (Product_id) REFERENCES PRODUCT (Product_id)
);

-- Create the SUPPLIES table
CREATE TABLE SUPPLIES (
    Supplier_id INT,
    Product_id INT,
    Supply_quantity INT NOT NULL,
    PRIMARY KEY (Supplier_id, Product_id),
    CONSTRAINT fk_supplier FOREIGN KEY (Supplier_id) REFERENCES SUPPLIERS (Supplier_id),
    CONSTRAINT fk_product_supply FOREIGN KEY (Product_id) REFERENCES PRODUCT (Product_id)
);

-- Add the Category column to the PRODUCT table
ALTER TABLE PRODUCT ADD Category VARCHAR2(20);

-- Add the OrderDate column to the ORDERS table with default value as SYSDATE
ALTER TABLE ORDERS ADD OrderDate DATE DEFAULT SYSDATE;


-- Insert data into the PRODUCT table
INSERT INTO PRODUCT (Product_id, Product_name, Price, Category) 
VALUES (1, 'Laptop', 1200.50, 'Electronics');

INSERT INTO PRODUCT (Product_id, Product_name, Price, Category) 
VALUES (2, 'Phone', 699.99, 'Electronics');

INSERT INTO PRODUCT (Product_id, Product_name, Price, Category) 
VALUES (3, 'Desk Chair', 150.75, 'Furniture');

INSERT INTO PRODUCT (Product_id, Product_name, Price, Category) 
VALUES (4, 'Monitor', 220.00, 'Electronics');


-- Insert data into the CUSTOMER table
INSERT INTO CUSTOMER (Customer_id, Customer_name, Email, Phone, Address) 
VALUES (1, 'John Doe', 'johndoe@example.com', '555-1234', '123 Elm St, Springfield');

INSERT INTO CUSTOMER (Customer_id, Customer_name, Email, Phone, Address) 
VALUES (2, 'Jane Smith', 'janesmith@example.com', '555-5678', '456 Oak St, Springfield');


-- Insert data into the SUPPLIERS table
INSERT INTO SUPPLIERS (Supplier_id, Supplier_name, Contact_name, Phone) 
VALUES (1, 'TechCorp', 'Alice Johnson', '555-1111');

INSERT INTO SUPPLIERS (Supplier_id, Supplier_name, Contact_name, Phone) 
VALUES (2, 'FurniSupplies', 'Bob Brown', '555-2222');


-- Insert data into the ORDERS table
INSERT INTO ORDERS (Order_id, Customer_id, OrderDate, Order_total) 
VALUES (1, 1, TO_DATE('2024-11-01', 'YYYY-MM-DD'), 1400.50);

INSERT INTO ORDERS (Order_id, Customer_id, OrderDate, Order_total) 
VALUES (2, 2, TO_DATE('2024-11-02', 'YYYY-MM-DD'), 700.00);


-- Insert data into the ORDER_DETAILS table
INSERT INTO ORDER_DETAILS (Order_detail_id, Order_id, Product_id, Quantity, Price) 
VALUES (1, 1, 1, 1, 1200.50);

INSERT INTO ORDER_DETAILS (Order_detail_id, Order_id, Product_id, Quantity, Price) 
VALUES (2, 1, 4, 1, 220.00);

INSERT INTO ORDER_DETAILS (Order_detail_id, Order_id, Product_id, Quantity, Price) 
VALUES (3, 2, 2, 1, 699.99);


-- Insert data into the SUPPLIES table
INSERT INTO SUPPLIES (Supplier_id, Product_id, Supply_quantity) 
VALUES (1, 1, 500);

INSERT INTO SUPPLIES (Supplier_id, Product_id, Supply_quantity) 
VALUES (1, 4, 300);

INSERT INTO SUPPLIES (Supplier_id, Product_id, Supply_quantity) 
VALUES (2, 3, 200);
