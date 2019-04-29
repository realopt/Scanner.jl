scan = Scanner.Scan(dirname(@__FILE__)* "/test2.dat")
number100 = Scanner.next(scan, Int)
nl0 = Scanner.nextline(scan)
number101 = Scanner.next(scan, Int)
nl1 = Scanner.nextline(scan)
nl2 = Scanner.nextline(scan)
number102 = Scanner.next(scan, Int)
nl3 = Scanner.nextline(scan)
number103 = Scanner.next(scan, Int)
nl4 = Scanner.nextline(scan)

@test number100 == 100
@test number101 == 101
@test number102 == 102
@test number103 == 103
@test nl0 == "ignore 1 li2ne !2"
@test nl1 == "and anothe21r character"
@test nl2 == "ign3ore lin2e 1!"
@test nl3 == "i2gn0ore line4 !"
@test nl4 == "ignore4li33line 5!6"
