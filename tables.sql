CREATE EXTENSION hstore;

CREATE TABLE partitions ( -- consider renaming to partition_ns
    id SERIAL PRIMARY KEY,
    name VARCHAR(32) UNIQUE NOT NULL, -- name of the partition namespace
    labels VARCHAR[] NOT NULL, -- names of the partitions that exist in the namespace
    created_on TIMESTAMP NOT NULL,
    reference TEXT, -- reference to the associated data shard
    summary BOOLEAN NOT NULL, -- required to show in the summary
    impl_version INT -- data structure impl: v1: hstore tagging {"part" => 1}, v2: hstore enum {"namespace"=>"part"}
);

CREATE TABLE frame (
    id SERIAL PRIMARY KEY,
    image TEXT NOT NULL, -- image file name: use ";" to separate multiple associated images
    class_label INT, -- class label: may use binary one hot encoding in multi-label case
    ptr INT, -- index into associated data (perhaps in h5 files)
    partitions hstore -- denormalized partitioning information
);

CREATE INDEX idx_frame ON frame USING GIN (partitions);

-- Optional table(s)

CREATE TABLE class_label (
    id SERIAL PRIMARY KEY,
    label_namespace TEXT, -- group related labels
    label_name VARCHAR(32) NOT NULL, -- name of the label
    label_name_long TEXT, -- long name of the label
    label_id INT NOT NULL -- label id
);
