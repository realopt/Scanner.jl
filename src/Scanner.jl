module Scanner

export Scan, nextint


type Scan
  is::IOStream
  #os::IOStream
end

function Scan(filepath::AbstractString)
  s = Scan(open(filepath, true, false, false, false, false))
  s
end

function nextint(s::Scan)
  i = 0
  byte = read(s.is,1)[1]
  while  byte >= 0x30 && byte <= 0x39
    i = 10*i + byte-0x30
    byte = read(s.is,1)[1]
  end
  i
end

end # module
