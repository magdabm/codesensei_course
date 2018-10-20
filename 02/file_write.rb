data = File.open("secret_data.txt", "w+") do |f|
  f.puts 42
end

#zamiast "w+" można użyć "a" który dopisuje tekst do istniejącego pliku ("w+" zawsze nadpisuje)
