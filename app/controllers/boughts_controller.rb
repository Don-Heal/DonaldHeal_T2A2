class BoughtsController < ApplicationController
before_action :find_item, only: [:purchase, :update]

    def purchase
        
    end

    def updated
        @item = @item.update({user_id: current_user.id, sold: true})
    end

    private

    def find_item
        @item = Item.find(params[:id])
    end


end
