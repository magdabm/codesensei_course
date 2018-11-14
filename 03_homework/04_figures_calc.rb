# Napisz program, który ma klasę Figura oraz dziedziczące z niej klasy: Koło, Prostokąt, Kwadrat oraz Trapez. Każda z tych klas powinna posiadać odpowiednio dopasowany do reprezentowanej figury konstruktor (przyjmujący jako parametry niezbędne dane do wykonania obliczeń) oraz bezparametrowe metody do obliczania pola oraz obwodu. Zadbaj o jak najmniejszą ilość powtórzonego kodu.

# !!! działa bez attr

class Figure

   def area
      @area = @area.to_f
      if unit_change   # if po to, żeby wtedy gdy dojdzie do zamiany na ary, nie wyświetlało się '^2'
         puts "The area of #{@name} is: #{@area.round(2)} #{@unit}."
      else
         puts "The area of #{@name} is: #{@area.round(2)} #{@unit}^2."
      end
   end

   def perimeter
      @perimeter = @perimeter.to_f
      puts "The perimeter of #{@name} is: #{@perimeter.round(2)} #{@unit}."
   end

   def unit_change   # metoda dzięki której wynik obliczenia pola będzie zamieniany na ary (jeśli będzie powyżej 100m2)
      if @area > 100 && @unit == "m"
         @area = @area/100
         @unit = "ar"
      else
         false
      end
   end

end

class Square < Figure

   def initialize(side, unit)
      @name = "square"
      @side = side
      @unit = unit
   end
   def area
      @area = @side * @side
      super
   end
   def perimeter
      @perimeter = 4*@side
      super
   end
end

class Rectangle < Figure
   def initialize(sidea, sideb, unit)
      @name = "rectangle"
      @sidea = sidea
      @sideb = sideb
      @unit = unit
   end
   def area
      @area = @sidea * @sideb
      super
   end
   def perimeter
      @perimeter = 2*@sidea + 2*@sideb
      super
   end
end

class Trapezoid < Figure
   def initialize(basea, baseb, height, unit)
      @name = "trapezoid"
      @basea = basea
      @baseb = baseb
      @height = height
      @unit = unit
   end
   def area
      @area = (@basea*@baseb)/2 * @height
      super
   end
end

class Circle < Figure
   def initialize(radius, unit)
      @name = "circle"
      @radius = radius
      @unit = unit
   end
   def area
      @area = Math::PI * @radius**2
      super
   end
   def perimeter
      @perimeter = 2 * Math::PI * @radius
      super
   end
end


Square.new(3, "cm").area
Square.new(3, "cm").perimeter
Square.new(4.45, "cm").area
Square.new(4.45, "cm").perimeter
Square.new(12, "m").area
Square.new(12, "m").perimeter
Square.new(3.66, "km").area
Square.new(3.66, "km").perimeter
puts
Rectangle.new(5, 2, "cm").area
Rectangle.new(5, 2, "cm").perimeter
Rectangle.new(3.33, 4.20, "cm").area
Rectangle.new(3.33, 4.20, "cm").perimeter
Rectangle.new(124, 33, "m").area
Rectangle.new(124, 33, "m").perimeter
Rectangle.new(1.2, 2.2, "km").area
Rectangle.new(1.2, 2.2, "km").perimeter
puts
Trapezoid.new(2.34, 6.66, 2, "cm").area
Trapezoid.new(113, 33, 16, "m").area
puts
Circle.new(5, "cm").area
Circle.new(5, "cm").perimeter
Circle.new(2.25, "cm").area
Circle.new(2.25, "cm").perimeter
Circle.new(100, "m").area
Circle.new(100, "m").perimeter
Circle.new(1.33, "km").area
Circle.new(1.33, "km").perimeter
