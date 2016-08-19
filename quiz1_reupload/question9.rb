class Book

  attr_accessor :title, :chapters

  def initialize
    @chapters = []
  end

  def add_chapter(name)
    @chapters.push(name)
  end


  def chapters
    puts "Your book #{title} has #{@chapters.length} chapters:"
    for i in 1..@chapters.length
      puts "#{i}. #{@chapters[i-1]}"
    end
  end

end


book = Book.new
book.title = "Ultimate Dr. Seuss Collections"
book.add_chapter("The Cat in the Hat")
book.add_chapter("Green Eggs and Ham")
book.add_chapter("The Lorax")
book.add_chapter("Horton Hears a Who!")
book.chapters
