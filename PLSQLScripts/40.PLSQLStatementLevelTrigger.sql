CREATE TRIGGER Customer_Before_Update
BEFORE UPDATE
ON Customer
DECLARE
v_username VARCHAR2(100);
BEGIN

SELECT USER INTO v_username FROM DUAL;

INSERT INTO audit_table (table_name, userid, operation_date, operation)
VALUES
('Customer',v_username,SYSDATE,'Before Update Operation');

END;

Select * from audit_table;

select * from customer;

update customer set first_name = 'PETER' where first_name ='Sonu';