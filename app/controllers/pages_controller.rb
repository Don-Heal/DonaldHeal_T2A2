class PagesController < ApplicationController
before_action :variables, only: [:home, :categories]

    def home
    end

    def categories
        @item = Item.where(category_id: params[:id])
    end

    private

    def variables
        @categories = Category.all
    end

end
