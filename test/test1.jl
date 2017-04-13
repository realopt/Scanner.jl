using Scanner

scan = Scan(dirname(@__FILE__)* "/test1.dat")
nbcustomers = next(scan, Int)
nbfactories = next(scan, Int)
capacities = nextarray(scan, Int, nbfactories)
fixedcosts = nextarray(scan, Float64, nbfactories)
varcosts = nextmatrix(scan, Int, nbcustomers, nbfactories)

@test capacities == [3,1,2,4,1]
@test fixedcosts == [480.5,200.0,320.0,340.5,300.0]
@test varcosts   == [24 74 31 51 84; 57 54 86 61 68; 57 67 29 -91 71; 54 54 65 82 94; 98 81 16 61 27; 13 92 34 -94 87; 54 72 41 12 78; 54 64 65 89 89]

coords3D = nextmatrix3D(scan, Int, 2, 1, 3)

@test coords3D[1,1,3] == 67
@test coords3D[2,1,2] == 40

coords2D = nextmatrix(scan, Int, 3, 2, rowmajor = false)

@test coords2D[2,1] == 53
@test coords2D[3,2] == 82

@test length(nextmatrix3D(scan, Int, 2, 1, 3)) == 0
@test length(nextmatrix3D(scan, Float64, 2, 1, 3)) == 0
@test length(nextmatrix(scan, Int, 2, 2, rowmajor = false)) == 0




