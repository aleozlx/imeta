select id, image, class_label from (
  select id, image, class_label, row_number()
    over (partition by class_label order by random())
    from frame where class_label in (3,8,33)) as foo
  where row_number % 5 = ? and row_number<201;
