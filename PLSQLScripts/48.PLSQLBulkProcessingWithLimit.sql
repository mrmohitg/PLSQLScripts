CREATE OR REPLACE PROCEDURE Check_Eligible (p_orderid NUMBER, l_eligible OUT BOOLEAN)
AS
l_total NUMBER;
BEGIN

SELECT SUM(total_amount) INTO l_total FROM sales
WHERE order_id = p_orderid;

IF l_total >= 1000 THEN
    l_eligible := TRUE;

END IF;
END;


CREATE OR REPLACE PROCEDURE Update_Tax2 (Tax_Rate IN NUMBER)
AS
l_eligible BOOLEAN;
TYPE orderid_type IS TABLE OF sales.order_id%TYPE INDEX BY PLS_INTEGER;
l_order_ids orderid_type;
l_eligible_orders orderid_type;
CURSOR Sales_cursor
IS
SELECT DISTINCT order_id FROM sales;
BEGIN

OPEN sales_cursor;


LOOP
FETCH sales_cursor
BULK COLLECT INTO l_order_ids
LIMIT 100;

FOR Indx IN 1 .. l_order_ids.COUNT
LOOP
    check_eligible(l_order_ids(indx), l_eligible);
IF l_eligible
THEN
l_eligible_orders(l_eligible_orders.COUNT +1) :=l_order_ids (indx);
END IF;

END LOOP;

EXIT WHEN l_order_ids.COUNT =0;
END LOOP;

FORALL INDX IN 1 .. l_eligible_orders.COUNT
UPDATE sales s
SET s.tax_amount = s.total_amount * tax_rate
WHERE s.order_id = l_eligible_orders(INDX);

COMMIT;

CLOSE sales_cursor;
END;

exec Update_Tax1(1);

select * from sales;