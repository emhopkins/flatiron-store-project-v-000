class CartsController < ApplicationController
before_action :get_user
before_action :get_cart

	def show
	end

	def checkout
		@cart.line_items.each do |line_item|
			line_item.item.inventory -= line_item.quantity
			line_item.item.save
		end
		@cart.status = "submitted"
		@cart.save
		current_user.current_cart = nil
		redirect_to cart_path(@cart)
	end

	private

	def get_user
		@user = current_user
	end

	def get_cart
		@cart = Cart.find(params[:id])
	end
end
