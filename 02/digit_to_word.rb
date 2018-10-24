
def digit_to_word(digit)

    digit = "zero" if digit == 0
    digit = "one" if digit == 1
    digit = "two" if digit == 2
    digit = "three" if digit == 3
    digit = "four" if digit == 4
    digit = "five" if digit == 5
    digit = "six" if digit == 6
    digit = "seven" if digit == 7
    digit = "eight" if digit == 8
    digit = "nine" if digit == 9

    digit
end

puts digit_to_word(9)

puts digit_to_word(20)
