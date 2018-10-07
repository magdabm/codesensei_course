loop do

  puts "Wpisz tekst:"
  text = gets.chomp
  puts "Twój tekst ma: #{text.length} znaków."
  if text.length < 3
    break
  end
end
