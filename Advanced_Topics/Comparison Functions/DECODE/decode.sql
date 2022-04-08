/*
Allow for adding of if-then-else logic to a query
compres first and second arguments and returns the stated output
*/

-- sample code:
SELECT DECODE(1,2, 'Equal', 'Not Equal');

-- the above is smilar to:
IF 1 = 2 THEN
    RETURN 'Equal';
ELSE
    RETURN 'Not Equal';
END IF;


-- sample code #2:
SELECT DECODE(3,1, 'Equal 1,', 2, 'Equal 2', 'Not Equal 1 or 2');

-- the above logic is similar to the below:
IF 3 = 1 THEN 
    RETURN 'Equal 1';
ELSE IF 3 =2 THEN
    RETURN 'Equal 2';
ELSE
    RETURN 'Not Equal 1 or 2';
END IF;
