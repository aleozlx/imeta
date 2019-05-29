CREATE TABLE partitions (
    id SERIAL PRIMARY KEY,
    name VARCHAR(32) UNIQUE NOT NULL,
    labels VARCHAR[] NOT NULL,
    created_on TIMESTAMP NOT NULL,
    reference TEXT,
    summary BOOLEAN NOT NULL
);

-- Example
-- insert into partitions (name, labels, created_on, summary) values ('traintest', array['train', 'test'], now(), true);

CREATE TABLE frame (
    id SERIAL PRIMARY KEY,
    image TEXT NOT NULL,
    class_label INT,
    ptr INT,
    partitions hstore
);

CREATE INDEX idx_frame on frame USING GIN (partitions);

-- Example
-- insert into frame (image, partitions) values ('a.png', '"train"=>1');
-- insert into frame (image, partitions) values ('b.png', '"train"=>1');
-- insert into frame (image, partitions) values ('c.png', '"test"=>1');
-- select image as train from frame where partitions ? 'train';
