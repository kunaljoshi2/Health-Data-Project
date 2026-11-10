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

SELECT * FROM patients WHERE deathdate < birthdate; -- no data
SELECT * FROM patients WHERE birthdate > NOW(); -- no data
SELECT * FROM patients WHERE lat > 90 OR lat < -90; -- no data
SELECT * FROM patients WHERE lon > 180 OR lon < -180; -- no data


-- encounters: sanity checks + NULL checks
SELECT * FROM encounters WHERE organization IS NULL;
SELECT * FROM encounters WHERE reason_description IS NULL; -- a lot of NULLs
SELECT * FROM encounters WHERE patient IS NULL; -- no data
SELECT * FROM encounters WHERE stop < start; -- no data
SELECT * FROM encounters WHERE base_encounter_cost < 0 OR total_claim_cost < 0 OR payer_coverage < 0; -- no data
SELECT * FROM encounters WHERE payer_coverage > total_claim_cost; -- no data
SELECT * FROM encounters WHERE start > NOW(); -- no data


-- providers: sanity checks + NULL checks
SELECT * FROM providers WHERE organization IS NULL; -- no data
SELECT * FROM providers WHERE utilization < 0; -- no data
SELECT * FROM providers WHERE lat > 90 OR lat < -90; -- no data
SELECT * FROM providers WHERE lon > 180 OR lon < -180; -- no data

-- organizations: sanity checks + NULL checks
SELECT * FROM organizations WHERE revenue < 0; -- no data
SELECT * FROM organizations WHERE utilization < 0; -- no data
SELECT * FROM organizations WHERE lat > 90 OR lat < -90; -- no data
SELECT * FROM organizations WHERE lon > 180 OR lon < -180; -- no data



-- Category checks

-- patients
SELECT gender, COUNT(*) FROM patients GROUP BY gender;

SELECT first, last, birthdate, COUNT (*) 
FROM patients 
GROUP BY first, last, birthdate
HAVING COUNT(*) > 1; -- no data


SELECT id, COUNT(*) 
FROM patients 
GROUP BY id 
HAVING COUNT(*) > 1; -- no duplicate ids


SELECT race, COUNT(*)
FROM patients
GROUP BY race;










