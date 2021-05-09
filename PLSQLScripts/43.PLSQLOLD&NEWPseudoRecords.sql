CREATE OR REPLACE TRIGGER Customer_After_Update_Values
AFTER UPDATE
ON Customer
FOR EACH ROW
DECLARE
v_username VARCHAR2(100);
BEGIN

SELECT USER INTO v_username FROM DUAL;

INSERT INTO audit_log (userid, operation_date, b_customerid, a_customerid, b_firstname, a_firstname)
VALUES (v_username,SYSDATE,:OLD.customer_id,:NEW.customer_id,:OLD.first_name,:NEW.first_name);

END;

Select * from audit_log;

select * from customer;

update customer set first_name = 'Mohit K' where first_name='Mohit';