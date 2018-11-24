# battleship 1, cruiser 2, destroyer 3, submarine 4

require 'matrix'

class Matrix   # klasa i metoda potrzebna do zmiany wartości wewnątrz macierzy
   def []=(row, column, value)
      @rows[row][column] = value
   end
end

class Ships
attr_accessor :ocean

   def initialize
      self.ocean = Matrix.build(10,10) { |row, col| row * 10 + col + 1 }
   end

   def make_board_to_play_ships
      place_and_mark_battleship
      place_and_mark_cruiser
      place_and_mark_destroyer
      place_and_mark_submarine
   end

   def look_on_board   # metoda pomocnicza żeby zobaczyć jak wygląda plansza :)
      ocean.to_a.each do |row|
         puts row.inspect
      end
   end

   private
   def place_and_mark_battleship
      place_battleship
      mark_battleship_on_ocean
      mark_waves_around_battleship
   end

   def place_and_mark_cruiser
      place_cruiser
      mark_cruiser_on_ocean
      mark_waves_around_cruiser
      place_cruiser
      mark_cruiser_on_ocean
      mark_waves_around_cruiser
   end

   def place_and_mark_destroyer
      place_destroyer
      mark_destroyer_on_ocean
      mark_waves_around_destroyer
      place_destroyer
      mark_destroyer_on_ocean
      mark_waves_around_destroyer
      place_destroyer
      mark_destroyer_on_ocean
      mark_waves_around_destroyer
   end

   def place_and_mark_submarine
      place_submarine
      mark_submarine_on_ocean
      mark_waves_around_submarine
      place_submarine
      mark_submarine_on_ocean
      mark_waves_around_submarine
      place_submarine
      mark_submarine_on_ocean
      mark_waves_around_submarine
      place_submarine
      mark_submarine_on_ocean
      mark_waves_around_submarine
   end

   def horizontal_or_vertical   # najpierw losuję czy statek będzie w pionie czy w poziomie
      horv = ['vertical', 'horizontal']
      hov = horv.sample
      if hov == 'horizontal'
         return true
      else
         return false
      end
   end

   def place_battleship   # 4-masztowiec
      if horizontal_or_vertical   # jeśli wylosowana opcja poziom
         @b1 = [x = (0..9).to_a.sample, y = (0..9).to_a.sample]
         if ocean[@b1[0], @b1[1] + 3] != nil   # sprawdzenie czy ostatni element statku nie znajdzie się poza macierzą
            @b2 = [x, y+1]
            @b3 = [x, y+2]
            @b4 = [x, y+3]
            @battleship = [@b1, @b2, @b3, @b4]
         else
            place_battleship   # wywołanie metody ponownie (jeśli wybrany zły punkt początkowy)
         end
      else
         @b1 = [x = (0..9).to_a.sample, y = (0..9).to_a.sample]   # jeśli wylosowana opcja pion
         if ocean[@b1[0] + 3, @b1[1]] != nil # sprawdzenie czy ostatni element statku nie znajdzie się poza macierzą
            @b2 = [x+1, y]
            @b3 = [x+2, y]
            @b4 = [x+3, y]
            @battleship = [@b1, @b2, @b3, @b4]
         else
            place_battleship   # wywołanie metody ponownie (jeśli wybrany zły punkt początkowy)
         end
      end
      @battleship.inspect
   end

   def place_cruiser   # 3-masztowiec
      if horizontal_or_vertical   # jeśli wylosowana opcja poziom
         @c1 = [x = (0..9).to_a.sample, y = (0..9).to_a.sample]
         if ocean[@c1[0], @c1[1] + 2] != nil &&
            ocean[@c1[0], @c1[1] + 2] != '.' &&
            ocean[@c1[0], @c1[1] + 2] != '#' &&
            ocean[@c1[0], @c1[1]] != '.' &&
            ocean[@c1[0], @c1[1]] != '#'   # sprawdzenie czy ostatni element statku nie znajdzie się poza macierzą, oraz pierwszy i ostatni element nie znajdzie się na innym statku lub obszarze wave
            @c2 = [x, y+1]
            @c3 = [x, y+2]
            @cruiser = [@c1, @c2, @c3]
         else
            place_cruiser   # wywołanie metody ponownie (jeśli wybrany zły punkt początkowy)
         end
      else
         @c1 = [x = (0..9).to_a.sample, y = (0..9).to_a.sample]   # jeśli wylosowana opcja pion
         if ocean[@c1[0] + 2, @c1[1]] != nil &&
            ocean[@c1[0] + 2, @c1[1]] != '.' &&
            ocean[@c1[0] + 2, @c1[1]] != '#' &&
            ocean[@c1[0], @c1[1]] != '.' &&
            ocean[@c1[0], @c1[1]] != '#' # sprawdzenie czy ostatni element statku nie znajdzie się poza macierzą, oraz pierwszy i ostatni element nie znajdzie się na innym statku lub obszarze wave
            @c2 = [x+1, y]
            @c3 = [x+2, y]
            @cruiser = [@c1, @c2, @c3]
         else
            place_cruiser   # wywołanie metody ponownie (jeśli wybrany zły punkt początkowy)
         end
      end
      @cruiser.inspect
   end

   def place_destroyer   # 2-masztowiec
      if horizontal_or_vertical   # jeśli wylosowana opcja poziom
         @d1 = [x = (0..9).to_a.sample, y = (0..9).to_a.sample]
         if ocean[@d1[0], @d1[1] + 1] != nil &&
            ocean[@d1[0], @d1[1] + 1] != '.' &&
            ocean[@d1[0], @d1[1] + 1] != '#' &&
            ocean[@d1[0], @d1[1]] != '.' &&
            ocean[@d1[0], @d1[1]] != '#' # sprawdzenie czy ostatni element statku nie znajdzie się poza macierzą, oraz pierwszy i ostatni element nie znajdzie się na innym statku lub obszarze wave
            @d2 = [x, y+1]
            @destroyer = [@d1, @d2]
         else
            place_destroyer   # wywołanie metody ponownie (jeśli wybrany zły punkt początkowy)
         end
      else
         @d1 = [x = (0..9).to_a.sample, y = (0..9).to_a.sample]   # jeśli wylosowana opcja pion
         if ocean[@d1[0] + 1, @d1[1]] != nil &&
            ocean[@d1[0] + 1, @d1[1]] != '.' &&
            ocean[@d1[0] + 1, @d1[1]] != '#' &&
            ocean[@d1[0], @d1[1]] != '.' &&
            ocean[@d1[0], @d1[1]] != '#' # sprawdzenie czy ostatni element statku nie znajdzie się poza macierzą, oraz pierwszy i ostatni element nie znajdzie się na innym statku lub obszarze wave
            @d2 = [x+1, y]
            @destroyer = [@d1, @d2]
         else
            place_destroyer   # wywołanie metody ponownie (jeśli wybrany zły punkt początkowy)
         end
      end
      @destroyer.inspect
   end

   def place_submarine   # 1-masztowiec
      @s1 = [x = (0..9).to_a.sample, y = (0..9).to_a.sample]
      if ocean[@s1[0], @s1[1]] != '.' && ocean[@s1[0], @s1[1]] != '#'
         @submarine = [@s1]
      else
         place_submarine   # wywołanie metody ponownie (jeśli wybrany zły punkt początkowy)
      end
      @submarine
   end

   def mark_battleship_on_ocean
      @battleship.each do |elem|
         ocean.[]=(elem[0], elem[1], '#')
      end
   end

   def mark_cruiser_on_ocean
      @cruiser.each do |elem|
         ocean.[]=(elem[0], elem[1], '#')
      end
   end

   def mark_destroyer_on_ocean
      @destroyer.each do |elem|
         ocean.[]=(elem[0], elem[1], '#')
      end
   end

   def mark_submarine_on_ocean
      @submarine.each do |elem|
         ocean.[]=(elem[0], elem[1], '#')
      end
   end

   def mark_waves_around_mast(mast)

      if mast[0] == 0 || mast[0] == 9 || mast[1] == 0 || mast[1] == 9
         if mast[0] == 0 && mast[1] == 0
            if ocean[mast[0], mast[1]+1] != '#'   # 01
               ocean.[]=(mast[0], mast[1]+1, '.')
            else
               '#'
            end
            if ocean[mast[0]+1, mast[1]+1] != '#'   # 11
               ocean.[]=(mast[0]+1, mast[1]+1, '.')
            else
               '#'
            end
            if ocean[mast[0]+1, mast[1]] != '#'   # 10
               ocean.[]=(mast[0]+1, mast[1], '.')
            else
               '#'
            end
         elsif mast[0] == 0 && mast[1] != 0 && mast[1] != 9
            if ocean[mast[0], mast[1]+1] != '#'   # 02
               ocean.[]=(mast[0], mast[1]+1, '.')
            else
               '#'
            end
            if ocean[mast[0]+1, mast[1]+1] != '#'   # 12
               ocean.[]=(mast[0]+1, mast[1]+1, '.')
            else
               '#'
            end
            if ocean[mast[0]+1, mast[1]] != '#'   # 11
               ocean.[]=(mast[0]+1, mast[1], '.')
            else
               '#'
            end
            if ocean[mast[0]+1, mast[1]-1] != '#'   # 10
               ocean.[]=(mast[0]+1, mast[1]-1, '.')
            else
               '#'
            end
            if ocean[mast[0], mast[1]-1] != '#'   # 00
               ocean.[]=(mast[0], mast[1]-1, '.')
            else
               '#'
            end
         elsif mast[0] == 0 && mast[1] == 9
            if ocean[mast[0]+1, mast[1]] != '#'   # 01
               ocean.[]=(mast[0]+1, mast[1], '.')
            else
               '#'
            end
            if ocean[mast[0]+1, mast[1]-1] != '#'   # 11
               ocean.[]=(mast[0]+1, mast[1]-1, '.')
            else
               '#'
            end
            if ocean[mast[0], mast[1]-1] != '#'   # 10
               ocean.[]=(mast[0], mast[1]-1, '.')
            else
               '#'
            end
         elsif mast[0] == 9 && mast[1] == 0
            if ocean[mast[0]-1, mast[1]] != '#'   # 80
               ocean.[]=(mast[0]-1, mast[1], '.')
            else
               '#'
            end
            if ocean[mast[0]-1, mast[1]+1] != '#'   # 81
               ocean.[]=(mast[0]-1, mast[1]+1, '.')
            else
               '#'
            end
            if ocean[mast[0], mast[1]+1] != '#'   # 91
               ocean.[]=(mast[0], mast[1]+1, '.')
            else
               '#'
            end
         elsif mast[0] == 9 && mast[1] != 0 && mast[1] != 9
            if ocean[mast[0], mast[1]-1] != '#'   # 90
               ocean.[]=(mast[0], mast[1]-1, '.')
            else
               '#'
            end
            if ocean[mast[0]-1, mast[1]-1] != '#'   # 80
               ocean.[]=(mast[0]-1, mast[1]-1, '.')
            else
               '#'
            end
            if ocean[mast[0]-1, mast[1]] != '#'   # 81
               ocean.[]=(mast[0]-1, mast[1], '.')
            else
               '#'
            end
            if ocean[mast[0]-1, mast[1]+1] != '#'   # 82
               ocean.[]=(mast[0]-1, mast[1]+1, '.')
            else
               '#'
            end
            if ocean[mast[0], mast[1]+1] != '#'   # 92
               ocean.[]=(mast[0], mast[1]+1, '.')
            else
               '#'
            end
         elsif mast[0] == 9 && mast[1] == 9
            if ocean[mast[0], mast[1]-1] != '#'   # 98
               ocean.[]=(mast[0], mast[1]-1, '.')
            else
               '#'
            end
            if ocean[mast[0]-1, mast[1]-1] != '#'   # 88
               ocean.[]=(mast[0]-1, mast[1]-1, '.')
            else
               '#'
            end
            if ocean[mast[0]-1, mast[1]] != '#'   # 89
               ocean.[]=(mast[0]-1, mast[1], '.')
            else
               '#'
            end
         elsif mast[1] == 0 && mast[0] != 0 && mast[0] != 9
            if ocean[mast[0]-1, mast[1]] != '#'   # 70
               ocean.[]=(mast[0]-1, mast[1], '.')
            else
               '#'
            end
            if ocean[mast[0]-1, mast[1]+1] != '#'   # 71
               ocean.[]=(mast[0]-1, mast[1]+1, '.')
            else
               '#'
            end
            if ocean[mast[0], mast[1]+1] != '#'   # 81
               ocean.[]=(mast[0], mast[1]+1, '.')
            else
               '#'
            end
            if ocean[mast[0]+1, mast[1]+1] != '#'   # 91
               ocean.[]=(mast[0]+1, mast[1]+1, '.')
            else
               '#'
            end
            if ocean[mast[0]+1, mast[1]] != '#'   # 90
               ocean.[]=(mast[0]+1, mast[1], '.')
            else
               '#'
            end
         elsif mast[1] == 9 && mast[0] != 0 && mast[0] != 9
            if ocean[mast[0]+1, mast[1]] != '#'   # 99
               ocean.[]=(mast[0]+1, mast[1], '.')
            else
               '#'
            end
            if ocean[mast[0]+1, mast[1]-1] != '#'   # 98
               ocean.[]=(mast[0]+1, mast[1]-1, '.')
            else
               '#'
            end
            if ocean[mast[0], mast[1]-1] != '#'   # 88
               ocean.[]=(mast[0], mast[1]-1, '.')
            else
               '#'
            end
            if ocean[mast[0]-1, mast[1]-1] != '#'   # 78
               ocean.[]=(mast[0]-1, mast[1]-1, '.')
            else
               '#'
            end
            if ocean[mast[0]-1, mast[1]] != '#'   # 79
               ocean.[]=(mast[0]-1, mast[1], '.')
            else
               '#'
            end
         end
      else
         if ocean[mast[0], mast[1]-1] != '#'   # 62
            ocean.[]=(mast[0], mast[1]-1, '.')
         else
            '#'
         end
         if ocean[mast[0]-1, mast[1]-1] != '#'   # 52
            ocean.[]=(mast[0]-1, mast[1]-1, '.')
         else
            '#'
         end
         if ocean[mast[0]-1, mast[1]] != '#'   # 53
            ocean.[]=(mast[0]-1, mast[1], '.')
         else
            '#'
         end
         if ocean[mast[0]-1, mast[1]+1] != '#'   # 54
            ocean.[]=(mast[0]-1, mast[1]+1, '.')
         else
            '#'
         end
         if ocean[mast[0], mast[1]+1] != '#'   # 64
            ocean.[]=(mast[0], mast[1]+1, '.')
         else
            '#'
         end
         if ocean[mast[0]+1, mast[1]+1] != '#'   # 74
            ocean.[]=(mast[0]+1, mast[1]+1, '.')
         else
            '#'
         end
         if ocean[mast[0]+1, mast[1]] != '#'   # 73
            ocean.[]=(mast[0]+1, mast[1], '.')
         else
            '#'
         end
         if ocean[mast[0]+1, mast[1]-1] != '#'   # 72
            ocean.[]=(mast[0]+1, mast[1]-1, '.')
         else
            '#'
         end
         ocean.to_a.each { |row| row.inspect }
      end
   end   # metoda dzięki której zaznaczane są pola dookoła każdego masztu z uwzględnieniem miejsc gdzie nie da się zaznaczyć (krawędź macierzy) /problematyczne było zaznaczanie gdy któraś wsþółrzędna wynosi -1 -> wtedy następowało nieprawidłowe przejście do ostatniego wiersza lub kolumny macierzy, dlatego aby to wyeliminować kod tej metody ma tylko 215 linijek ;p /

   def mark_waves_around_battleship
      @battleship.each do |elem|
         mark_waves_around_mast(elem)
      end
   end

   def mark_waves_around_cruiser
      @cruiser.each do |elem|
         mark_waves_around_mast(elem)
      end
   end

   def mark_waves_around_destroyer
      @destroyer.each do |elem|
         mark_waves_around_mast(elem)
      end
   end

   def mark_waves_around_submarine
      @submarine.each do |elem|
         mark_waves_around_mast(elem)
      end
   end

end

ships = Ships.new
ships.make_board_to_play_ships
ships.look_on_board
