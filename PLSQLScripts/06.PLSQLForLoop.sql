DECLARE 

CNTR number(2) := 10;
BEGIN

For CNTR in 10..20
loop
DBMS_OUTPUT.PUT_LINE('value of CNTR: '||CNTR);
end loop;

For CNTR in reverse 10..20
loop
DBMS_OUTPUT.PUT_LINE('value of CNTR in reverse: '||CNTR);
end loop;

END;
