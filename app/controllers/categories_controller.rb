class CategoriesController < ApplicationController
before_action :get_categories, only: [:index]
before_action :get_category, only: [:show]

private

	def get_category
		@category = Category.find(params[:id])
	end

	def get_categories
		@categories = Category.all
	end

end
