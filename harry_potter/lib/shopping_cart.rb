require_relative "book"

class ShoppingCart

	def add_items(items)
		self.items.push(*items)
	end

	def sum
		sets = discount_sets(duplicates_counts(items))
		total = 0
		sets.each {|set| total += sum_set(set)}
		puts sets[0]
		total
	end

	def sum_set(set)
		price * set.count * discount(set.count)
	end

	def price
		8
	end

	def discount_sets(duplicates)
		sets = []
		while duplicates.size > 0 do
			set = []
			sets.push(set)
			duplicates.each_index do
				|index|
				if duplicates[index] > 0
					set.push(1)
					duplicates[index] -= 1
				end
			end
			duplicates.delete_if {|value| value == 0 } 
		end
		sets
	end

	def duplicates_counts(items)
		(items.uniq.map { 
			|item| 
			items.count(item)
		}).sort
	end

	def items
		@items ||= []
	end

	def discount(unique_items_count)
		percent = discounts[unique_items_count] || 0
		1 - percent
	end

	def discounts
		{
			2 => 0.05,
			3 => 0.10,
			4 => 0.20,
			5 => 0.25,
		}
	end
end