--Method 1
select find_salescount(to_date('01-jan-2015','dd-mon-yyyy')) from dual;

--Method 2
DECLARE
SCOUNT NUMBER:=0;
BEGIN
SCOUNT := find_salescount(to_date('01-jan-2015','dd-mon-yyyy'));
DBMS_OUTPUT.PUT_LINE(SCOUNT);
END;