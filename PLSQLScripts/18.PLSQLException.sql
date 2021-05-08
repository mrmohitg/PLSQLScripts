CREATE OR REPLACE PROCEDURE Get_Customer
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

execute Get_Customer(10);
execute Get_Customer(10898);
