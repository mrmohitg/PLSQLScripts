DECLARE 

c_id number := 10;
c_name varchar2(50);
c_addr varchar2(50);
BEGIN

select first_name, country into c_name, c_addr
from customer
where customer_id = c_id;

DBMS_OUTPUT.PUT_LINE('Name: '||c_name);
DBMS_OUTPUT.PUT_LINE('Country: '||c_addr);

END;