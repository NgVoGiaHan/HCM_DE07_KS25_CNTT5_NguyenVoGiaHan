CREATE DATABASE IF NOT EXISTS store;
use store;

CREATE TABLE Customers (
	customer_id VARCHAR(5) PRIMARY KEY ,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL UNIQUE
);

CREATE TABLE Brands (
	brand_id VARCHAR(5) PRIMARY KEY ,
    brand_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Products (
	product_id VARCHAR(5) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL UNIQUE,
    brand_id VARCHAR(5) NOT NULL,
    price DECIMAL(10, 2) NOT NULL ,
    stock INT NOT NULL,
    FOREIGN KEY (brand_id) REFERENCES Brands(brand_id)
);

CREATE TABLE Orders (
	order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id VARCHAR(5) NOT NULL,
    product_id VARCHAR(5)NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    status VARCHAR(20) NOT NULL ,
    order_date DATE NOT NULL
);

INSERT INTO Customers (customer_id,full_name,email,phone) VALUES
('C01','Nguyễn Văn An','an.nv@gmail.com','0911111111'),
('C02','Nguyễn Thị Mai','mai.nt@gmail.com','0922222222'),
('C03','Trần Quang Hải','hai.tq@gmail.com','0933333333'),
('C04','Phạm Bảo Ngọc','ngoc.pb@gmail.com','0944444444'),
('C05','Vũ Đức Đam','dam.vd@gmail.com','0955555555');


INSERT INTO Brands(brand_id,brand_name) VALUES 
('B01','Apple'),
('B02','Samsung'),
('B04','Sony'),
('B04','Dell');


INSERT INTO Products(product_id,product_name,brand_id,price,stock) VALUES
('P01','iPhone 15 Pro Max','B01',30000000.00,10),
('P02','MacBook Pro M3','B01',45000000.00,5),
('P03','Galaxy S24 Ultra','B02',25000000.00,20),
('P04','PlayStation 5','B03',15000000.00,8),
('P05','Dell XPS 15','B04',35000000.00,15);


INSERT INTO Orders (order_id,customer_id,product_id,status,order_date) VALUES
(1,'C01','P01','Pending','2025-10-01'),
(2,'C02','P03','Completed','2025-10-02'),
(3,'C01','P02','Completed','2025-10-03'),
(4,'C04','P05','Cancelled','2025-10-04'),
(5,'C05','P01','Pending','2025-10-05');


UPDATE Products
SET stock=stock+10,
	price=price*1.05
WHERE product_name = 'Dell XPS 15';

UPDATE Customers
SET phone = '0999999999'
WHERE customer_id = 'C03';

DELETE FROM Orders WHERE status='Completed' AND order_date < '2025-10-03';





    