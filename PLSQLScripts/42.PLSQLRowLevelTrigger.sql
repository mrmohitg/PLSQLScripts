CREATE TRIGGER Customer_After_Update
AFTER UPDATE
ON Customer
FOR EACH ROW
DECLARE
v_username VARCHAR2(100);
BEGIN

SELECT USER INTO v_username FROM DUAL;

INSERT INTO audit_table (table_name, userid, operation_date, operation)
VALUES
('Customer',v_username,SYSDATE,'Update Operation Row Level');

END;

Select * from audit_table;

select * from customer;

update customer set first_name = 'Mohit' where customer_id=10;