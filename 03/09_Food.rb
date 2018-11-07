class Food
   def eat
      puts "Munch, munch, very testy"
   end
end

class Orange < Food
   def blend
      puts "Blending..."
   end
end


# obiekt stworzony w klasie Food nie będzie mógł użyć metody z klasy Orange, ale obiekt z Orange będzie mógł korzystać z metod Food (zasada dziedziczenia, potrzebny znak <)
