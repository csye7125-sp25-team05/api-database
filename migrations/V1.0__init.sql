-- V0.1__enable_uuid_extension.sql
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- V1.0__init.sql
CREATE SCHEMA IF NOT EXISTS api;

CREATE TABLE IF NOT EXISTS api.instructor (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL,
    name VARCHAR(255) NOT NULL,
    date_created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS api.course (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    code VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    semesterTerm VARCHAR(255) NOT NULL,
    manufacturer VARCHAR(255),
    creditHours INTEGER NOT NULL CHECK (creditHours BETWEEN 0 AND 4),
    semesterYear INTEGER NOT NULL CHECK (semesterYear BETWEEN 2000 AND 2050),
    date_added TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    date_last_updated TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    owner_user_id UUID NOT NULL,
    instructorId UUID NOT NULL,
    CONSTRAINT fk_instructor FOREIGN KEY (instructorId) REFERENCES api.instructor(id)
);

CREATE TABLE IF NOT EXISTS api.user (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    username VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    account_created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    account_updated TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS api.trace (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL,
    file_name VARCHAR(255) NOT NULL,
    date_created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    bucket_path VARCHAR(255) NOT NULL
);
