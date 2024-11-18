-- Create database
CREATE DATABASE ASM;
USE ASM;

-- Create Users table
CREATE TABLE Users (
    username VARCHAR(255) PRIMARY KEY,
    password VARCHAR(255),
    full_name NVARCHAR(255),
    phone_number VARCHAR(20),
    role INT,
    email VARCHAR(255),
    address NVARCHAR(255)
);

-- Insert data into Users table
INSERT INTO Users (username, password, full_name, phone_number, role, email, address) VALUES
('admin', '123', N'Lê Đào Tấn Thành', '1023084123', 0, 'info@gmail.com', N'123 Đường ABC, Quận 1, TP.HCM'),
('staff1', '123', N'Lê Hoàng Phúc', '5123512334', 1, 'staff1@gmail.com', N'456 Đường DEF, Quận 2, TP.HCM'),
('staff2', '123', N'Trần Văn Thảo', '3245142523', 1, 'staff2@gmail.com', N'789 Đường GHI, Quận 3, TP.HCM'),
('staff3', '123', N'Nguyễn Minh Quân', '4552341234', 1, 'staff3@gmail.com', N'101 Đường JKL, Quận 4, TP.HCM'),
('user1', '123', N'Nguyễn Thị Ngọc Minh', '332412334', 2, 'user1@gmail.com', N'202 Đường MNO, Quận 5, TP.HCM'),
('user2', '123', N'Trần Hồng Nhi', '3423412342', 2, 'user2@gmail.com', N'303 Đường PQR, Quận 6, TP.HCM'),
('user3', '123', N'Lê Quang Hải', '2213412342', 2, 'user3@gmail.com', N'404 Đường STU, Quận 7, TP.HCM'),
('user4', '123', N'Trần Triệu Hoàng Anh', '4245123452', 2, 'user4@gmail.com', N'505 Đường VWX, Quận 8, TP.HCM');

SELECT * FROM Users

-- Create Products table
CREATE TABLE Products (
    id VARCHAR(255) PRIMARY KEY,
    name NVARCHAR(255),
    type NVARCHAR(255),
    image VARCHAR(255),
    description NVARCHAR(255),
    price FLOAT,
    sale INT,
    quantity INT
);

-- Insert data into Products table
INSERT INTO Products (id, name, type, image, description, price, sale, quantity) VALUES
('product1', N'Modern Fabric Sofa', N'ModernChair', '875.jpg', N'Ghe Sofa hien dai', 8698000335693.0, 1, 20),
('product10', N'Modern soft chair', N'ModernChair', 'product-portrait', N'Bo ghe mem san', 120.25, 1, 7),
('product11', N'Vintage Leather Chair', N'LuxuryChair', 'product-portrait', N'Ghe da co dien', 220.5, 0, 6),
('product12', N'Comfort Recliner', N'ComfortableChair', 'product-portrait', N'Ghe nga thoai mai', 145.75, 0, 10),
('product13', N'Swivel Office Chair', N'OfficeChair', 'product-portrait', N'Ghe van phong xoay', 85.30000305175781, 1, 20),
('product20', N'Bean Bag Chair', N'ClassicChair', 'product-portrait', N'Ghe tui hat xop', 60.7, 1, 20),
('product3', N'European Style Chair', N'LuxuryChair', 'product-portrait', N'Ghe phong cach chau au', 80.0, 1, 5),
('product7', N'Modern Plastic Chair', N'ModernChair', 'product-portrait', N'Ghe nhua hien dai', 195.65, 0, 14)


SELECT * FROM Products

-- Create Carts_Detail table
CREATE TABLE Carts_Detail (
    username VARCHAR(255),
    product_id VARCHAR(255),
    product_name NVARCHAR(255),
    product_image VARCHAR(255),
    product_price FLOAT,
    quantity INT,
    total_price FLOAT,
    PRIMARY KEY (username, product_id),
    FOREIGN KEY (username) REFERENCES Users(username),
    FOREIGN KEY (product_id) REFERENCES Products(id)
);

-- Insert data into Carts_Detail table
INSERT INTO Carts_Detail (username, product_id, product_name, product_image, product_price, quantity, total_price) VALUES 
('user1', 'product12', N'Comfort Recliner', 'product-portrait', 145.75, 1, 145.75),
('user1', 'product7', N'Modern Plastic Chair', 'product-portrait', 195.65, 2, 391.3),
('user1', 'product10', N'Modern soft chair', 'product-portrait', 120.25, 3, 360.75),
('user2', 'product3', N'European Style Chair', 'product-portrait', 80.0, 1, 80.0),
('user2', 'product11', N'Vintage Leather Chair', 'product-portrait', 220.5, 2, 441.0)

SELECT * FROM Carts_Detail

-- Create Bills table
CREATE TABLE Invoice (
    id VARCHAR(255) PRIMARY KEY,
    username VARCHAR(255),
    invoice_date DATETIME,
    total_price FLOAT,
    FOREIGN KEY (username) REFERENCES Users(username)
);

-- Insert data into Bills table
INSERT INTO Invoice (id, username, invoice_date, total_price) VALUES 
('bill1', 'user1', '2024-03-19 19:30:45', 145.75),
('bill2', 'user2', '2024-04-20 13:30:15', 441.0);




SELECT * FROM Invoice

-- Create Bills_Detail table
CREATE TABLE Invoice_Detail (
    bill_id VARCHAR(255),
    product_id VARCHAR(255),
    product_name NVARCHAR(255),
    product_image VARCHAR(255),
    product_price FLOAT,
    quantity INT,
    total_price FLOAT,
    PRIMARY KEY (bill_id, product_id),
    FOREIGN KEY (bill_id) REFERENCES Bills(id),
    FOREIGN KEY (product_id) REFERENCES Products(id)
);

-- Insert data into Bills_Detail table
INSERT INTO Invoice_Detail (bill_id, product_id, product_name, product_image, product_price, quantity, total_price) VALUES 
('bill1', 'product12', N'Comfort Recliner', 'product-portrait', 145.75, 1, 145.75),
('bill2', 'product11', N'Vintage Leather Chair', 'product-portrait', 220.5, 2, 441.0);







-- Create WishList table
CREATE TABLE WishList (
    username VARCHAR(255),
    product_id VARCHAR(255),
    product_name NVARCHAR(255),
    product_image VARCHAR(255),
    product_price FLOAT,
    PRIMARY KEY (username, product_id),
    FOREIGN KEY (username) REFERENCES Users(username),
    FOREIGN KEY (product_id) REFERENCES Products(id)
);

-- Insert data into WishList table
INSERT INTO WishList (username, product_id, product_name, product_image, product_price) VALUES
('user1', 'product1', N'Modern Fabric Sofa', '875.jpg', 8698000335693.0),
('user1', 'product2', N'Natural Wood Armchair', 'product-portrait', 195.55),
('user2', 'product3', N'European Style Chair', 'product-portrait', 80.0),
('user2', 'product4', N'Ergonomic Office Chair', 'product-portrait', 43.2),
('user3', 'product5', N'Relaxing Armchair', 'product-portrait', 150.0),
('user3', 'product6', N'Industrial Wooden Chair', 'product-portrait', 120.75),
('user4', 'product7', N'Modern Plastic Chair', 'product-portrait', 195.65),
('user4', 'product8', N'Elegant Plastic Chair', 'product-portrait', 82.9),
('user1', 'product9', N'Modern orange sofa', 'product-portrait', 869.99);



SELECT * FROM WishList
