

DROP DATABASE IF EXISTS store;
CREATE DATABASE store CHARACTER SET utf8mb4;
USE store;

CREATE TABLE manufacturer (
  manufacturer_code INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  manufacturer_name VARCHAR(100) NOT NULL
);

CREATE TABLE product (
  product_code INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  product_name VARCHAR(100) NOT NULL,
  product_price DOUBLE NOT NULL,
  product_manufacturer_code INT UNSIGNED NOT NULL,
  FOREIGN KEY (product_manufacturer_code) REFERENCES manufacturer(manufacturer_code)
);

INSERT INTO manufacturer VALUES(1, 'Asus');
INSERT INTO manufacturer VALUES(2, 'Lenovo');
INSERT INTO manufacturer VALUES(3, 'Hewlett-Packard');
INSERT INTO manufacturer VALUES(4, 'Samsung');
INSERT INTO manufacturer VALUES(5, 'Seagate');
INSERT INTO manufacturer VALUES(6, 'Crucial');
INSERT INTO manufacturer VALUES(7, 'Gigabyte');
INSERT INTO manufacturer VALUES(8, 'Huawei');
INSERT INTO manufacturer VALUES(9, 'Xiaomi');

INSERT INTO product VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO product VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO product VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO product VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO product VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO product VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO product VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO product VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO product VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO product VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO product VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

