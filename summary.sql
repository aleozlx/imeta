-- Obtain all partitionings of the dataset
SELECT name, labels FROM partitions WHERE summary=true;

-- Count total number of records
SELECT count(*) FROM frame;

-- Count total records in "part1"
SELECT count(*) FROM frame WHERE partitions ? 'part1';

-- Count total active records in "part1"
SELECT count(*) FROM frame WHERE partitions ?& array['part1', 'active'];

-- Count total records in "namespace1"->"part1"
SELECT count(*) FROM frame where partitions -> 'namespace1' = 'part1';

-- Count total active records in "namespace1"->"part1"
SELECT count(*) FROM frame WHERE partitions -> 'namespace1' = 'part1' AND partitions ? 'active';

-- Count total active records in "namespace1"
SELECT count(*) FROM frame WHERE partitions ?& array['namespace1', 'active'];

