def say_hello
  puts "Before block"
  yield
  puts "After block"
end

def my_loop
  while true
    yield # wywołanie bloku metody do .. end
  end
end

def say_goodbye
  puts "Goodbye!"
  if block_given? # sprawdzenie czy do metody przekazano blok
    yield
  else
    puts "No block given"
  end
end

my_loop do
  puts "I'm inside loop"
end

say_hello do
  puts "I'm inside block"
end

say_goodbye
say_goodbye do
  puts "Calling say_goodbye, I'm inside back"
end

def block_with_param
  puts "Before calling block"
  yield 123
  puts "After calling block"
end

block_with_param do |val|
  puts "I'm inside block, got #{val}"
end
