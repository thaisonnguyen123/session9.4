********************************** Bài tập cơ bản 1 *******************************
create database tsubasa_csdl_session09 ;
use tsubasa_csdl_session09 ;


CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    address VARCHAR(255) NOT NULL
);


CREATE UNIQUE INDEX idx_email ON customers (email);


CREATE INDEX idx_phone ON customers (phone);


EXPLAIN SELECT * FROM customers WHERE email = 'tina@example.com';

INSERT INTO customers (customer_name, email, phone, address) VALUES
('Alice', 'alice@example.com', '1234567890', '123 Main St'),
('Bob', 'bob@example.com', '1234567891', '456 Elm St'),
('Carol', 'carol@example.com', '1234567892', '789 Oak St'),
('David', 'david@example.com', '1234567893', '135 Pine St'),
('Eva', 'eva@example.com', '1234567894', '246 Maple St'),
('Frank', 'frank@example.com', '1234567895', '369 Cedar St'),
('Grace', 'grace@example.com', '1234567896', '159 Birch St'),
('Hannah', 'hannah@example.com', '1234567897', '753 Willow St'),
('Ian', 'ian@example.com', '1234567898', '852 Ash St'),
('Jane', 'jane@example.com', '1234567899', '951 Cherry St'),
('Ken', 'ken@example.com', '1234567800', '258 Palm St'),
('Liam', 'liam@example.com', '1234567801', '369 Spruce St'),
('Mia', 'mia@example.com', '1234567802', '147 Fir St'),
('Noah', 'noah@example.com', '1234567803', '258 Larch St'),
('Olivia', 'olivia@example.com', '1234567804', '369 Redwood St'),
('Paul', 'paul@example.com', '1234567805', '654 Poplar St'),
('Quinn', 'quinn@example.com', '1234567806', '987 Magnolia St'),
('Rita', 'rita@example.com', '1234567807', '321 Willow St'),
('Sam', 'sam@example.com', '1234567808', '654 Hickory St'),
('Tina', 'tina@example.com', '1234567809', '987 Acacia St');

********************************** Bài tập cơ bản 2 *******************************

create view view_customer_contact as
select customer_id,customer_name,email,phone from customers ;


select * from view_customer_contact ;

********************************** Bài tập cơ bản 3 *******************************


CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL CHECK (price > 0),
    stock INT NOT NULL CHECK (stock > 0)
);

-- Bước 2: Thêm 20 bản ghi vào bảng products
INSERT INTO products (product_name, price, stock) VALUES
('Product 1', 500000.00, 10),
('Product 2', 1500000.00, 5),
('Product 3', 2000000.00, 8),
('Product 4', 300000.00, 20),
('Product 5', 2500000.00, 15),
('Product 6', 800000.00, 12),
('Product 7', 1200000.00, 7),
('Product 8', 1000000.00, 3),
('Product 9', 1750000.00, 6),
('Product 10', 950000.00, 4),
('Product 11', 450000.00, 9),
('Product 12', 1100000.00, 13),
('Product 13', 500000.00, 20),
('Product 14', 999999.99, 12),
('Product 15', 3500000.00, 6),
('Product 16', 120000.00, 23),
('Product 17', 5555555.00, 8),
('Product 18', 1700000.00, 5),
('Product 19', 850000.00, 7),
('Product 20', 2000000.00, 10);

DELIMITER $$

CREATE PROCEDURE get_high_value_products()
BEGIN
    SELECT * FROM products WHERE price > 1000000.00;
END $$

DELIMITER ;



CALL get_high_value_products();
********************************** Bài tập cơ bản 4 *******************************

DELIMITER //
	create procedure insert_customer(in_customer_name varchar(50) , in_email varchar(100) , in_phone varchar(15), in_address varchar(255))
    begin
		insert into customers (customer_name, email, phone, address) 
        values (in_customer_name , in_email , in_phone ,in_address);
        select "Thêm mới khách hàng thành công !" as message ;
    end ;
    
//
DELIMITER ;

call insert_customer('Nguyễn Công Hưởng','huongcaoha@gmail.com','0988888888','Hà Nội');