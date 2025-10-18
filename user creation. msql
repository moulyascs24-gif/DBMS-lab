
USE newdatabase ;
CREATE TABLE student_info (
stdid numeric(5), stdname varchar(20), dob date,
doj date, fee numeric(5), gender CHAR );
DESC student_info;
INSERT INTO student_info ( stdid, stdname, dob, doj, fee, gender)

VALUES (1, 'SHAREEF', '2001-01-10', '2001-10-05', 10000, 'M');

INSERT INTO student_info ( stdid, stdname, dob, doj, fee, gender)
VALUES (2, 'NADEEM', '2019-11-3', '2001-10-26', 11000, 'M');
SELECT * FROM student_info;
ALTER TABLE student_info ADD PHONE_NO NUmeric(10);
ALTER TABLE student_info
RENAME COLUMN PHONE_NO TO STUDENT_NO;
ALTER TABLE student_info RENAME TO STUDENT_INFO;

ALTER TABLE student_info DROP COLUMN gender;
DELETE FROM student_info WHERE STDID=2;



