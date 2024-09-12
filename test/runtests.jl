using DuckDB
using Test

open("data.csv", "w") do io
  println(
    io,
    """x,y
1,2
2,3
3,5
4,8
"""
  )
end

con = DBInterface.connect(DuckDB.DB)
data = DuckDB.execute(con, "SELECT * FROM read_csv('data.csv')")
show(data) # "realize"
x, y = data.tbl.x, data.tbl.y

@test x == [1, 2, 3, 4]
@test y == [2, 3, 5, 8]
