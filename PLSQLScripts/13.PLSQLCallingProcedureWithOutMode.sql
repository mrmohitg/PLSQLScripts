DECLARE
tcount NUMBER(10);
BEGIN
Add_Customer1 (20,'Yashoraj','Gupta','A','D-1/39',NULL,'ALPHA','INDIA',SYSDATE,'WEST',tcount);
DBMS_OUTPUT.PUT_LINE('Total Records: '||tcount);
END;