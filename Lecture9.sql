-- Lecture 9: Complete SQL in 1 VIDEO


-- THIS FILE CONSISTS OF ALL DML COMMANDS (THAT ARE USED TO MODIFY THE TABLE)

CREATE DATABASE IF NOT EXISTS DML;
USE DML;

-- CREATED A TABLE
CREATE TABLE IF NOT EXISTS Workers (
workers_id INT NOT NULL PRIMARY KEY,
firstName VARCHAR(255),
lastName VARCHAR(255),
wage DOUBLE
);

-- Here we passed only two arguments 234 and Rahul, Baaki sab me automatically null set hojaiga.
REPLACE INTO Workers
VALUES('234', 'Rahul',"Tiwari", "93"); 

-- Here we passed only all arguments
INSERT INTO Workers
VALUES('231','Ajay', 'Karan','43'),
('434','Mukesh','Dubey','43'); 


-- UPDATE keyword, This command will updated the name and wage of the row whose workers_id is 246
UPDATE Workers SET lastName = 'Hritik', wage='200000' WHERE workers_id='234';

-- DELETE command, It will delete the row whose id = 234
DELETE FROM Workers WHERE workers_id='234';

SELECT * FROM Workers;

-- REPLACE Keyword is different from UPDATE keyword, Please check the notes for detailed view
REPLACE INTO Workers(workers_id, firstName)
VALUES (434, 'Santosh');   -- Iske Baad 434 Waale row me sara values NULL hojaiga, sirf firstName ko chodh kr becz hum yaha REPLACE ke saath firstName ko hi rakhe hai.




-- Lets Try 'On Delete Cascade' & 'On Delete Null'



CREATE TABLE IF NOT EXISTS job
( job_id INT NOT NULL PRIMARY KEY,
  workers_id INT,
  
   -- <FOREIGN KEY (workers_id) REFERENCES Workers (workers_id) ON DELETE CASCADE>  <- This command will Turn on the 'ON DELETE CASCADE' property. 
   -- <FOREIGN KEY (workers_id) REFERENCES Workers (workers_id) ON DELETE SET NULL>  <- This command will Turn on the 'ON DELETE SET NULL' property. 
  FOREIGN KEY (workers_id) REFERENCES Workers (workers_id) ON DELETE CASCADE, 
  job_name VARCHAR(255)
);

INSERT INTO job (job_id, workers_id, job_name)
VALUES ('3244', '246', 'Subcontractor');

-- Lets try to delete on row from Workers table if 'ON DELETE CASCADE' is 'ON' 
DELETE FROM Workers WHERE workers_id='246';


SELECT * FROM Workers;

ALTER TABLE Workers ADD work_hours INT;

ALTER TABLE Workers DROP work_hours;

ALTER TABLE Workers add work_hours DOUBLE DEFAULT 1.5;

ALTER TABLE Workers RENAME  TO work_duration;














