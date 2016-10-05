type Scan
  is::IOStream
  #os::IOStream
end

function Scan(filepath::AbstractString)
  s = Scan(open(filepath, true, false, false, false, false))
  s
end
