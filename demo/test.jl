using Scanner
# include("../src/main.jl")
# include("../src/numerics.jl")

s = Scan(string(dirname(@__FILE__), "/test.txt"))


@show nextint64(s)

@show nextarrayint64(s, 4)

mat = nextmatrixint64(s, 2, 3, rowmajor=false)
@show mat
@show typeof(mat)








