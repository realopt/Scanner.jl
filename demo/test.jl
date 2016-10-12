#using Scanner
#workspace()
include("../src/main.jl")
include("../src/numerics.jl")
include("../src/strings.jl")
include("../src/containers.jl")

s = Scan(string(dirname(@__FILE__), "/test.txt"))

@show next(s, Int64)

@show nextarray(s, Int64, 4)

mat = nextmatrix(s, Int64, 2, 3, rowmajor=true)
@show mat
@show typeof(mat)

for i in 1:10
exp = next(s, Float64)
@show exp
end



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

