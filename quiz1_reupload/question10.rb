module SuperUsefulAdditionalMethod
  def whoAmI
    p "Hi I'm a super useful injected method!"
  end
end

class FirstExample
  include SuperUsefulAdditionalMethod
end

class SecondExample
  extend SuperUsefulAdditionalMethod
end

# Creating a new instance of the class FirstExample and calling whoAmI as an instance method of "first". Same as writing the def whoAmI function within class FirstExample
first = FirstExample.new
first.whoAmI

# Calling whoAmI as a class method. Same as writing self.whoAmI within class SecondExample
SecondExample.whoAmI
