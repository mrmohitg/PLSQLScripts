CREATE OR REPLACE PROCEDURE process_customer 
(
c_id IN customer.customer_id%TYPE)
IS
--Instead of using all the variables we can use c_rec variable
--c_customerid customer.customer_id%TYPE;
--c_fname customer.first_name%TYPE;
--c_lname customer.last_name%TYPE;
--c_mname customer.middle_name%TYPE;
--c_add1 customer.address_line1%TYPE;
--c_add2 customer.address_line2%TYPE;
--c_city customer.city%TYPE;
--c_country customer.country%TYPE;
--c_date_added customer.date_added%TYPE;
--c_region customer.region%TYPE;
c_rec customer%rowtype;
BEGIN
SELECT --customer_id,first_name,last_name,middle_name,address_line1,address_line2,city,country,date_added,region 
*
INTO c_rec --c_customerid,c_fname,c_lname,c_mname,c_add1,c_add2,c_city,c_country,c_date_added,c_region
FROM customer 
WHERE customer_id = c_id;

--DBMS_OUTPUT.PUT_LINE('First Name: '||c_fname);
--DBMS_OUTPUT.PUT_LINE('Last Name: '||c_lname);
--DBMS_OUTPUT.PUT_LINE('Middle Name: '||c_mname);
--DBMS_OUTPUT.PUT_LINE('Address Line1: '||c_add1);
--DBMS_OUTPUT.PUT_LINE('Address Line2: '||c_add2);
--DBMS_OUTPUT.PUT_LINE('City: '||c_city);
--DBMS_OUTPUT.PUT_LINE('Country: '||c_country);
--DBMS_OUTPUT.PUT_LINE('Date Added: '||c_date_added);
--DBMS_OUTPUT.PUT_LINE('Region: '||c_region);

DBMS_OUTPUT.PUT_LINE('First Name: '||c_rec.first_name);
DBMS_OUTPUT.PUT_LINE('Last Name: '||c_rec.last_name);
--DBMS_OUTPUT.PUT_LINE('Middle Name: '||c_rec.c_mname);
DBMS_OUTPUT.PUT_LINE('Address Line1: '||c_rec.address_line1);
DBMS_OUTPUT.PUT_LINE('Address Line2: '||c_rec.address_line2);
DBMS_OUTPUT.PUT_LINE('City: '||c_rec.city);
DBMS_OUTPUT.PUT_LINE('Country: '||c_rec.country);
DBMS_OUTPUT.PUT_LINE('Date Added: '||c_rec.date_added);
DBMS_OUTPUT.PUT_LINE('Region: '||c_rec.region);


END;