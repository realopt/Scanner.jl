using Scanner

scan = Scan(dirname(@__FILE__)* "/test2.dat")
number100 = next(scan, Int)
nl0 = nextline(scan)
number101 = next(scan, Int)
nl1 = nextline(scan)
nl2 = nextline(scan)
number102 = next(scan, Int)
nl3 = nextline(scan)
number103 = next(scan, Int)
nl4 = nextline(scan)

@test number100 == 100
@test number101 == 101
@test number102 == 102
@test number103 == 103
@test nl0 == "ignore 1 li2ne !2"
@test nl1 == "and anothe21r character"
@test nl2 == "ign3ore lin2e 1!"
@test nl3 == "i2gn0ore line4 !"
@test nl4 == "ignore4li33line 5!6"
