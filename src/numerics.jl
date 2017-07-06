_0 = 0x30
_9 = 0x39
_MINUS = 0x2D

function next{T<:Integer}(s::Scan, ::Type{T}; hasnext = BoolWrap(false))
    debug = false
    b = UInt8(0)
    num = T(0)
    minus = false
	  hasnext.val = false
    while !eof(s.is)
        b = read(s.is, UInt8)
        debug && println("first loop b $b")
        if b == _MINUS
            minus = true
            b = read(s.is, UInt8)
            debug && println("minus reread b $b")
        end
        if b >= _0 && b <= _9
            debug && println("b is a number!")
            break
        end
        minus = false
    end

    debug && println("between loops b $b")

    while b >= _0 && b <= _9
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

# lazy float next. to be improved
function next{T<:AbstractFloat}(s::Scan, ::Type{T}; hasnext = BoolWrap(false))
	exp = next(s, String)
    while true
    	if exp != ""
    		hasnext.val = true
            ret = tryparse(T, exp)
    		if !isnull(ret)
                return get(ret)
            end
    	else
    		hasnext.val = false
    		return T(0)
    	end
        exp = next(s, String)
    end
end
