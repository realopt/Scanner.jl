using Base.Test

# write your own tests here
include("test1.jl")

@test 1 == 1

@test capacities == [3,1,2,4,1]
@test fixedcosts == [480,200,320,340,300]
@test varcosts   == [24 74 31 51 84; 57 54 86 61 68; 57 67 29 91 71; 54 54 65 82 94; 98 81 16 61 27; 13 92 34 94 87; 54 72 41 12 78; 54 64 65 89 89]