# Stwórz własną metodę która uruchomi wprwoadzony przez użytkownika block i poinformuje go, że jest przed i po uruchimieniu

def my_block_case
  if block_given?
    puts "Before"
    yield
    puts "After"
  else
    puts "You forgot"
  end
end

my_block_case

my_block_case do
  puts "From block"
end

# lub

def user_block
  puts "Before"
  yield
  puts "After"
end

user_block do
  puts "From block"
end
