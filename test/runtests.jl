include("../src/Scanner.jl")

using Test

# write your own tests here
@testset "Tests 1" begin
    include("test1.jl")
end
@testset "Tests 2" begin
    include("test2.jl")
end
