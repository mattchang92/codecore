module HelperMethods

  def titleize(string)
    list = string.split(" ")
    for i in 0...list.length
      case list[i]
      when "in","the","of","and","or","from"
        next
      else
        list[i].capitalize!
      end
    end
    return list.join(" ")
  end

end


class Sentence
  include HelperMethods
end

# For testing purposes. Commented out so the line won't print when this file is loaded in question 8
# myString = Sentence.new
# p myString.titleize("hello this is a long string in the of and or")
