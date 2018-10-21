# Napisz program, który wyświetli tabliczkę mnożenia 10x10.


print "   "

(1..10).each do |i|
 print ("%-3d " % (i))
end
​
print "\n  "

(1..10).each do |i|
 print " "
 print "-"* 4
end

print "\n"
​
(1..10).each do |j|
  print ("%-3d| " % (j))
  (1..10).each do |i|
  print ("%-3d " % (i*j))
  end
print "\n"
end
print "\n"
