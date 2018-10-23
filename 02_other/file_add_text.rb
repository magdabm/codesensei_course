# Napisz program, który po każdym uruchomieniu dopisze do pliku logs.txt linię z wybranym przez Ciebie tekstem.

file = File.open("logs.txt", "a") do |f|
  f.puts "To znowu ja!"
end
