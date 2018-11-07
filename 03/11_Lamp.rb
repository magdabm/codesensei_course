class Lamp
   def turn_off
      puts "Going dark..."
   end
   def turn_on
      puts "Iluminating..."
   end
end

class BrokenLamp < Lamp
   def turn_on
      puts "Oh, no..."
      super
   end
end

class MusicLamp < Lamp
   def turn_on
      super
      puts "Playing music..."
   end
end

# metoda turn_on znajduje się w dwóch klasach, w zależności w obiekcie z której klasy go wywołamy taki będzie efekt (nadpisywanie metod)
