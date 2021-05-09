CREATE OR REPLACE PROCEDURE Insert_Sales_Cur (S_Date DATE)
AS
CURSOR sales_cursor
IS
SELECT sales_date, order_id,product_id,customer_id,salesperson_id,quantity, unit_price, sales_amount, tax_amount, total_amount FROM sales
WHERE sales_date = s_date;

TYPE l_salestable IS TABLE OF sales%rowtype;
l_sales l_salestable;
BEGIN

OPEN sales_cursor;


LOOP
FETCH sales_cursor
BULK COLLECT INTO l_sales
LIMIT 100;

FORALL Indx IN 1 .. l_sales.COUNT SAVE EXCEPTIONS
INSERT INTO sales_2 VALUES l_sales(Indx);

EXIT WHEN sales_cursor%notfound;
END LOOP;

CLOSE sales_cursor;

EXCEPTION
WHEN OTHERS
THEN
IF SQLCODE = -24381 THEN
FOR Indx IN 1 .. SQL%bulk_exceptions.COUNT

LOOP
DBMS_OUTPUT.PUT_LINE(SQL%bulk_exceptions(Indx).error_index);  
DBMS_OUTPUT.PUT_LINE(SQLERRM(-SQL%bulk_exceptions(Indx).error_code));  
END LOOP;
ELSE RAISE;
END IF;
END;

exec Fetch_Sales_Cur('09-feb-2015');

select * from sales_2