loop do
  puts "Wpisz tekst"
  text = gets.chomp

  if text.length > 3
    next
  else
    puts "Tekst krótszy niż 4 znaki. Koniec."
    exit
  end
end
