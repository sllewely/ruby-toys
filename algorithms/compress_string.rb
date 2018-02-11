# Compress String
# return a compressed representation of a given string
# where sequence of characters are counted, so "aaaaabbbcccdddoooiipifaopeffffff" would become "a5b3c3d3o3i2p1i1f1a1o1p1e1f6"
# but return the original string if it is shorter than the compressed version

def compress(str)
  compressed_str = str.chars.chunk { |c| c }.map { |c, cs| "#{c}#{cs.size}" }.join("")
  compressed_str.size < str.size ? compressed_str : str
end
