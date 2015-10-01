require_relative "book"

class ShoppingCart

  def add_items(items)
    self.items.push(*items)
  end

  def sum
    best_price(3,5)
  end

  def best_price(min_set_price, max_set_price)
    prices = []
    min_set_price.upto(max_set_price).each do
      |index|
      prices.push(sum_with_set_size(index))
    end
    prices.min
  end

  def sum_with_set_size(set_size)
    sets = discount_sets(duplicates_counts(items), set_size)
    sets.inject(0) { |total, value| 
      total += sum_set(value)
    }
  end

  def sum_set(set)
    price * set.count * discount(set.count)
  end

  def price
    8
  end

  def discount_sets(duplicates, max_count)
    sets = []
    while duplicates.size > 0 do
      set = []
      sets.push(set)
      duplicates.each_index do |index|
        if duplicates[index] > 0
          set.push(1)
          duplicates[index] -= 1
        end
        break if set.count == max_count
      end
      duplicates.delete_if { |value| value == 0 } 
    end
    sets
  end

  def duplicates_counts(items)
    (items.uniq.map { 
      |item| 
      items.count(item)
    }).sort.reverse
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

