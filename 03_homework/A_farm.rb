# Zdefiniuj klasy Dog, Cat, Duck, Goose, każda z tych klas powinna dziedziczyć po klasie Animal, która posiada pustą metodę give_sound. Dla każdej z klas nadpisz metodę bazową give_sound, odpowiednio dla dźwięku poszczególnych zwierząt, przykłądowo dla psa wypisz 'woof! woof!'. Zdefiniuj klase Farm, która przyjmuje w metodzie 'initialize' tablicę obiektów Animals. Stwórz w klasie Farm metodę give_sounds, która wywołuje give_sound dla każdego obiektu z tablicy.

class Animal
   def give_sound
   end
end

class Farm
   def initialize(animals)
      @animals = animals
   end

   def give_sounds
      @animals.each do |animal|
         animal.give_sound
      end
   end
end

class Dog < Animal
   def give_sound
      puts "Woof! Woof!"
   end
end

class Cat < Animal
   def give_sound
      puts "Meow! Meooooow!"
   end
end

class Duck < Animal
   def give_sound
      puts "Quack! Quack!"
   end
end

class Goose < Animal
   def give_sound
      puts "Goo! Goo! Goo!"
   end
end

Farm.new(animals = [Dog.new, Cat.new, Duck.new, Goose.new]).give_sounds

# lub:
# animals = [Dog.new, Cat.new, Duck.new, Goose.new]
# farm1 = Farm.new(animals)
# farm1.give_sounds
