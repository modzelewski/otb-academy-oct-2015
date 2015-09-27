class Book

	def initialize(isbn, title)
		@isbn = isbn
		@title = title
	end

	def price
		8
	end

	def to_s
		@title
	end

end