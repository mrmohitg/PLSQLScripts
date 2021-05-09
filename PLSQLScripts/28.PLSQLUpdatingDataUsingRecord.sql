CREATE OR REPLACE PROCEDURE process_customer4 
(
c_id IN customer.customer_id%TYPE)
IS
c_rec customer%rowtype;
BEGIN
SELECT *
INTO c_rec 
FROM customer 
WHERE customer_id = c_id;

c_rec.first_name := 'Sonu';

show_customer4(c_rec);

END;


CREATE PROCEDURE show_customer4
(
    customer_in IN customer%ROWTYPE
)
IS
BEGIN
UPDATE customer set row =  customer_in where customer_id = customer_in.customer_id;
COMMIT;
END;


EXECUTE process_customer4(11);

select * from customer where customer_id=11;