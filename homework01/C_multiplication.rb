a = 1
b = 2
c = 3
d = 4
e = 5
f = 6
g = 7
h = 8
j = 9
k = 10

puts "     #{a}    #{b}    #{c}    #{d}    #{e}    #{f}    #{g}    #{h}    #{j}    #{k}"
puts "     ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- "

i = 1

while i <= 10
  a *= i
  b *= i
  c *= i
  d *= i
  e *= i
  f *= i
  g *= i
  h *= i
  j *= i
  k *= i
  puts  "#{i} |   #{a}    #{b}    #{c}    #{d}    #{e}    #{f}    #{g}    #{h}    #{j}    #{k}"
  i += 1
  a = 1
  b = 2
  c = 3
  d = 4
  e = 5
  f = 6
  g = 7
  h = 8
  j = 9
  k = 10
end
