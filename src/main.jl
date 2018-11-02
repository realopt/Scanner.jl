struct Scan
	is::IOStream
	#os::IOStream
end

mutable struct BoolWrap
	val::Bool
end

function Scan(filepath::AbstractString)
	s = Scan(open(filepath, "r"))
	return s
end

function finish_scan(scan::Scan)
    close(scan.is)
end
