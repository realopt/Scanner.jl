using Scanner

scan = Scan(dirname(@__FILE__)* "/test1.dat")
nbcustomers = next(scan, Int)
nbfactories = next(scan, Int)
capacities = nextarray(scan, Int, nbfactories)
fixedcosts = nextarray(scan, Int, nbfactories)
varcosts = nextmatrix(scan, Int, nbcustomers, nbfactories)
