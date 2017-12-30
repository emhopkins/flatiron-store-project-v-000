class LineItemsController < ApplicationController
before_action :get_cart

	def create
		new_line_item = @cart.add_item(params[:item_id])
		if new_line_item.save
			redirect_to cart_path(@cart)
		else
			redirect_to store_path
		end
	end

	private

	def get_cart
		if current_user.current_cart.nil?
			@cart = current_user.carts.create
		else
			@cart = current_user.current_cart
		end
	end
end
