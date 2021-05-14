PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;

DROP TABLE IF EXISTS purchases;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS shopping_cart;
DROP TABLE IF EXISTS motherboard;
DROP TABLE IF EXISTS gpu;
DROP TABLE IF EXISTS cpu;

CREATE TABLE customer (
    customer_address text not null,
    phone_number integer not null,
    customer_name text not null,
    username text not null,
    customer_id integer not null,
    customer_password text not null,
    primary key (customer_id)
);

CREATE TABLE products (
    product_name text not null,
    product_id integer not null,
    product_type text not null,
    stock_levels integer not null,
    price real not null,
    primary key (product_id)
);


CREATE TABLE purchases (
    purchase_id integer not null,
    p_user_id integer not null,
    item_id integer not null,
    date_of_purchase text not null,
    primary key (purchase_id),
    FOREIGN KEY (p_user_id) REFERENCES customer(customer_id),
    FOREIGN KEY (item_id) REFERENCES products(product_id)
);

CREATE TABLE shopping_cart (
    order_id integer not null,
    sc_user_id integer not null,
    item_id integer not null,
    primary key (order_id),
    FOREIGN KEY (sc_user_id) REFERENCES customer(customer_id),
    FOREIGN KEY (item_id) REFERENCES products(product_id)
);

CREATE TABLE cpu (
    item_id integer not null,
    cpu_name text not null,
    price real not null,
    manufacturer text not null,
    cpu_type text not null,
    socket text not null,
    clock_speed text not null,
    core_count integer not null,
    series text not null,
    microarchitexture text not null,
    primary key (item_id)
);

CREATE TABLE gpu (
    item_id integer not null,
    gpu_name text not null,
    price real not null,
    manufacturer text not null,
    gpu_type text not null,
    chipset text not null,
    memory text not null,
    memory_type text not null,
    clock_speed text not null,
    microarchitexture text not null,
    primary key (item_id)
);

CREATE TABLE motherboard (
    item_id integer not null,
    motherboard_name text not null,
    price real not null,
    series text not null,
    manufacturer text not null,
    primary key (item_id)
);

INSERT INTO customer VALUES("123 Carleton Avenue", 6131221234, "Adrian", "adrianrox", 0, "erjgnwesjtgs");
INSERT INTO customer VALUES("455 Ottawa Place", 9058367385, "Clark", "clarkrox", 1, "oskrgnesgpsegnse2452");
INSERT INTO customer VALUES("638 Voss", 123456789, "John", "johnrox", 2, "eouirfweifiuq242");
INSERT INTO customer VALUES("3321 Castle", 333445555, "Nick", "nickrox", 3, "ao5234eufhwaFA");
INSERT INTO customer VALUES("291 Berry", 999887777, "Mat", "matrox", 4, "UYEFHGAWF98");
INSERT INTO customer VALUES("975 Fire Oak", 987654321, "Max", "maxrox", 5, "7237rg9");

INSERT INTO cpu VALUES(3463265, "Intel Core i7-6700k", 400.00, "Intel", "Desktop", "LGA1151", "4.5GHz", 4, "i7 series", "64-bit");
INSERT INTO cpu VALUES(3572357, "Intel Core i9-9900k", 500.00, "Intel", "Desktop", "LGA1155", "5.1GHz", 12, "i9 series", "64-bit");
INSERT INTO cpu VALUES(2347812, "Intel Core i5-6600k", 200.00, "Intel", "Desktop", "LGA1151", "4.0GHz", 4, "i5 series", "64-bit");
INSERT INTO cpu VALUES(3485212, "AMD Ryzen 3 2600G", 150.00, "AMD", "Desktop", "AM4", "4.2GHz", 6, "Ryzen 3 series", "64-bit");
INSERT INTO cpu VALUES(352353, "AMD Threadripper 3900X", 2000.00, "AMD", "Desktop", "TRX4", "3.9GHz", 16, "Ryzen Threadripper series", "64-bit");

INSERT INTO gpu VALUES(4638453, "NVIDIA Geforce GTX 1080", 600.00, "NVIDIA", "Full-size", "Pascal", 8, "GDDR5X", "1680MHz", "GTX");
INSERT INTO gpu VALUES(3843854, "EVGA Geforce GTX 1080ti", 700.00, "EVGA", "Full-size", "Pascal", 6, "GDDR5X", "1777MHz", "GTX");
INSERT INTO gpu VALUES(3583572, "Zotac Geforce RTX 2080", 1000.00, "ZOTAC", "Half-size", "Turing", 4, "GDDR5X", "2000MHz", "RTX");
INSERT INTO gpu VALUES(357384, "NVIDIA Geforce RTX 2080ti", 1500.00, "NVIDIA", "Full-size", "Turing", 2, "GDDR5X", "2100MHz", "RTX");
INSERT INTO gpu VALUES(375257, "NVIDIA Geforce RTX 3080ti", 3000.00, "NVIDIA", "Full-size", "Ampere", 0, "G6X", "2200MHz", "RTX");

INSERT INTO motherboard VALUES(8235723, "MSI Z170A PC MATE", 200.00, "Z170", "MSI");
INSERT INTO motherboard VALUES(3572457, "EVGA Z270", 300.00, "Z270", "EVGA");
INSERT INTO motherboard VALUES(223571, "ASUS B450-M", 200.00, "B450", "ASUS");
INSERT INTO motherboard VALUES(357385, "ASUS B350", 300.00, "B350", "ASUS");
INSERT INTO motherboard VALUES(358453, "ASUS Z370 ROG STRIX", 400.00, "Z370", "ASUS");

INSERT INTO products VALUES("Intel Core i7-6700k", 3463265, "CPU", 20, 400.00);
INSERT INTO products VALUES("Intel Core i9-9900k", 3572357, "CPU", 10, 500.00);
INSERT INTO products VALUES("Intel Core i5-6600k", 2347812, "CPU", 5, 200.00);
INSERT INTO products VALUES("AMD Ryzen 3 2600G", 3485212, "CPU", 40, 150.00);
INSERT INTO products VALUES("AMD Threadripper 3900X", 358353, "CPU", 1, 2000.00);

INSERT INTO products VALUES("MSI Z170A PC MATE", 8235723, "Motherboard", 24, 200.00);
INSERT INTO products VALUES("EVGA Z270", 3572457, "Motherboard", 5, 300.00);
INSERT INTO products VALUES("ASUS B450-M", 223571, "Motherboard", 5, 200.00);
INSERT INTO products VALUES("ASUS B350", 357385, "Motherboard", 6, 300.00);
INSERT INTO products VALUES("ASUS Z370 ROG STRIX", 353353, "Motherboard", 7, 400.00);

INSERT INTO products VALUES("NVIDIA Geforce GTX 1080", 4638453, "GPU", 24, 600.00);
INSERT INTO products VALUES("EVGA Geforce GTX 1080ti", 3843854, "GPU", 15, 700.00);
INSERT INTO products VALUES("Zotac Geforce RTX 2080", 3583572, "GPU", 10, 1000.00);
INSERT INTO products VALUES("NVIDIA Geforce RTX 2080ti", 357384, "GPU", 5, 1500.00);
INSERT INTO products VALUES("NVIDIA Geforce RTX 3080ti", 375257, "GPU", 0, 3000.00);

INSERT INTO purchases VALUES(3452378945, 6131221234, 3463265, "January 1, 2021");
INSERT INTO purchases VALUES(2352352355, 9058367385, 4638453, "January 2, 2021");

INSERT INTO shopping_cart VALUES(23512365, 6131221234, 3463265);
INSERT INTO shopping_cart VALUES(34623672, 9058367385, 4638453);

COMMIT;