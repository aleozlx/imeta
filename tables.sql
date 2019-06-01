CREATE TABLE partitions (
    id SERIAL PRIMARY KEY,
    name VARCHAR(32) UNIQUE NOT NULL,
    labels VARCHAR[] NOT NULL,
    created_on TIMESTAMP NOT NULL,
    reference TEXT,
    summary BOOLEAN NOT NULL
);

CREATE TABLE frame (
    id SERIAL PRIMARY KEY,
    image TEXT NOT NULL,
    class_label INT,
    ptr INT,
    partitions hstore
);

CREATE INDEX idx_frame ON frame USING GIN (partitions);
