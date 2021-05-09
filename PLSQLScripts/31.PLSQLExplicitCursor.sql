CREATE OR REPLACE PROCEDURE process_customer7
(
c_id IN customer.customer_id%TYPE)
IS
c_fname customer.first_name%TYPE;
c_lname customer.last_name%TYPE;
c_mname customer.middle_name%TYPE;
c_add1 customer.address_line1%TYPE;
c_add2 customer.address_line2%TYPE;
c_city customer.city%TYPE;
c_country customer.country%TYPE;
c_date_added customer.date_added%TYPE;
c_region customer.region%TYPE;
CURSOR c is SELECT first_name,last_name,middle_name,address_line1,address_line2,city,country,date_added,region 
FROM customer
WHERE customer_id = c_id; --declaration of cursor

BEGIN

OPEN c; --opening of cursor

fetch c
INTO c_fname,c_lname,c_mname,c_add1,c_add2,c_city,c_country,c_date_added,c_region;

DBMS_OUTPUT.PUT_LINE('First Name: '||c_fname);
DBMS_OUTPUT.PUT_LINE('Last Name: '||c_lname);
DBMS_OUTPUT.PUT_LINE('Middle Name: '||c_mname);
DBMS_OUTPUT.PUT_LINE('Address Line1: '||c_add1);
DBMS_OUTPUT.PUT_LINE('Address Line2: '||c_add2);
DBMS_OUTPUT.PUT_LINE('City: '||c_city);
DBMS_OUTPUT.PUT_LINE('Country: '||c_country);
DBMS_OUTPUT.PUT_LINE('Date Added: '||c_date_added);
DBMS_OUTPUT.PUT_LINE('Region: '||c_region);

CLOSE c;
END;

execute process_customer7(12);