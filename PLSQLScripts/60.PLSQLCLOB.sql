CREATE TABLE JOB_RESUMES
(
resume_id NUMBER,
first_name VARCHAR2(10),
last_name VARCHAR2(10),
resumes CLOB
);

INSERT INTO JOB_RESUMES VALUES (1,'Mohit','Gupta','Java Developer');

SELECT length(resumes), dbms_lob.getlength(resumes) from job_resumes

SELECT substr(resumes,1,30), dbms_lob.substr(resumes,30,1) from JOB_RESUMES