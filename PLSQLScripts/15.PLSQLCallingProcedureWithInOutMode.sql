DECLARE
tcount NUMBER(10) :=45;
BEGIN
Add_Customer2 (tcount,'Yashoraj','Gupta','A','D-1/39',NULL,'ALPHA','INDIA',SYSDATE,'WEST');
DBMS_OUTPUT.PUT_LINE('Total Records: '||tcount);
END;