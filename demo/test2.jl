using Scanner

input = Scan(string(dirname(@__FILE__), "/TTM540_001.dat"))

t = next(input, Int)

n = next(input, Int)

Capacity = nextarray(input, Int, t)

Demand = nextmatrix(input, Int, n, t)

setuptime = nextmatrix(input, Int, n, t)

varcons = nextmatrix(input, Int, n, t)

setupcost = nextmatrix(input, Int, n, t)

VarCost = nextmatrix(input, Int, n, t)

ShortageCost = nextmatrix(input, Float64, n, t)

HoldCost = nextmatrix(input, Float64, n, t)













