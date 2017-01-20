#using Scanner
workspace()
import Base.next

include("../src/main.jl")
include("../src/numerics.jl")
include("../src/strings.jl")
include("../src/containers.jl")

s = Scan(string(dirname(@__FILE__), "/test.txt"))
#s = Scan("/Users/itahiri/.julia/v0.5/NFVOpt.jl/data/instances/abilene_topo.txt")

# @show next(s, Int64)

# a = nextarray(s, Float64, 3)
# while length(a) != 0
#     @show a
#     a = nextarray(s, Float64, 3)
# end

mat = nextmatrix3D(s, Int64, 2, 3, 2)
@show mat[1,1,1]
@show mat[1,1,2]
@show mat[1,2,1]
@show mat[1,2,2]
@show mat[1,3,1]
@show mat[1,3,2]

# @show typeof(mat)
#
# for i in 1:10
# exp = next(s, Float64)
# @show exp
# end

