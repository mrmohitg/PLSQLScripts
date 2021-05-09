CREATE OR REPLACE FUNCTION fetch_sales_table (s_orderid NUMBER)
RETURN sales_table
IS
l_tab sales_table := sales_table();
BEGIN
FOR c IN
(
SELECT sales_date, order_id, product_id, customer_id,total_amount FROM sales WHERE order_id = s_orderid
)
LOOP

l_tab.EXTEND;
l_tab(l_tab.LAST) := sales_row(c.sales_date,c.order_id,c.product_id,c.customer_id,c.total_amount);
END LOOP;
RETURN l_tab;
END;

select * from table (fetch_sales_table(1267));