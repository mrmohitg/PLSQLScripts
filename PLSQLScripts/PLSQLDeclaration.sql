DECLARE 
ordernumber constant number:=101;
orderid number default 100;
customername varchar2(20):='Mohit';
BEGIN
orderid :=101;
--ordernumber:=102; Because it is constant
DBMS_OUTPUT.PUT_LINE('Welcome to PLSQL Course');
DBMS_OUTPUT.PUT_LINE(orderid);
DBMS_OUTPUT.PUT_LINE(ordernumber);
DBMS_OUTPUT.PUT_LINE(customername);
END; 