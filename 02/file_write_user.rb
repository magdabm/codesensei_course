# Zmień kod tak, by dopisywać do pliku to co wprowadzi użytkownik, zatrzymaj program po wprowadzeniu słowa stop.

data = File.open("secret_data.txt", "a") do |f|

  loop do

    puts "Wprowadź tekst:"
    text = gets.chomp
    break if text == "stop"

    f.puts text

  end

end
