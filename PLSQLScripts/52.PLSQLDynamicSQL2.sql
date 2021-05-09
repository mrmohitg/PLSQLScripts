CREATE OR REPLACE PROCEDURE Fetch_Sales_Dynamic(s_orderId NUMBER, s_cust_id NUMBER)
AS
sale_rec sales%rowtype;
sql_stmt VARCHAR2(500):='select sales_date, order_id, product_id, customer_id, salesperson_id, quantity,unit_price,sales_amount,tax_amount,total_amount from sales where 1 = 1 ';
BEGIN
IF s_orderid IS NOT NULL THEN
sql_stmt := sql_stmt || 'and order_id = '|| S_orderId;
END IF;

IF s_cust_id IS NOT NULL THEN
sql_stmt := sql_stmt || 'and customer_id = ' || s_cust_id;
END IF;

DBMS_OUTPUT.PUT_LINE(sql_stmt);

EXECUTE IMMEDIATE sql_stmt INTO sale_rec;

DBMS_OUTPUT.PUT_LINE(sale_rec.sales_date);
DBMS_OUTPUT.PUT_LINE(sale_rec.order_id);
DBMS_OUTPUT.PUT_LINE(sale_rec.product_id);
DBMS_OUTPUT.PUT_LINE(sale_rec.customer_id);
DBMS_OUTPUT.PUT_LINE(sale_rec.total_amount);

EXCEPTION
WHEN No_Data_Found THEN
DBMS_OUTPUT.PUT_LINE('No such Order!');
WHEN Too_Many_Rows THEN
DBMS_OUTPUT.PUT_LINE('You got more than 1 row!');
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('Error!');
END;

select * from sales;

exec Fetch_Sales_Dynamic(1268,null);