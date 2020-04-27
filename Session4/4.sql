Q1)
CREATE OR REPLACE FUNCTION totalRecord (phoneNo varchar(11))  
RETURNS varchar(50) AS $total$  
declare  
    total varchar(50);  
BEGIN  

	
	IF phoneNo like '09%' THEN
 	  total := 'mobile phone number';
	ELSIF phoneNo like '021%' THEN
	    total := concat('citycode =','021', 'last 8 digits =',substring(phoneNo,4,8),'city =Tehran');
	ELSIF phoneNo like '031%' THEN
	    total := concat('citycode =','031', 'last 8 digits =',substring(phoneNo,4,8),'city =esfahan');

ELSE
   total := 'invalid phone number';
END IF;

   RETURN total;  
END;  
$total$ LANGUAGE plpgsql;  

select totalRecord('02145678987');

***********************************************************
Q3)


CREATE TABLE aval (
    empname           varchar(50)  NOT NULL,
    salary            varchar(50) NOT NULL
);

CREATE TABLE logeaval(
    operation         varchar(50)   NOT NULL,
    stamp             varchar(50) NOT NULL,
    userid            varchar(50)     NOT NULL,
    empname           varchar(50)    NOT NULL,
    salary varchar(50) NOT NULL
);

CREATE OR REPLACE FUNCTION process_logeaval() RETURNS TRIGGER AS $logeaval$
    BEGIN

        IF (TG_OP = 'DELETE') THEN
            INSERT INTO logeaval SELECT 'D', now(), user, OLD.*;
            RETURN OLD;
        ELSIF (TG_OP = 'UPDATE') THEN
            INSERT INTO logeaval SELECT 'U', now(), user, NEW.*;
            RETURN NEW;
        ELSIF (TG_OP = 'INSERT') THEN
            INSERT INTO logeaval SELECT 'I', now(), user, NEW.*;
            RETURN NEW;
        END IF;
        RETURN NULL; 
    END;
$logeaval$ LANGUAGE plpgsql;

CREATE TRIGGER emp_audit
AFTER INSERT OR UPDATE OR DELETE ON aval
    FOR EACH ROW EXECUTE PROCEDURE process_logeaval();
    
INSERT INTO aval
VALUES('test', 'mest');

SELECT * FROM logeaval;

DELETE FROM aval
WHERE salary='mest';

SELECT * FROM logeaval;