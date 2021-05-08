CREATE OR REPLACE PACKAGE BODY CustomerPackage
AS

PROCEDURE Add_Customer
(
c_id IN NUMBER,
c_fname IN VARCHAR2,
c_lname IN VARCHAR2,
c_mname IN VARCHAR2,
c_add1 IN VARCHAR2,
c_add2 IN VARCHAR2,
c_city IN VARCHAR2,
c_country IN VARCHAR2,
c_date_added IN DATE,
c_region IN VARCHAR2
)
AS
BEGIN

INSERT INTO customer(customer_id,first_name,last_name,middle_name,address_line1,address_line2,city,country,date_added,region) 
VALUES (c_id,c_fname,c_lname,c_mname,c_add1,c_add2,c_city,c_country,c_date_added,c_region);

COMMIT;

DBMS_OUTPUT.PUT_LINE('Data Successfully Inserted.');

END Add_Customer;

PROCEDURE Add_Customer1
(
c_id IN NUMBER,
c_fname IN VARCHAR2,
c_lname IN VARCHAR2,
c_mname IN VARCHAR2,
c_add1 IN VARCHAR2,
c_add2 IN VARCHAR2,
c_city IN VARCHAR2,
c_country IN VARCHAR2,
c_date_added IN DATE,
c_region IN VARCHAR2,
total_count OUT NUMBER
)
AS
BEGIN

INSERT INTO customer(customer_id,first_name,last_name,middle_name,address_line1,address_line2,city,country,date_added,region) 
VALUES (c_id,c_fname,c_lname,c_mname,c_add1,c_add2,c_city,c_country,c_date_added,c_region);

COMMIT;

DBMS_OUTPUT.PUT_LINE('Data Successfully Inserted.');

SELECT COUNT(1) INTO total_count FROM customer;

END Add_Customer1;

PROCEDURE Add_Customer2
(
c_id IN OUT NUMBER,
c_fname IN VARCHAR2,
c_lname IN VARCHAR2,
c_mname IN VARCHAR2,
c_add1 IN VARCHAR2,
c_add2 IN VARCHAR2,
c_city IN VARCHAR2,
c_country IN VARCHAR2,
c_date_added IN DATE,
c_region IN VARCHAR2
)
AS
BEGIN

INSERT INTO customer(customer_id,first_name,last_name,middle_name,address_line1,address_line2,city,country,date_added,region) 
VALUES (c_id,c_fname,c_lname,c_mname,c_add1,c_add2,c_city,c_country,c_date_added,c_region);

COMMIT;

DBMS_OUTPUT.PUT_LINE('Data Successfully Inserted.');

SELECT COUNT(1) INTO C_id FROM customer;

END Add_Customer2;

PROCEDURE Get_Customer
(
c_id IN NUMBER
)
AS

c_name customer.first_name%TYPE;
c_country customer.country%TYPE;

BEGIN

SELECT first_name, country INTO c_name, c_country from customer
WHERE customer_id = c_id;


DBMS_OUTPUT.PUT_LINE('Name: '||c_name);
DBMS_OUTPUT.PUT_LINE('Country: '||c_country);

EXCEPTION
WHEN no_data_found THEN
DBMS_OUTPUT.PUT_LINE('No such customer!');
WHEN too_many_rows THEN
DBMS_OUTPUT.PUT_LINE('You got more than 1 row!');
WHEN others THEN
DBMS_OUTPUT.PUT_LINE('Error!');
END Get_Customer;

PROCEDURE Get_Customer1
(
c_id IN NUMBER
)
AS

c_name customer.first_name%TYPE;
c_country customer.country%TYPE;
ex_customer_id EXCEPTION;

BEGIN
IF c_id <=0 THEN
RAISE ex_customer_id;
END IF;
SELECT first_name, country INTO c_name, c_country from customer
WHERE customer_id = c_id;


DBMS_OUTPUT.PUT_LINE('Name: '||c_name);
DBMS_OUTPUT.PUT_LINE('Country: '||c_country);

EXCEPTION
WHEN ex_customer_id THEN
DBMS_OUTPUT.PUT_LINE('Customer Id must be greater than zero!');
WHEN no_data_found THEN
DBMS_OUTPUT.PUT_LINE('No such customer!');
WHEN too_many_rows THEN
DBMS_OUTPUT.PUT_LINE('You got more than 1 row!');
WHEN others THEN
DBMS_OUTPUT.PUT_LINE('Error!');
END Get_Customer1;

FUNCTION find_salescount
(
p_sales_date IN date
) RETURN NUMBER
AS 
num_of_sales NUMBER:=0;
BEGIN

SELECT COUNT(*) INTO num_of_sales FROM sales WHERE sales_date = p_sales_date;

RETURN num_of_sales;

END find_salescount;

END CustomerPackage;