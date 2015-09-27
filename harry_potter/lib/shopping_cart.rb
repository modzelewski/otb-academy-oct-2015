class ShoppingCart

	def add_items(items)
		self.items.push(*items)
	end

	def sum
		final_price = 0
		items.each do |item| 
			final_price += item.price
		end
		final_price
	end

	def items
		@items ||= []
	end

end