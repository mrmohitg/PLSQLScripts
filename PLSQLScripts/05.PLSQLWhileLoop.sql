DECLARE 

CNTR number(2) := 10;
BEGIN

while CNTR < 20
loop
DBMS_OUTPUT.PUT_LINE('value of CNTR: '||CNTR);
CNTR := CNTR + 1;
end loop;

END;