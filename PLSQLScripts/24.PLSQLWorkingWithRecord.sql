CREATE OR REPLACE PROCEDURE process_customer 
(
c_id IN customer.customer_id%TYPE)
IS
c_rec customer%rowtype;
BEGIN
SELECT *
INTO c_rec 
FROM customer 
WHERE customer_id = c_id;

c_rec.first_name:= 'Donald';
c_rec.last_name:='Trump';

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

EXECUTE process_customer(10);