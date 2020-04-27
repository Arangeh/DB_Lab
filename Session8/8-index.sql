EXPLAIN ANALYSE 
select * from mylargetable
where height = 25

-- these are the results for 3 tries
Execution Time: 2052.591 ms(first try)
Execution Time: 2070.286 ms(second try)
Execution Time: 2053.701 ms(third try)
Timing: Generation 1.477 ms, Inlining 182.089 ms, Optimization 87.833 ms, Emission 53.197 ms, Total 324.596 ms

-- took 1 min and 41 secs to prform this query
create index mylargetable_height_idx on mylargetable (height);

-- and now we try the same query again
EXPLAIN ANALYSE 
select * from mylargetable
where height = 25

-- these are the results for 3 tries
Execution Time: 1607.132 ms(first try)
Execution Time: 1611.857 ms(second try)
Execution Time: 1595.625 ms(third try)
Timing: Generation 1.202 ms, Inlining 202.225 ms, Optimization 99.430 ms, Emission 52.265 ms, Total 355.122 ms
