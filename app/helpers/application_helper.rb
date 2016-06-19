module ApplicationHelper

  def items_inventory_greater_than_zero
    Item.all.select { |item| item.inventory > 0 }
  end

end
