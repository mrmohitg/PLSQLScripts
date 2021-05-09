CREATE OR REPLACE PROCEDURE Update_Tax3 (Tax_Rate IN NUMBER)
AS
l_eligible BOOLEAN;
TYPE orderid_type IS TABLE OF sales.order_id%TYPE INDEX BY PLS_INTEGER;
l_order_ids orderid_type;
l_eligible_orders orderid_type;
l_sql VARCHAR2(100) := 'SELECT DISTINCT order_id FROM sales';
BEGIN

EXECUTE IMMEDIATE l_sql BULK COLLECT INTO l_order_ids;

FOR indx IN 1 .. l_order_ids.COUNT
LOOP
check_eligible(l_order_ids(indx), l_eligible);
IF l_eligible
THEN
l_eligible_orders(l_eligible_orders.COUNT +1) :=l_order_ids (indx);
END IF;

END LOOP;

FORALL INDX IN 1 .. l_eligible_orders.COUNT
UPDATE sales s
SET s.tax_amount = s.total_amount * tax_rate
WHERE s.order_id = l_eligible_orders(INDX);

COMMIT;
END;