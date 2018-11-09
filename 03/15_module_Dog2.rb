module Collar
   def pull
      puts "Pulling #{self}"
   end
end

module TrackingChip
   def get_tracking_id
      @tracking_id ||= rand(1000)
   end
end

class Dog
   extend Collar # extend oznacza zastoswanie modułu dla klasy samej w sobie, include oznacza zastosowanie dla wszystkich instancji klasy
   include Collar
   include TrackingChip
end


# zapis @tracking_id ||= rand(1000) czyli inaczej @tracking_id = @tracking_id || rand(1000) sprawia, że przy pierwszym wywołaniu metody zostanie nadana wartość tracking_id, a przy każdym kolejnym już nie, tylko zostanie pokazana ta pierwsza wartość (losowa wartość zostanie nadana gdy wartość tracking_id równa sie 0 lub false)
