# stwórz własną metodę, która uruchamia blok wprowadzony przez programistę

def my_block_method
  puts "Before yield"
  yield
  yield
  yield
  puts "After yield"
end

puts "Run it!!!"

my_block_method do
  puts "Hello from block"
end

my_block_method do
  puts "Another hello from block"
end

my_block_method do
  10
end
