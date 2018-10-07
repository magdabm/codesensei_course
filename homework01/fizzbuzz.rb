i = 1

while i <= 100

  if i % 15 == 0
    puts "fizzbuzz"
  elsif i % 3 == 0
    puts "fizz"
  elsif i % 5 == 0
    puts "buzz"
  else
    puts i
  end

  i = i + 1

end

# lub zamiast sprawdzania dzielania przez 15 można 2 osobne warunki
# if i % 3 == 0 && i % 5 == 0
