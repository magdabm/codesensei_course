# Stwórz klasę Celcius, która przyjmuję temperaturę jako parametr.
# Zdefiniuj metodę, która zwraca temperaturę w Fahrenheitach. Do konwersji możemy zastosować wzór temperatura*1.8 + 32. Zaokrąglij wynik tak by zwracał zawsze liczby całkowite
# Stwórz metodę to_s, która zwraca łańcuch znaków z temperaturą, przykład: "16 degrees C".

class Celcius
   attr_reader :temp_c, :temp_f

   def initialize(temp_c)
      @temp_c = temp_c.to_i
   end

   def to_Fahrenheit
      @temp_f = (temp_f * 1.8 + 32).to_i
   end

   def to_s
      "#{@temp_c} degrees C"
      "#{@temp_f} degrees F"
   end
end


class Celcius
  attr_accessor :temperature

  def initialize(temperature)
    self.temperature = temperature
  end

  def to_fahrenheit
    ((temperature * 1.8) + 32).round
  end

  def to_s
    "#{temperature} degrees C"
  end
end
