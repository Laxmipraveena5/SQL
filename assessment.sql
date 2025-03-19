create database assessment;
use assessment;
CREATE TABLE `agents` (
  `agent_code` char(50) NOT NULL,
  `agent_name` char(50) DEFAULT NULL,
  `working_area` char(50) DEFAULT NULL,
  `comission` varchar(11) DEFAULT NULL,
  `phone_number` char(50) DEFAULT NULL
);
select * from agents;
INSERT INTO `agents` (`agent_code`, `agent_name`, `working_area`, `comission`, `phone_number`) VALUES
('A01', 'Andrew', 'London', '2%', '07635971237'),
('A02', 'Helena', 'Manchester', '3%', '07436432564'),
('A03', 'Rickey', 'York', '2.5%', '07436437644'),
('A04', 'Melvin', 'Birmingham', '0.5%', '07871432564'),
('A05', 'Kris', 'Wales', '3%', '07436432564');
CREATE TABLE `customer` (
  `cust_code` int NOT NULL,
  `cust_name` varchar(40) NOT NULL,
  `cust_city` varchar(45) ,
  `working_area` varchar(55) NOT NULL,
  `grade` int,
  `opening_amount` float NOT NULL,
  `receive_amount` float NOT NULL,
  `payment_amount` float NOT NULL,
  `outstanding_amount` float NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `agent_code` varchar(45) 
);
show tables;
INSERT INTO `customer`(`cust_code`, `cust_name`, `cust_city`, `working_area`, `grade`, `opening_amount`, `receive_amount`, `payment_amount`, `outstanding_amount`, `phone_number`, `agent_code`) VALUES
(1, 'Pedro', 'York', 'York', 2, 2000, 1000, 3000, 2000, '07425686433', 'A04'),
(2, 'Curt', 'Wales', 'Wales', 1, 3000, 4000, 1000, 2000, '0742556467641', 'A02'),
(3, 'Angelo', 'Leeds', 'Leeds', 4, 2000, 3000, 1000, 5000, '075345323675', 'A05'),
(4, 'Werner', 'Glasgow', 'Glasgow', 2, 3000, 1000, 2000, 4000, '07135646752', 'A01'),
(5, 'Claire', 'Leeds', 'Leeds', 5, 1000, 3000, 2000, 4000, '071356467525', 'A05');
CREATE TABLE `information` (
  `id1` int(1) NOT NULL,
  `agent_name` char(50) DEFAULT NULL,
  `comisson` varchar(11) DEFAULT NULL,
  `phone_number` char(50) DEFAULT NULL,
  `working_area` char(50) DEFAULT NULL,
  `cust_city` char(35) DEFAULT NULL,
  `cust_name` varchar(40) NOT NULL,
  `c_working_area` varchar(55) NOT NULL,
  `grade` int(11) DEFAULT NULL,
  `opening_amount` float NOT NULL,
  `outstanding_amount` float NOT NULL,
  `payment_amount` float NOT NULL,
  `c_phone_number` varchar(11) NOT NULL,
  `receive_amount` float NOT NULL,
  `advance_amount` int(11) NOT NULL,
  `order_amount` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `order_description` varchar(60) NOT NULL
);
INSERT INTO `information` (`id1`, `agent_name`, `comisson`, `phone_number`, `working_area`, `cust_city`, `cust_name`, `c_working_area`, `grade`, `opening_amount`, `outstanding_amount`, `payment_amount`, `c_phone_number`, `receive_amount`, `advance_amount`, `order_amount`, `order_date`, `order_description`) VALUES
(1, 'Andrew', '2%', '07635971237', 'London', 'York', 'Pedro', 'York', 2, 2000, 2000, 3000, '07425686433', 1000, 500, 1000, '2021-10-04', 'shoe'),
(2, 'Helena', '3%', '07436432564', 'Manchester', 'Wales', 'Curt', 'Wales', 1, 3000, 2000, 1000, '07425564676', 4000, 2000, 3000, '2021-08-10', 'clothes'),
(3, 'Rickey', '2.5%', '07436437644', 'York', 'Leads', 'Angelo', 'Leads', 4, 2000, 5000, 1000, '07534532367', 3000, 1000, 2000, '2022-11-03', 'clothes'),
(4, 'Melvin', '0.5%', '07871432564', 'Birmingham', 'Glasgow', 'Werner', 'Glasgow', 2, 3000, 4000, 2000, '07135646725', 1000, 3000, 5000, '2022-07-13', 'shoe'),
(5, 'Kris', '3%', '07436432564', 'Wales', 'Leeds', 'Claire', 'Leeds', 5, 1000, 4000, 2000, '07135646752', 3000, 1200, 2000, '2022-07-13', 'clothes');
CREATE TABLE `orders` (
  `order_num` int(11) NOT NULL,
  `order_amount` int(11) NOT NULL,
  `advance_amount` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `cust_code` int(30) NOT NULL,
  `agent_code` varchar(40) NOT NULL,
  `order_description` varchar(60) NOT NULL
);
INSERT INTO `orders` (`order_num`, `order_amount`, `advance_amount`, `order_date`, `cust_code`, `agent_code`, `order_description`) VALUES
(20010, 1000, 500, '2021-10-04', 1, 'A04', 'shoe'),
(20011, 3000, 2000, '2021-08-10', 2, 'A02', 'clothes'),
(20012, 2000, 1000, '2022-11-03', 3, 'A05', 'clothes'),
(20013, 5000, 3000, '2022-07-13', 4, 'A01', 'shoe'),
(20014, 2000, 1200, '2022-07-13', 5, 'A05', 'clothes');
select agent_name, phone_number from agents;
select cust_name from customer where working_area="leeds";
show tables;
select * from agents;
select * from customer;
select * from information;
select * from orders;
select order_num, order_amount from orders where order_description="shoe";
select agent_code, order_amount, order_description from orders where order_description="clothes";
select * from orders where order_amount>'2000';
select cust_name, phone_number from customer where cust_name like '%e%';
select * from orders where order_amount=(select min(order_amount) from orders);
select sum(order_amount) from orders;
SELECT COUNT(DISTINCT agent_code) AS total_agents FROM orders WHERE cust_code IN (SELECT DISTINCT cust_code FROM orders);
SELECT cust_code, MAX(order_amount) AS highest_purchase_amount FROM orders GROUP BY cust_code;
SELECT agent_code, order_amount FROM orders WHERE order_date = '2022-07-13' AND order_amount = (SELECT MAX(order_amount) FROM orders WHERE order_date = '2022-07-13');
SELECT c.cust_name, c.cust_city, a.agent_name, a.working_area FROM customer c
JOIN agents a ON c.cust_city = a.working_area;
SELECT c.cust_name, a.agent_name FROM customer c JOIN agents a ON c.agent_code = a.agent_code;
SELECT o.order_num, c.cust_name, c.cust_city, a.agent_name, a.working_area, o.order_amount
FROM orders o JOIN customer c ON o.cust_code = c.cust_code JOIN agents a ON c.agent_code = a.agent_code WHERE c.cust_city <> a.working_area;
SELECT o.* FROM orders o JOIN agents a ON o.agent_code = a.agent_code WHERE a.agent_name = 'Rickey';









