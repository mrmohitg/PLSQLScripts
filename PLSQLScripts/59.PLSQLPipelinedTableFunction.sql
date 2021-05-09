CREATE OR REPLACE FUNCTION fetch_sales_table1 (s_orderid NUMBER)
RETURN sales_table
PIPELINED
IS
BEGIN
FOR c IN
(
SELECT sales_date, order_id, product_id, customer_id,total_amount FROM sales WHERE order_id = s_orderid
)
LOOP
PIPE ROW(sales_row(c.sales_date,c.order_id,c.product_id,c.customer_id,c.total_amount));
END LOOP;

END;

select * from table (fetch_sales_table1(1267));