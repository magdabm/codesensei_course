class Blender
  def blend(fruit, vegetable)
    puts "Making juice from #{fruit} and #{vegetable}"
  end
end

# wywołanie bez tworzenia obiektu na stałe - zamiast konkretnego obiektu jest Blender.new

puts Blender.new.blend("banana","cucumber")

# lub najpierw tworzymy nowy obiekt i to na nim wywołujemy metodę

juice = Blender.new
puts juice.blend("apple","tomato")


# !!!! Dodać keywords (nie ma znaczenia kolejność argumentów)
