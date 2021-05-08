--Mehod 1
BEGIN
add_customer (18,'Mohit','Gupta','A','D-1/39',NULL,'ALPHA','INDIA',SYSDATE,'WEST');
END;


--Method 2
BEGIN
add_customer (
c_id => 19,
c_fname =>'Anurag',
c_lname =>'Gupta',
c_mname =>'A',
c_add1 =>'D-1/39',
c_add2 =>NULL,
c_city =>'ALPHA',
c_country =>'INDIA',
c_date_added =>SYSDATE,
c_region =>'WEST'
);
END;

--select * from customer;