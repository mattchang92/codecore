require "benchmark"

# Using a loop
def evenNumbersLoop(number)
  array = []
  for i in 1..number
    array.push(i*2)
  end
  return array
end
p evenNumbersLoop(10)

# Using recursion
def evenNumbersRecursive(number)
  if number == 1
    return [2]
  else
    return evenNumbersRecursive(number-1).push(number*2)
  end
end
p evenNumbersRecursive(10)

Benchmark.bm do |x|
  x.report do
    1_000_000.times { evenNumbersLoop(10) }
  end
  x.report do
    1_000_000.times { evenNumbersRecursive(10) }
  end
end

# Performing the task recursively was much faster. One million iterations took 1.2s to finish recursively while it took 1.6s using a loop
