CREATE OR REPLACE PACKAGE CustomerPackage
AS

PROCEDURE Add_Customer
(
c_id IN NUMBER,
c_fname IN VARCHAR2,
c_lname IN VARCHAR2,
c_mname IN VARCHAR2,
c_add1 IN VARCHAR2,
c_add2 IN VARCHAR2,
c_city IN VARCHAR2,
c_country IN VARCHAR2,
c_date_added IN DATE,
c_region IN VARCHAR2
);

PROCEDURE Add_Customer1
(
c_id IN NUMBER,
c_fname IN VARCHAR2,
c_lname IN VARCHAR2,
c_mname IN VARCHAR2,
c_add1 IN VARCHAR2,
c_add2 IN VARCHAR2,
c_city IN VARCHAR2,
c_country IN VARCHAR2,
c_date_added IN DATE,
c_region IN VARCHAR2,
total_count OUT NUMBER
);

PROCEDURE Add_Customer2
(
c_id IN OUT NUMBER,
c_fname IN VARCHAR2,
c_lname IN VARCHAR2,
c_mname IN VARCHAR2,
c_add1 IN VARCHAR2,
c_add2 IN VARCHAR2,
c_city IN VARCHAR2,
c_country IN VARCHAR2,
c_date_added IN DATE,
c_region IN VARCHAR2
);

PROCEDURE Get_Customer
(
c_id IN NUMBER
);

FUNCTION find_salescount
(
p_sales_date IN date
) RETURN NUMBER;

END CustomerPackage;
/



