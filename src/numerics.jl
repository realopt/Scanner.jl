_0 = 0x30
_9 = 0x39
_MINUS = 0x2D

function nextint64(s::Scan)
    debug = false
    b = UInt8(0)
    num = Int64(0)
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

function nextarrayint64(s::Scan, length::Integer)
	a = Array{Int64,1}(length)
	for i in 1:length
        a[i] = nextint64(s)
    end
    a
end

function nextmatrixint64(s::Scan, nrows::Integer, ncols::Integer; rowmajor=true)
    m = Array{Int64,2}(nrows, ncols)
    if rowmajor
        for i in 1:nrows
            m[i,:] = nextarrayint64(s, ncols)
        end
    else
        for i in 1:ncols
            m[:,i] = nextarrayint64(s, nrows)
        end
    end
    m
end

