CREATE OR REPLACE PROCEDURE process_customer10
(
c_id IN customer.customer_id%TYPE)
IS
BEGIN

FOR c_rec IN(SELECT first_name,last_name,middle_name,address_line1,address_line2,city,country,date_added,region 
FROM customer WHERE customer_id = c_id)
LOOP

DBMS_OUTPUT.PUT_LINE('First Name: '||c_rec.first_name);
DBMS_OUTPUT.PUT_LINE('Last Name: '||c_rec.last_name);
DBMS_OUTPUT.PUT_LINE('Middle Name: '||c_rec.middle_name);

END LOOP;
END;

execute process_customer10(10);