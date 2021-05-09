CREATE TRIGGER Customer_After_Action
AFTER INSERT OR DELETE OR UPDATE
ON Customer
DECLARE
v_username VARCHAR2(100);
BEGIN

SELECT USER INTO v_username FROM DUAL;

IF INSERTING THEN
INSERT INTO audit_table (table_name, userid, operation_date, operation)
VALUES
('Customer',v_username,SYSDATE,'After Insertion Operation');

ELSE IF DELETING THEN
INSERT INTO audit_table (table_name, userid, operation_date, operation)
VALUES
('Customer',v_username,SYSDATE,'After Deletion Operation');

ELSE IF UPDATING THEN
INSERT INTO audit_table (table_name, userid, operation_date, operation)
VALUES
('Customer',v_username,SYSDATE,'After Update Operation');
END IF;
END IF;
END IF;
END;

Select * from audit_table;

select * from customer;

INSERT INTO customer VALUES(20,'Chhavi','Gupta','R','D Block',NULL,'Delhi','India',SYSDATE,'WEST');
update customer set first_name = 'PETER' where first_name ='Sonu';