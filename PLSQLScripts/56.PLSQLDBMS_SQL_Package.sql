CREATE OR REPLACE PROCEDURE Delete_Customer (Customer_Id IN NUMBER)
AS
cursor_name INTEGER;
rows_processed INTEGER;
BEGIN

cursor_name := DBMS_SQL.OPEN_CURSOR;

DBMS_SQL.PARSE(cursor_name, 'delete from customer where customer_id = :var1', DBMS_SQL.NATIVE);

DBMS_SQL.BIND_VARIABLE(CURSOR_NAME,':VAR1', customer_id);

rows_processed := DBMS_SQL.EXECUTE(cursor_name);

DBMS_SQL.CLOSE_CURSOR(cursor_name);

EXCEPTION
WHEN OTHERS THEN
DBMS_SQL.CLOSE_CURSOR(cursor_name);
END;

exec Delete_Customer(12);