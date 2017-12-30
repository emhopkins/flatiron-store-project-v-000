class Cart < ActiveRecord::Base
	belongs_to :user
	has_many :line_items
	has_many :items, through: :line_items

	def total
		total = 0
		self.line_items.each do |l|
			item_total = l.quantity * l.item.price
			total += item_total
		end
		total
	end

	def add_item(item_id)
		#check if there is a line item for this item in the user's cart
		@item = Item.find(item_id)
		@line_item = LineItem.find_by(cart: self, item: @item)
		if @line_item.nil?
			@item.line_items.new(cart: self, item: @item, quantity: 1)
		else
			@line_item.quantity += 1
			@line_item
		end
	end
end
