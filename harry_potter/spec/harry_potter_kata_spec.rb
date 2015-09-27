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

	it "adds 5% discount when two books of different kind in cart" do
		@cart.add_items([book_1, book_2])
		expect(@cart.sum).to eq(15.2) # 2 * 8 * 0.95
	end

	it "adds 10% discount when three books of different kind in cart" do
		@cart.add_items([book_1, book_2, book_3])
		expect(@cart.sum).to eq(21.6) # 3 * 8 * 0.90
	end

	it "adds 20% discount when four books of different kind in cart" do
		@cart.add_items([book_1, book_2, book_3, book_4])
		expect(@cart.sum).to eq(25.6) # 4 * 8 * 0.80
	end

	it "adds 25% discount when five books of different kind in cart" do
		@cart.add_items([book_1, book_2, book_3, book_4, book_5])
		expect(@cart.sum).to eq(30) # 5 * 8 * 0.75
	end

	it "adds 25% discount when five books of different kind in cart and no discount for one additinal" do
		@cart.add_items([book_1, book_2, book_3, book_4, book_5])
		@cart.add_items([book_1])
		expect(@cart.sum).to eq(38) # 5 * 8 * 0.75 + 8
	end

	it "adds multiple discounts" do
		@cart.add_items([book_1, book_2, book_3, book_4, book_5])
		@cart.add_items([book_1, book_2])
		expect(@cart.sum).to eq(45.2) # 5 * 8 * 0.75 + 8 * 2 * 0.95
	end

	xit "adds multiple discounts finding best deal" do
		@cart.add_items([book_1, book_1])
		@cart.add_items([book_2, book_2])
		@cart.add_items([book_3, book_3])
		@cart.add_items([book_4])
		@cart.add_items([book_5])
		expect(@cart.sum).to eq(51.20) # 4 * 8 * 0.80 + 4 * 8 * 0.80
	end

end