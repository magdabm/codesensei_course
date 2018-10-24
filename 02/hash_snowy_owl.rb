
snowy_owl = { :type => "Bird", :diet => "Carnivore", :life_span => "10 years" }

snowy_owl.each { |key, value| puts value }

# to samo co:

snowy_owl.each do |key, value|
  puts value
end
