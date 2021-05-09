CREATE OR REPLACE PROCEDURE process_customer1 
(
c_id IN customer.customer_id%TYPE)
IS
c_rec customer%rowtype;
c_rec1 customer%rowtype;
BEGIN
SELECT *
INTO c_rec 
FROM customer 
WHERE customer_id = c_id;

c_rec1:=c_rec;
c_rec.first_name:= 'Barack';
c_rec.last_name:='Obama';

DBMS_OUTPUT.PUT_LINE('First Name: '||c_rec.first_name);
DBMS_OUTPUT.PUT_LINE('Last Name: '||c_rec.last_name);

DBMS_OUTPUT.PUT_LINE('First Name: '||c_rec1.first_name);
DBMS_OUTPUT.PUT_LINE('Last Name: '||c_rec1.last_name);

END;

EXECUTE process_customer1(10);