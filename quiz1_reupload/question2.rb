# Stacks remove/process the last element added whereas queues remove the elements in the order that they were added
class Stack
  attr_accessor :array

  def initialize(array)
    @array = array
  end

  def add(number)
    @array.push(number)
  end

  def remove
    @array.pop
  end

end

my_stack = Stack.new([])
# Adds 1-5 to the array in that order
my_stack.add(1)
my_stack.add(2)
my_stack.add(3)
my_stack.add(4)
my_stack.add(5)
p my_stack.array
# Removes 5 from the end of array since it was the last element added
my_stack.remove
p my_stack.array


class Queue
  attr_accessor :array

  def initialize(array)
    @array = array
  end

  def add(number)
    @array.push(number)
  end

  def remove
    @array.shift
  end

end

my_queue = Queue.new([])
# Adds 1-5 to the array in that order
my_queue.add(1)
my_queue.add(2)
my_queue.add(3)
my_queue.add(4)
my_queue.add(5)
p my_queue.array
#Removes 1 from the front of the array since it was the first element added
my_queue.remove
p my_queue.array
