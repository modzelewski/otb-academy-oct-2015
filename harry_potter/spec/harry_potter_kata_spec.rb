require "book"
require "shopping_cart"

RSpec.describe "Harry Potter Kata" do

	book_1 = Book.new(1, 'Book 1')
	book_2 = Book.new(2, 'Book 2')
	book_3 = Book.new(3, 'Book 3')
	book_4 = Book.new(4, 'Book 4')
	book_5 = Book.new(5, 'Book 5')

	before(:each) do
    @cart = ShoppingCart.new
  end

	it "calculates price without discount for one book" do
		@cart.add_items([book_1])
		expect(@cart.sum).to eq(8)
	end

	it "calculates price without discount for multiple books of same kind" do
		@cart.add_items([book_1, book_1])
		expect(@cart.sum).to eq(16) # 2 * 8
	end

end