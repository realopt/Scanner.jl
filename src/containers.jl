
function nextarray{T}(s::Scan, ::Type{T}, length::Integer)
	a = Array{T,1}(length)
	for i in 1:length
		check = BoolWrap(false)
		elt = next(s, T, hasnext = check)
		if !check.val
			return Array{T,1}(0)
		else
        	a[i] = elt
		end
    end
    a
end

function nextmatrix{T}(s::Scan, ::Type{T}, nrows::Integer, ncols::Integer; rowmajor=true)
    m = Array{T,2}(nrows, ncols)
    if rowmajor
        for i in 1:nrows
			array = nextarray(s, T, ncols)
			if length(array) == 0
				return Array{T,2}(0,0)
			else
            	m[i,:] = array
			end
        end
    else
        for i in 1:ncols
			array = nextarray(s, T, nrows)
			if length(array) == 0
				return Array{T,2}(0,0)
			else
				m[:,i] = array
			end
        end
    end
    m
end