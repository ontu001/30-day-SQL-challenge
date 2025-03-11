--Dataset
-- Create the table
CREATE TABLE brands 
(
    brand1      VARCHAR(20),
    brand2      VARCHAR(20),
    year        INT,
    custom1     INT,
    custom2     INT,
    custom3     INT,
    custom4     INT
);

-- Insert data Inside table
INSERT INTO brands VALUES ('apple', 'samsung', 2020, 1, 2, 1, 2);
INSERT INTO brands VALUES ('samsung', 'apple', 2020, 1, 2, 1, 2);
INSERT INTO brands VALUES ('apple', 'samsung', 2021, 1, 2, 5, 3);
INSERT INTO brands VALUES ('samsung', 'apple', 2021, 5, 3, 1, 2);
INSERT INTO brands VALUES ('google', NULL, 2020, 5, 9, NULL, NULL);
INSERT INTO brands VALUES ('oneplus', 'nothing', 2020, 5, 9, 6, 3);

SELECT * FROM brands;



/* Problem Statement:
- For pairs of brands in the same year (e.g. apple/samsung/2020 and samsung/apple/2020) 
    - if custom1 = custom3 and custom2 = custom4 : then keep only one pair

- For pairs of brands in the same year 
    - if custom1 != custom3 OR custom2 != custom4 : then keep both pairs

- For brands that do not have pairs in the same year : keep those rows as well
*/


-- Solution

SELECT DISTINCT
    b1.brand1,
    b1.brand2,
    b1.year,
    b1.custom1,
    b1.custom2,
    b1.custom3,
    b1.custom4
FROM brands b1
LEFT JOIN brands b2
    ON b1.brand1 = b2.brand2
    AND b1.brand2 = b2.brand1
    AND b1.year = b2.year
WHERE (b1.custom1 = b1.custom3 AND b1.custom2 = b1.custom4 AND b1.brand1 < b1.brand2)
   OR (b1.custom1 != b1.custom3 OR b1.custom2 != b1.custom4)
   OR b2.brand1 IS NULL
ORDER BY b1.year, b1.brand1, b1.brand2;


