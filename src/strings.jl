import Base.next

function is_space(b::UInt8)
	return !(b >= 0x21 && b <= 0x7E)
end

#function next{T<:AbstractString}(s::Scan, ::Type{T})
function next(s::Scan, ::Type{String}; hasnext = BoolWrap(false))
	b = UInt8(0)
	hasnext.val = false
	charstring = Array{Char, 1}()
	while ( !eof(s.is) && is_space(b))
		b = read(s.is, UInt8)
	end
	while ( !eof(s.is) && !is_space(b))
		push!(charstring, Char(b))
		b = read(s.is, UInt8)
	end
	if length(charstring) != 0
		hasnext.val = true
	end
	exp = convert(String, join(charstring))
end


#
# workspace()
#
# test = 0x36
#
# Char(test)
#
# @show typeof(Char(test))

