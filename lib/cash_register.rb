require "pry"

class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction


  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

   def add_item(item, price, count=1)
     self.total += price * count
     count.times do
       self.items << item
     end
     self.last_transaction = {
       item: item,
       price: price,
       count: count
     }
   end

   def apply_discount
     if self.discount > 0
       self.total = self.total * (1-(self.discount/100.0))
       "After the discount, the total comes to $#{self.total.to_int}."
     else
       "There is no discount to apply."
     end
   end

   def void_last_transaction
     self.total -= last_transaction[:price] * last_transaction[:count]
     last_transaction[:count].times do
       self.items.pop
     end
   end
end
