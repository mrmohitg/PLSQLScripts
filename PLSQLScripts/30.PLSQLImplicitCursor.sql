CREATE OR REPLACE PROCEDURE process_customer6 
(
c_id IN customer.customer_id%TYPE)
IS
TYPE customer_rec IS RECORD
(
FIRST_NAME VARCHAR2(50),
LAST_NAME VARCHAR2(50)
);

c_rec customer_rec;
total_rows number;
BEGIN
SELECT FIRST_NAME, LAST_NAME
INTO c_rec 
FROM customer 
WHERE customer_id = c_id;

IF sql%found THEN
    total_rows := sql%rowcount;
    DBMS_OUTPUT.PUT_LINE(total_rows || ' customers selected.');
END IF;
DBMS_OUTPUT.PUT_LINE('First Name: '|| c_rec.first_name);
DBMS_OUTPUT.PUT_LINE('Last Name: '|| c_rec.last_name);

END;


EXECUTE process_customer6(12);

select * from customer where customer_id=12;

