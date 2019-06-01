INSERT INTO frame (image, ptr, partitions) VALUES %s; -- import all data here

INSERT INTO partitions (name, labels, created_on, summary) VALUES
      ('active', array['active'], now(), true),
      ('part', array['part1', 'part2', 'part3'], now(), true);
