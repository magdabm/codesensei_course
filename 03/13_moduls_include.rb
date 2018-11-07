class Player
   include Comparable   # ta linijka powoduje wstrzyknięcie do klasy kompletu metod związanych z porównywaniem wartości (sa też inne moduły odpowiedzialne za inne działania), jeżeli implementujemy do klasy używamy extend Comparable
   attr_reader :score
   def initialize(score)
      @score = score
   end
   def <=>(other)
      self.score <=> other.score
   end
end

p1 = Player.new(10)
p2 = Player.new(40)

puts p1 < p2 # zwraca true, tylko dlatego, że na górze metody zawarty jest wpis include Comparable, gdyby go nie było, nie byłoby też metod służących do porównywania wartości np. "<", a użucie tego znaku skutkowałoby błędem że nie ma zdefiniowanej metody

# jeżeli jest include Comaparable to zawsze musi być def <=>(other)...
