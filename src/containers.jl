function nextarray(s::Scan, ::Type{T}, length::Int) where T
	a = Array{T,1}(undef, length)
	for i in 1:length
		check = BoolWrap(false)
		elt = next(s, T, hasnext = check)
		if !check.val
			return Array{T,1}(undef, 0)
		else
        	a[i] = elt
		end
    end
    a
end

function nextmatrix(s::Scan, ::Type{T}, nrows::Int, ncols::Int; rowmajor=true) where T
    m = Array{T,2}(undef, nrows, ncols)
    if rowmajor
        for i in 1:nrows
			array = nextarray(s, T, ncols)
			if length(array) == 0
				return Array{T,2}(undef, 0, 0)
			else
            	m[i,:] = array
			end
        end
    else
        for i in 1:ncols
			array = nextarray(s, T, nrows)
			if length(array) == 0
				return Array{T,2}(undef, 0, 0)
			else
				m[:,i] = array
			end
        end
    end
    m
end

function nextmatrix3D(s::Scan, ::Type{T}, nrows::Int, ncols::Int, thirddim::Int) where T
    m = Array{T,3}(undef, nrows, ncols, thirddim)
    for i in 1:nrows
		matrix = nextmatrix(s, T, ncols, thirddim)
		if length(matrix) == 0
			return Array{T,3}(undef, 0,0,0)
		else
        	m[i,:,:] = matrix
		end
    end
    m
end
