class PagesController < ApplicationController
before_action :variables, :auth_user, only: [:home, :categories]
    def home
    end

    def categories
        @item = Item.where(category_id: params[:id])
    end

    private

    def variables
        @categories = Category.all
    end

    def auth_user
        if @item.user_id != current_user.id
            redirect_to home_page_path alert: "Please Sign In or Sign Up to do that."
        end
    end
end
