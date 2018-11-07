module Home
   class Dog
      #definicja klasy
   end
end

dog = Home::Dog.new

# creating a class inside the module is possible, it may be needed when code will be use in unknown environment - in that situation we avoid names conflict
# when we use this solution, to refer to class inside the module we use record with module name, class name and colon twice
