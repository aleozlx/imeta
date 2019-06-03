UPDATE frame SET partitions = partitions || hstore(
  '5fold', chr(floor(random() * 5 + 65)::int));
INSERT INTO partitions (name, labels, created_on, summary, impl_version) values
  ('5fold', array['A','B','C','D','E'], now(), true, 2);
