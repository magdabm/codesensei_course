i = 1

while i <= 100
    output = ""
    output += "Fizz" if i % 3 == 0
    output += "Buzz" if i % 5 == 0
    output = i if output == ""
    puts output
    i = i + 1
end

# lub zamiast sprawdzania dzielania przez 15 można 2 osobne warunki
# if i % 3 == 0 && i % 5 == 0
