create database task2;
use task2;
create table salesman(salesman_id int not null primary key,name varchar(20) not null, city varchar(20) not null,comission decimal(7,2));
select * from salesman;
insert into salesman
values
(5001,'James Hoog','New York',0.15),
(5002,'Nail Knite','paris',0.13),
(5005,'Pit Alex','London',0.11),
(5006,'Mc Lyon','Paris',0.14),
(5007,'Paul Adam','Rome',0.13),
(5003,'Lauson Hen','San Jose',0.12);
create table customer(customer_id int not null primary key, cust_name varchar(20) not null, city varchar(20) not null, grade int not null, salesman_id int not null, foreign key(salesman_id)  REFERENCES salesman(salesman_id));
select * from customer;
insert into customer
values
(3002,'Nick Rimando','New York',100,5001),
(3007,'Brad Davis','New York',200,5001),
(3005,'Graham Zusi','California',200,5002),
(3008,'Julian Green','london',300,5002),
(3004,'Fabin johnson','Paris',300,5006),
(3009,'Geoff cameron','Berlin',100,5003);
--1. From the following tables, write a SQL query to find the salespeople and customers who live in the same city. Return customer name, salesperson name and salesperson city.  
select custm.cust_name,sale.name, sale.city from salesman sale, customer custm
where custm.city=sale.city;
--2. From the above tables, write a SQL query to locate all the customers and the salesperson who works for them. Return customer name, and salesperson name.  
select custm.cust_name,sale.name from salesman sale, customer custm
where custm.salesman_id=sale.salesman_id;
--3.We need to get company name and company id columns from company table and company id, item name, item unit columns from foods table
create table foods(ITEM_ID int not null, ITEM_NAME varchar(20)not null, ITEM_UNIT varchar(10)not null,	COMPANY_ID int);
insert into foods
values
(1,'Chex Mix','Pcs',16),
(6,'Cheez-It','Pcs',15),
(2,'BN Biscuit','Pcs',15),
(3,'Mighty Munch','Pcs',17),
(4,'Pot Rice','Pcs',15),
(5,'Jaffa Cakes','Pcs',18),
(7,'Salt n Shake','Pcs',null);
select * from foods;
create table company(COMPANY_ID int not null,COMPANY_NAME varchar(20) not null,COMPANY_CITY varchar(20) not null);
insert into company
values
(18,'Order All','Boston'),
(15,'Jack Hill Ltd','London'),
(16,'Akas Foods','Delhi'),
(17,'Foodies','London'),
(19,'sip-n--Bite','New York');
select * from company;
select comp.COMPANY_ID, comp.COMPANY_NAME,food. ITEM_NAME, food.ITEM_ID from company comp left join foods food on comp.COMPANY_ID=food.COMPANY_ID;
--4.We need to filtered out those bill number, item name and the bill amount for each bill which bill amount exceeds the value 500 and must be available at the food stall
create table counter_sale(BILL_NO int, ITEM_ID int, SL_QTY int, SL_RATE int, BILL_AMT int);
INSERT INTO counter_sale
VALUES
(1003,6,15,20,300),
(1004,4,18,30,540),
(1005,7,10,60,600),
(1006,3,25,25,625),
(1001,4,20,30,600),
(1002,1,40,50,2000);
select bill.BILL_NO,food.ITEM_NAME,bill.BILL_AMT from foods food, counter_sale bill
where bill.BILL_AMT > 500 and food.ITEM_ID=bill.ITEM_ID;
--5. We need to get those bill number, item name, company name and city and the bill amount for each bill, which items are available in foods table, and their manufacturer must have enlisted to supply that item, and no NULL value for manufacturer are not allowed
select  bill.BILL_NO, food.ITEM_NAME, comp.COMPANY_NAME, comp.COMPANY_CITY, bill.BILL_AMT from counter_sale bill left join foods food on bill.ITEM_ID=food.ITEM_ID left join company comp on food.COMPANY_ID=comp.COMPANY_ID 
where  comp.COMPANY_NAME is not null order by bill.BILL_NO;
--6.To get company ID, company name and company city columns from company table and company ID, item name columns from foods table, after a RIGHT JOINING with these mentioned tables
select comp.COMPANY_ID, comp.COMPANY_NAME, comp.COMPANY_CITY, food.COMPANY_ID, food.ITEM_NAME from company comp right join foods food on comp.COMPANY_ID=food.COMPANY_ID;
--7. To get 'company_name' and 'company_city' from 'company' table which is entitled as alias 'a' and 'company_name' form 'company' table which is entitled as alias 'b' after an SELF JOINING with a table itself
select a.COMPANY_NAME,b.COMPANY_NAME,a.COMPANY_CITY FROM company a,company b
where a.COMPANY_CITY=b.COMPANY_CITY;
--8.To get 'agent_code' and 'agent_name' columns from the table 'agents' and sum of 'advance_amount' column from the table 'orders' after a joining, with following conditions -
--1. 'agent_code' of 'agents' and 'orders' must be same,
--2. the same combination of 'agent_code' and 'agent_name' of 'agents' table must be within a group,
--3. 'agent_code' of 'agents' table should arrange in an order, default is ascending order,
create table agents(AGENT_CODE VARCHAR(10),AGENT_NAME VARCHAR(20),WORKING_AREA VARCHAR(20),COMMISSION DECIMAL(7,2),PHONE_NO VARCHAR(20),COUNTRY VARCHAR(20));
INSERT INTO agents
values
('A007','Ramasundar','Bangalore',0.15,'077-25814763',null),
('A003','Alex','LOndon',0.13,'075-12458969',null),
('A008','Alford','New York',0.12,'044-25874365',null),
('A011','Ravi kumar','Bangalore',0.15,'077-45625874',null),
('A010','Santakumar','Chennai',0.14,'007-22388644',null),
('A012','Lucida','San Jose',0.12,'0444-52981425',null),
('A005','Anderson','Brisban',0.13,'045-21447739',null),
('A001','Subbaro','Bangalore',0.14,'077-12346674',null);
select * from agents;
create table orders(ORD_NUM INT, ORD_AMOUNT INT,ADVANCE_AMOINT INT, ODR_DATE varchar(20), CUST_CODE VARCHAR(10), AGENT_CODE VARCHAR(10),ORD_DESCRIPTION VARCHAR(20));
select * from orders;
insert into orders
	    values
(200114,3500,2000,'15-AUG-08','C00002','A008',NULL),
(200122,2500,400,'16-SEP-08','C00003','A004',NULL),
(200118,500,100,'20-JUL-08','C00023','A006',NULL),
(200119,4000,700,'16-SEP-08','C00007','A010',NULL),
(200121,1500,600,'23-SEP-08','C00008','A004',NULL),
(200130,2500,400,'30-JUL-08','C00025','A011',NULL),
(200134,4200,1800,'25-SEP-08','C00004','A005',NULL),
(200108,4000,600,'15-FEB-08','C00008','A004',NULL),
(200103,1500,700,'15-MAY-08','C00021','A005',NULL);
select * from orders;
select a.AGENT_CODE, a.AGENT_NAME,sum(b.ADVANCE_AMOINT) as "SUM(ORDER.ADVANCE_AMOUNT)" from orders b, agents a
where a.AGENT_CODE=b.AGENT_CODE
group by a.AGENT_CODE, a.AGENT_NAME
order by a.AGENT_CODE asc;
--9.To get 'item_name' and 'item_unit' from 'foods' table and 'company_name' and 'company_city' form 'company' table after a joining with following conditions-
--1. 'company_id' is primary key in 'company' table,
--2. 'company_id' is foreign key in 'foods' table which is referencing to the, primary key of 'company' table,
--3. 'company_id' of 'company' and 'foods' must be same,
--4. 'company_city' of 'company' column must be 'London'
ALTER TABLE company alter column COMPANY_ID int NOT NULL
ALTER TABLE company 
ADD PRIMARY KEY (COMPANY_ID);
ALTER TABLE foods ADD FOREIGN KEY (COMPANY_ID) REFERENCES company(COMPANY_ID);
select food.ITEM_NAME,food.ITEM_UNIT, comp.COMPANY_NAME,comP.COMPANY_CITY FROM company comp,foods food
where food.COMPANY_ID=comp.COMPANY_ID and comp.COMPANY_CITY='London';
--10.To get 'des_num' and 'des_date' columns from the table 'despatch' and sum of 'ord_amount' column from the table 'orders' together after a joining, with following conditions -
--1. 'a', and 'b' are the aliases of 'despatch' and 'orders',
--2. 'ord_amount' of 'despatch' and 'orders' must be same,
--3. the same combination of 'des_num' and 'des_date' of 'despatch' should be grouped,
create table despatch(DES_NUM VARCHAR(10) NOT NULL, DES_DATE VARCHAR(10),DES_AMOUNT INT ,ORD_NUM INT, ORD_DATE VARCHAR(10), ORD_AMOUNT INT, AGENT_CODE VARCHAR(10));
insert into despatch
values
('D002','10-JUN-08',2000,200112,'30-MAY-08',2000,'A007'),
('D005','19-OCT-08',4000,200119,'16-SEP-08',4000,'A0z'),
('D001','12-JAN-08',3800,200113,'10-JUN-08',4000,'A002'),
('D003','25-OCT-08',900,200117,'20-OCT-08',800,'A001'),
('D004','20-AUG-08',450,200120,'20-JUL-08',500,'A002'),
('D006','24-JUL-08',4500,200128,'20-JUL-08',3500,'A002');
select * from despatch;
select a.DES_NUM,a.DES_DATE,sum(b.ORD_AMOUNT) AS "SUM(B.ORD_AMOUNT)" FROM orders b,despatch a
where a.ORD_AMOUNT=b.ORD_AMOUNT
group by a.DES_NUM,a.DES_DATE;
/*11.To get 'ord_num', 'ord_amount', 'ord_date', 'cust_code' and 'agent_code' from the table 'orders' with following conditions:
in the outer query:
'agent_code' of 'orders' table must be in the list within IN operator in inner query :
in inner query:
'working_area' of 'agents' table must be 'Bangalore',
*/
SELECT ORD_NUM,ORD_AMOUNT,ODR_DATE,CUST_CODE, AGENT_CODE FROM orders
WHERE AGENT_CODE NOT IN(SELECT AGENT_CODE FROM agents WHERE WORKING_AREA='Bangalore');
--12.The following query display cust_country and number of customers for the same grade for each cust_country, with the following condition -
--1. number of customer for a same 'grade' must be more than 2,
create table customer2(CUST_CODE VARCHAR(10), CUST_NAME VARCHAR(20),CUST_CITY VARCHAR(20),WORKING_AREA VARCHAR(20), CUST_COUNTRY VARCHAR(10),GRADE INT,OPENING_AMT DECIMAL(7,2),RECEIVE_AMT DECIMAL(7,2));
insert into customer2
values
('C00013','Holmes','London','London','UK',2,6000,5000),
('C00001','Micheal','New York','New York','USA',2,3000,5000),
('C00020','Albert','New York','New York','USA',2,5000,7000),
('C00025','Ravindarn','Bangalore','Bangalore','India',2,5000,7000),
('C00024','Cook','London','London','UK',2,4000,9000),
('C00015','Stuart','London','London','UK',2,6000,8000),
('C00002','Bolt','New York','New York','USA',2,5000,7000);
select * from customer2;
select CUST_COUNTRY,COUNT(GRADE) from customer2
group by CUST_COUNTRY
having COUNT(grade)>2;
