CREATE OR REPLACE PROCEDURE Fetch_Sales_Cur (S_Date DATE)
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

FOR Indx IN 1 .. l_sales.COUNT
LOOP
DBMS_OUTPUT.PUT_LINE(l_sales(Indx).sales_date);  
DBMS_OUTPUT.PUT_LINE(l_sales(Indx).order_id);  
DBMS_OUTPUT.PUT_LINE(l_sales(Indx).product_id);  
DBMS_OUTPUT.PUT_LINE(l_sales(Indx).customer_id);  
DBMS_OUTPUT.PUT_LINE(l_sales(Indx).salesperson_id);  
DBMS_OUTPUT.PUT_LINE(l_sales(Indx).quantity);  
DBMS_OUTPUT.PUT_LINE(l_sales(Indx).unit_price);  
DBMS_OUTPUT.PUT_LINE(l_sales(Indx).sales_amount);  
DBMS_OUTPUT.PUT_LINE(l_sales(Indx).tax_amount);  
DBMS_OUTPUT.PUT_LINE(l_sales(Indx).total_amount);  

END LOOP;

EXIT WHEN sales_cursor%notfound;
END LOOP;

CLOSE sales_cursor;
END;

exec Fetch_Sales_Cur('09-feb-2015');