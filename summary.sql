-- Obtain all partitionings of the dataset
SELECT name, labels FROM partitions WHERE summary=true;

-- Count total number of records
SELECT count(*) FROM frame;

-- Count total records in "part1"
SELECT count(*) FROM frame WHERE partitions ? 'part1';

-- Count total active records in "part1"
SELECT count(*) FROM frame where partitions ? 'part1' and partitions ? 'active';
