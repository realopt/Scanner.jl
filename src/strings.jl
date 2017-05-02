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
	while (true)
        if !is_space(b)
		    push!(charstring, Char(b))
        else
            break
        end
        if !eof(s.is)
            b = read(s.is, UInt8)
        else
            break
        end
	end
	if length(charstring) != 0
		hasnext.val = true
	end
	exp = convert(String, join(charstring))
end


function nextline(s::Scan; eol = '\n')
	charstring = Array{Char, 1}()
	b = read(s.is, UInt8)
	while(b != UInt8(eol) && !eof(s.is))
		push!(charstring, Char(b))
		b = read(s.is, UInt8)
	end
	exp = convert(String, join(charstring))
end
