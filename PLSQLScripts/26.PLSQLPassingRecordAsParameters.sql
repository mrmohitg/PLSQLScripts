CREATE OR REPLACE PROCEDURE process_customer2 
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

show_customer2(c_rec);

END;


CREATE PROCEDURE show_customer2
(
    customer_in IN customer%ROWTYPE
)
IS
BEGIN
DBMS_OUTPUT.PUT_LINE('First Name: '||customer_in.first_name);
DBMS_OUTPUT.PUT_LINE('Last Name: '||customer_in.last_name);
END;


EXECUTE process_customer2(10);