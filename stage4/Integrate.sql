--PASSENGER AND CUSTOMER

--Check count
select count(*) from passenger
select count(*) from customer

--Adding a date of birth to the customer
alter table customer
add bdate Date 

--Making the date of birth a null field
ALTER TABLE CUSTOMER MODIFY bdate DATE NULL;

--Finding the different values ​​between the tables
select * from passenger  where passenger.idpassenger not in (select cid from customer )

--Insert data for customer
INSERT INTO customer (cid, cname, cemail, cphone)
SELECT p.idpassenger, 
       p.name, 
       SUBSTR(p.name, 1, 1) || '@example.com' AS cemail, 
       p.phone 
FROM passenger p
WHERE p.idpassenger NOT IN (SELECT c.cid FROM customer c);


--EMPLOYEE, EMPLOYEE_SHOP, DRIVER

--Create a new entity named EmployeeShop
CREATE TABLE EmployeeShop (
    EmployeeID NUMBER PRIMARY KEY,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(Eid)
);

--Entering values ​​from the bequeathed entity (employee)
INSERT INTO EmployeeShop (EmployeeID)
SELECT Eid
FROM Employee; 

--Merging data between employees and drivers
INSERT INTO employee (eid, ename, eemail, ephone)
SELECT 
    d.idriver, 
    d.name, 
    SUBSTR(d.name, 1, 1) || '@example.com' AS eemail, 
    '05' || TRIM(TO_CHAR(DBMS_RANDOM.VALUE(1000000, 9999999), '9999999')) AS ephone
FROM 
    driver d
WHERE 
    d.idriver NOT IN (SELECT e.eid FROM employee e);
    
--Deleting the name field from the drivers table
 ALTER TABLE driver DROP COLUMN name;
 
--ORDERS AND EMPLOYEE

--Deleting the relationship between employee orders
ALTER TABLE orders DROP CONSTRAINT SYS_C008146;

--PASSENGER AND TICKET

--Deleting the connection between passenger ticket
ALTER TABLE passenger DROP CONSTRAINT sys_c007928;

--ORDERS AND EMPLOYEE_SHOP

--Adding an ID field before adding a contact
ALTER TABLE orders
ADD (employeeid NUMBER);
 
--Added a relationship between orders employee Shop
ALTER TABLE orders
ADD CONSTRAINT fk_employee_shop
FOREIGN KEY (Employeeid)
REFERENCES employeeShop (Employeeid);
