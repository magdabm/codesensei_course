loop do
  user_input = gets.chomp
  puts user_input.length

  if user_input.length == 3
    puts "Dziękuję, jest ok."
    break
  else
    puts "Liczba liter we wprowadzonym tekście nie jest równa 3."
  end
end
