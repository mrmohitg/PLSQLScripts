CREATE TYPE sales_row AS OBJECT
(
s_date DATE,
s_orderid NUMBER,
s_productid NUMBER,
s_customerid NUMBER,
s_totalamount NUMBER
)

CREATE TYPE sales_table IS TABLE OF sales_row;