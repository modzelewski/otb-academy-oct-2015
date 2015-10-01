class Book

  def initialize(isbn, title)
    @isbn = isbn
    @title = title
  end

  def to_s
    @title
  end

end
