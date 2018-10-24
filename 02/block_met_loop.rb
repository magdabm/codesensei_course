# Stwórz własną metodę loop

def my_loop_method
  while true
    yield
  end
end

my_loop_method do
  puts "Hi!!!"
end
