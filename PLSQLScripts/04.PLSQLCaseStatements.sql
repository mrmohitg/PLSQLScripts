DECLARE 

total_amount number:=210;
discount number:=0;
BEGIN

CASE
when total_amount > 200
then
discount := total_amount * .2;
when 
total_amount >=100 and total_amount <=200
then
discount := total_amount * .1;
else
discount := total_amount * .05;
end CASE;


DBMS_OUTPUT.PUT_LINE(discount);
END;
