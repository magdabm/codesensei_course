def convert_to_euro(pln)
  pln * 4.3
end

puts convert_to_euro(5)



def convert_to_euro2(pln, course = 4.03)
  pln * course
end

puts convert_to_euro2(5, 3.98)
