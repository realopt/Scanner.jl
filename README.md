# Scanner

A default data parser to ease the reading of the input data in the form that they are often encountered in operational research.

[![Build Status](https://travis-ci.org/realopt/Scanner.jl.svg?branch=master)](https://travis-ci.org/realopt/Scanner.jl)
[![codecov](https://codecov.io/gh/realopt/Scanner.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/realopt/Scanner.jl)
# Installation

To install please run the following command on Julia terminal

```
Pkg.clone("git@github.com:realopt/Scanner.jl.git")
```

# Usage example

Assuming the given data file `test1.dat`

```
nbCustomers = 8
nbFactories = 5
capacites = {3; 1; 2; 4; 1}
fixedCosts = {480; 200; 320; 340; 300}
varcots = {24; 74; 31; 51; 84
57; 54; 86; 61; 68
57; 67; 29; 91; 71
54; 54; 65; 82; 94
98; 81; 16; 61; 27
13; 92; 34; 94; 87
54; 72; 41; 12; 78
54; 64; 65; 89; 89}
```

The following script

```julia
using Scanner

scan = Scan(dirname(@__FILE__)* "/test1.dat")
nbcustomers = next(scan, Int)
nbfactories = next(scan, Int)
capacities = nextarray(scan, Int, nbfactories)
fixedcosts = nextarray(scan, Int, nbfactories)
varcosts = nextmatrix(scan, Int, nbcustomers, nbfactories)

@show capacities
@show fixedcosts
@show varcosts
```

outputs

```
capacities = [3,1,2,4,1]
fixedcosts = [480,200,320,340,300]
varcosts = [24 74 31 51 84; 57 54 86 61 68; 57 67 29 91 71; 54 54 65 82 94; 98 81 16 61 27; 13 92 34 94 87; 54 72 41 12 78; 54 64 65 89 89]
```
