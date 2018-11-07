class Box
  def initialize
  end
end

puts Box.new

# metoda .initialize zawsze uruchamia się razem z .new (jest wbudowana), więc używając metody .new, jeśli dodatkowo zdefiniowaliśmy wcześniej .initialize to wtedy zobaczymy jej efekt

class Box
  def initialize
    puts "Empty box"
  end
end

puts Box.new
