CREATE OR REPLACE TRIGGER Customer_After_Update_Values
AFTER UPDATE
OF customer_id
ON Customer
FOR EACH ROW
WHEN (OLD.region = 'SOUTH')
DECLARE
v_username VARCHAR2(10);
BEGIN

SELECT USER INTO v_username FROM DUAL;

INSERT INTO audit_log (userid, operation_date, b_customerid, a_customerid, b_firstname, a_firstname)
VALUES (v_username,SYSDATE,:OLD.customer_id,:NEW.customer_id,:OLD.first_name,:NEW.first_name);

END;

Select * from audit_log;

select * from customer;

update customer set first_name = 'NIKHIL' where first_name='VIPUL';