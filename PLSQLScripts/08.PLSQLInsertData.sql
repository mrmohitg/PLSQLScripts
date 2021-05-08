DECLARE 

c_id customer.customer_id%TYPE := 13;
c_fname customer.first_name%TYPE := 'JEFF';
c_lname customer.last_name%TYPE := 'AFONSO';
c_mname customer.middle_name%TYPE := 'A';
c_add1 customer.address_line1%TYPE := '23 SUWANEE RD';
c_add2 customer.address_line2%TYPE := 'NULL';
c_city customer.city%TYPE := 'ALPHARETTA';
c_country customer.country%TYPE := 'USA';
c_date_added customer.date_added%TYPE := SYSDATE;
c_region customer.region%TYPE := 'SOUTH';

BEGIN

INSERT INTO customer(customer_id,first_name,last_name,middle_name,address_line1,address_line2,city,country,date_added,region) 
VALUES (c_id,c_fname,c_lname,c_mname,c_add1,c_add2,c_city,c_country,c_date_added,c_region);

COMMIT;

DBMS_OUTPUT.PUT_LINE('Data Successfully Inserted.');

END;
