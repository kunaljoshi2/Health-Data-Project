-- row counts
SELECT COUNT(*) FROM encounters;
SELECT COUNT(*) FROM organizations;
SELECT COUNT(*) FROM patients;
SELECT COUNT(*) FROM payers;
SELECT COUNT(*) FROM providers;

-- making sure the correct values are in the correct columns
SELECT * FROM encounters LIMIT 10;
SELECT * FROM organizations LIMIT 10;
SELECT * FROM patients LIMIT 10;
SELECT * FROM payers LIMIT 10;
SELECT * FROM providers LIMIT 10; 

-- check to see if there are any patients with NULL values that don't make sense (birthdate, gender, race, etc.)
SELECT * FROM patients WHERE birthdate IS NULL;
SELECT * FROM patients WHERE race IS NULL;
SELECT * FROM patients WHERE ethnicity IS NULL;
SELECT * FROM patients WHERE first IS NULL AND last IS NULL;
SELECT * FROM patients WHERE gender IS NULL; -- -> no NULL throughout

