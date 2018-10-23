def divide
  50 / 0
rescue
  puts "Something went wrong"
end

puts divide

# Rozszerz metodę divide tak, by pobierała dwa argumenty - dzielną i dzielnik - a w przypadku, gdy dzielenie się nie powiedzie, zwróci Float::INFINITY.

def divide(dividend, divisor)
  dividend / divisor
rescue
  Float::INFINITY
end

puts divide(3, "e")

# Można określić, jakie wyjątki powinny być obsługiwane:

def divide(dividend, divisor)
  dividend / divisor
rescue ZeroDivisionError
  Float::INFINITY
end

puts divide(3, "e")
