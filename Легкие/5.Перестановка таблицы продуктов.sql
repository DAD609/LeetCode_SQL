SELECT * 
FROM (
  SELECT product_id, 'store1' store, store1 price FROM Products
  UNION
  SELECT product_id, 'store2' store, store2 price FROM Products
  UNION
  SELECT product_id, 'store3' store, store3 price FROM Products
) p
WHERE price IS NOT NULL;
