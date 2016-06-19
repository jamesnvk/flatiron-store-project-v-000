class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    self.line_items.inject(0) { |sum, li| sum + li.item.price * li.quantity }
  end

  def add_item(item_id)
    if item_ids.include?(item_id.to_i)
      line_item = self.line_items.find_by(item_id)
      line_item.update(quantity: line_item.quantity + 1)
      line_item
    else
      self.line_items.build(quantity: 1, cart_id: self.id, item_id: item_id)
      #binding.pry
    end
  end


end

