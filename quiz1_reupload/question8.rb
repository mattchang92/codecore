require './question7'

module Blog

  class Article
    attr_accessor :title, :body
    include HelperMethods
    def title
      return self.titleize(@title)
    end
  end

  class Snippet < Article
    def body
      if @body.split("").length > 100
        return @body[0,100] + "..."
      else
        return @body
      end
    end
  end

end


article = Blog::Article.new
# Setting article's title and displaying it titleized using the method included from question 7
article.title = "article with the greatest title ever!"
p article.title

snip = Blog::Snippet.new
# Setting the snippet's body to a length greater than 100 characters and displaying the truncated version
snip.body = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"
p snip.body

# Setting the snippet's body to a shorter length so that the whole body is displayed
snip.body = "Lorem ipsum dolor sit amet"
p snip.body
