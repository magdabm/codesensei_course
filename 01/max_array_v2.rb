array = [1, 7, 11, 12, 87, 12, 5, 6]

i = 0
max = array[i]

while i < array.count
  if max < array[i]
    max = array[i]
  end
  i += 1
end

puts "Maksymalna liczba w tablicy to: #{max}"
