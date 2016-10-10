#using Scanner
include("../src/main.jl")
include("../src/numerics.jl")

s = Scan(string(dirname(@__FILE__), "/test.txt"))

@show next(s, Int64)

@show nextarray(s, Int64, 4)

mat = nextmatrix(s, Int64, 2, 3, rowmajor=false)
@show mat
@show typeof(mat)


#
# workspace()
#
# function mytest{T<:Integer}(::Type{T})
# 	x= T(3)
# 	@show typeof(x)
# end
#
#
# mytest(Int32)
#
# mytest(Int64)

