DROP TABLE IF EXISTS encounters;
DROP TABLE IF EXISTS patients;
DROP TABLE IF EXISTS providers;
DROP TABLE IF EXISTS payers;
DROP TABLE IF EXISTS organizations;



CREATE TABLE organizations (
    id                  UUID PRIMARY KEY,
    name                TEXT,
    address             TEXT,
    city                TEXT,
    state               TEXT,
    zip                 TEXT,
    lat                 NUMERIC,
    lon                 NUMERIC,
    phone               TEXT,
    revenue             NUMERIC,
    utilization         NUMERIC
);

CREATE TABLE payers (
    id                      UUID PRIMARY KEY,
    name                    TEXT,
    address                 TEXT,
    city                    TEXT,
    state_headquartered     TEXT,
    zip                     TEXT,
    phone                   TEXT,
    amount_covered          NUMERIC,
    amount_uncovered        NUMERIC,
    revenue                 NUMERIC,
    covered_encounters      INTEGER,
    uncovered_encounters    INTEGER,
    covered_medications     INTEGER,
    uncovered_medications   INTEGER,
    covered_procedures      INTEGER,
    uncovered_procedures    INTEGER,
    covered_immunizations   INTEGER,
    uncovered_immunizations INTEGER,
    unique_customers        INTEGER,
    qols_avg                NUMERIC,
    member_months           INTEGER
);

CREATE TABLE providers (
    id                  UUID PRIMARY KEY,
    organization        UUID REFERENCES organizations(id),
    name                TEXT,
    gender              TEXT,
    speciality          TEXT,
    address             TEXT,
    city                TEXT,
    state               TEXT,
    zip                 TEXT,
    lat                 NUMERIC,
    lon                 NUMERIC,
    utilization         NUMERIC
);

CREATE TABLE patients (
    id                   UUID PRIMARY KEY,
    birthdate            DATE NOT NULL,
    deathdate            DATE,
    ssn                  TEXT,
    drivers              TEXT,
    passport             TEXT,
    prefix               TEXT,
    first                TEXT,
    last                 TEXT,
    suffix               TEXT,
    maiden               TEXT,
    marital              TEXT,
    race                 TEXT,
    ethnicity            TEXT,
    gender               TEXT,
    birthplace           TEXT,
    address              TEXT,
    city                 TEXT,
    state                TEXT,
    county               TEXT,
    zip                  TEXT,
    lat                  NUMERIC,
    lon                  NUMERIC,
    healthcare_expenses  NUMERIC,
    healthcare_coverage  NUMERIC
);

CREATE TABLE encounters (
    id                   UUID PRIMARY KEY,
    start                TIMESTAMP NOT NULL,
    stop                 TIMESTAMP,
    patient              UUID REFERENCES patients(id),
    organization         UUID REFERENCES organizations(id),
    provider             UUID REFERENCES providers(id),
    payer                UUID REFERENCES payers(id),
    encounterclass       TEXT,
    code                 TEXT,
    description          TEXT,
    base_encounter_cost  NUMERIC,
    total_claim_cost     NUMERIC,
    payer_coverage       NUMERIC,
    reason_code          TEXT,
    reason_description   TEXT
);

