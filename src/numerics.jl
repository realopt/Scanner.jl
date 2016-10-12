_0 = 0x30
_9 = 0x39
_MINUS = 0x2D

import Base.next

function next{T<:Integer}(s::Scan, ::Type{T}; hasnext = BoolWrap(false))
    debug = false
    b = UInt8(0)
    num = T(0)
    minus = false
	hasnext.val = false
    while ( !eof(s.is))
        b = read(s.is, UInt8)
        debug && println("first loop b $b")
        if (b >= _0 && b <= _9)  ||  b == _MINUS
            if(b == _MINUS)
                minus = true;
                b = read(s.is, UInt8)
                debug && println("minus reread b $b")
            end
            break
        end
    end

    debug && println("between loops b $b")

    while (b >= _0 && b <= _9 )
		hasnext.val = true
        num = 10 * num + b - _0
		if eof(s.is)
			break
		else
        	b = read(s.is, UInt8)
		end
        debug && println("second loop b $b")
    end
    minus ? -num : num
end

#lazy float next to be improved
function next{T<:AbstractFloat}(s::Scan, ::Type{T}; hasnext = BoolWrap(false))
	exp = next(s, String)
	if exp != ""
		hasnext.val = true
		parse(T, exp)
	else
		hasnext.val = false
		T(0)
	end
end


