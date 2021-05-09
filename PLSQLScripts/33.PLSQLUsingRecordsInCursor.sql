CREATE OR REPLACE PROCEDURE process_customer9
(
c_id IN customer.customer_id%TYPE)
IS
CURSOR c is SELECT first_name,last_name,middle_name,address_line1,address_line2,city,country,date_added,region 
FROM customer
WHERE customer_id = c_id; --declaration of cursor

c_rec c%rowtype;
BEGIN

OPEN c; --opening of cursor

LOOP
fetch c
INTO c_rec;

EXIT WHEN c%notfound;
DBMS_OUTPUT.PUT_LINE('First Name: '||c_rec.first_name);
DBMS_OUTPUT.PUT_LINE('Last Name: '||c_rec.last_name);
DBMS_OUTPUT.PUT_LINE('Middle Name: '||c_rec.middle_name);


END LOOP;
CLOSE c;
END;

execute process_customer9(10);