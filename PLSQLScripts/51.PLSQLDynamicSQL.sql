SELECT * FROM X

BEGIN
EXECUTE IMMEDIATE 'CREATE TABLE X (A NUMBER)';
END;

CREATE PROCEDURE Update_Customer(S_Customer_Id IN NUMBER)
AS
BEGIN
EXECUTE IMMEDIATE 'update sales set total_amount = total_amount * .9 where customer_id = '||S_Customer_Id;
COMMIT;
END;


exec Update_Customer(11);