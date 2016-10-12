type Scan
	is::IOStream
	#os::IOStream
end

type BoolWrap
	val::Bool
end


function Scan(filepath::AbstractString)
	s = Scan(open(filepath, true, false, false, false, false))
	s
end
