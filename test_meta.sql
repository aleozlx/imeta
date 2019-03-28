CREATE TABLE partitioning (
    id SERIAL PRIMARY KEY,
    name VARCHAR(32) UNIQUE NOT NULL,
    partitions VARCHAR[] NOT NULL,
    created_on TIMESTAMP NOT NULL,
    summary BOOLEAN NOT NULL
);

CREATE TABLE frame (
    id SERIAL PRIMARY KEY,
    image TEXT NOT NULL,
    label INT,
    active_idx INT,
    partitions VARCHAR[] NOT NULL
);

CREATE INDEX idx_frame on frame USING GIN (partitions);
