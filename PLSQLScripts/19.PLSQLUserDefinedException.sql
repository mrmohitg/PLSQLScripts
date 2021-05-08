CREATE OR REPLACE PROCEDURE Get_Customer1
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

execute Get_Customer1(0);

