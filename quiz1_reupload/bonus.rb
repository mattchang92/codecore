def titleize(string)
  array = string.split(" ")
  capitalized = array.map { |word|
    case word
    when "in","the","of","and","or","from"
      word
    else
      word.capitalize
    end
  }
  return capitalized.join(" ")

end

# variables string, array and capitalized are un-mutated/retain their initially assigned values
p titleize("some really long string is the of and")
