class Animal
  def initialize(name)
    @name = name
    puts "Hello, my name is: #{@name}"
  end

  def breed
    @breed
  end

  def feel
     puts "#{@name} is feeling great!"
  end
end


class Dog < Animal
  def bark
    puts "Barking!!!!!"
  end

  def initialize(name)
    @name = name
    puts "Bark, Bark my name is: #{@name}"
    super
  end

  def name
    @name
  end

  def name=(value)
    @name = value
  end
end
