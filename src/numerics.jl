_0 = 0x30
_9 = 0x39
_MINUS = 0x2D

import Base.next

function next{T<:Integer}(s::Scan, ::Type{T})
    debug = false
    b = UInt8(0)
    num = T(0)
    minus = false
    while ( !eof(s.is))
        b = read(s.is, UInt8)
        debug && println("first loop b $b")
        if (b >= _0 && b <= _9)  ||  b == _MINUS
            if(b == '-')
                minus = true;
                b = read(s.is, UInt8)
                debug && println("minus reread b $b")
            end
            break
        end
    end

    debug && println("between loops b $b")

    while ( !eof(s.is) && b >= _0 && b <= _9 )
        num = 10 * num + b - _0
        b = read(s.is, UInt8)
        debug && println("second loop b $b")
    end
    minus ? -num : num
end

function nextarray{T<:Integer}(s::Scan, ::Type{T}, length::Integer)
	a = Array{T,1}(length)
	for i in 1:length
        a[i] = next(s, T)
    end
    a
end

function nextmatrix{T}(s::Scan, ::Type{T}, nrows::Integer, ncols::Integer; rowmajor=true)
    m = Array{T,2}(nrows, ncols)
    if rowmajor
        for i in 1:nrows
            m[i,:] = nextarray(s, T, ncols)
        end
    else
        for i in 1:ncols
            m[:,i] = nextarray(s, T, nrows)
        end
    end
    m
end

