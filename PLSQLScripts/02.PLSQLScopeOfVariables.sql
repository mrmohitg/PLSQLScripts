DECLARE 
--Global Variable
num1 number:=101;

BEGIN
DBMS_OUTPUT.PUT_LINE('Outer variable num1:'|| num1);

DECLARE
--Local Variable
num2 number:=102;
BEGIN
DBMS_OUTPUT.PUT_LINE('Outer variable num1:'|| num1);
DBMS_OUTPUT.PUT_LINE('Inner variable num2:'|| num1);

END;
END; 