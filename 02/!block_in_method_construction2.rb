# Stwórz własną metodę, która ruruchamia blok wprowadzony przez programistę

def my_block_method
  puts  "Before yield"
  yield_result = yield
  puts "After yield"

  puts "Yield output"
  puts yield_result
end

puts "Run it!"

my_block_method do
  puts "Hellow from block"
end  # po wywołaniu metody tym blokiem w konsoli na końcu będzie pusta linijka bo puts zawsze zwraca nil a wym przypadku nic nie zostanie przypisane do yield_result

my_block_method do
  puts "Another hello from block"
  :result  # wyświetli sie dlatego że jest w ostatniej linijce
end

my_block_method do
  10
end

# co się stanie jak nie będzie w kodzie "my_block_method do..." ? - nie będzie działał bo po zawarciu yield w metodzie musi być blok zdefiniowany
