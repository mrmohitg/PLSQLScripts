CREATE OR REPLACE PROCEDURE process_customer3 
(
c_id IN customer.customer_id%TYPE)
IS
c_rec customer%rowtype;
BEGIN
SELECT *
INTO c_rec 
FROM customer 
WHERE customer_id = c_id;

show_customer3(c_rec);

END;


CREATE PROCEDURE show_customer3
(
    customer_in IN customer%ROWTYPE
)
IS
BEGIN
INSERT INTO customer VALUES customer_in;
COMMIT;
END;


EXECUTE process_customer3(10);

select * from customer where customer_id=10;