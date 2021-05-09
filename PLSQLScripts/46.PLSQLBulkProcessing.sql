CREATE OR REPLACE PROCEDURE Update_Tax (Tax_Rate IN NUMBER)
AS
l_eligible BOOLEAN;
TYPE orderid_type IS TABLE OF sales.order_id%TYPE INDEX BY PLS_INTEGER;
l_order_ids orderid_type;
BEGIN

SELECT DISTINCT order_id BULK COLLECT INTO l_order_ids
FROM sales;

FORALL INDX IN 1 .. l_order_ids.COUNT
UPDATE sales s
SET s.tax_amount = s.total_amount * tax_rate
WHERE s.order_id = l_order_ids(INDX);
END;

exec Update_Tax(.02);

select * from sales;