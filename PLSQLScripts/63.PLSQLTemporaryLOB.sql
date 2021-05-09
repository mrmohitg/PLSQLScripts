CREATE OR REPLACE DIRECTORY MYIMAGES AS 'C:\Users\Mohit\Downloads\Photos';

DECLARE
blob1 BLOB;
src BFILE := BFILENAME('MYIMAGES','Manju.jpg');
is_temp PLS_INTEGER;

BEGIN


dbms_lob.createtemporary(blob1,TRUE,DBMS_LOB.SESSION);

is_temp := DBMS_LOB.istemporary(blob1);

IF is_temp =1 THEN
    DBMS_OUTPUT.PUT_LINE('BLOB1 is tempraryblob');
ELSE IF is_temp =2 THEN
    DBMS_OUTPUT.PUT_LINE('BLOB1 is not temporary blob');
ELSE
    DBMS_OUTPUT.PUT_LINE('BLOB1 locator is null');
END IF;
END IF;
DBMS_LOB.OPEN(src, DBMS_LOB.LOB_READONLY);
DBMS_LOB.OPEN(blob1, DBMS_LOB.LOB_READWRITE);
DBMS_LOB.LoadFromFile(blob1,src,DBMS_LOB.GETLENGTH(src));
dbms_lob.freetemporary(blob1);
DBMS_LOB.CLOSE(src);
END;

SELECT * from JOB_RESUMES1;