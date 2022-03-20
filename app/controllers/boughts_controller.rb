class BoughtsController < ApplicationController
before_action :find_item, only: [:purchase, :update]

    def purchase
        
    end
# updates item to sold and changes user id to current user
    def updated
        @item = @item.update({user_id: current_user.id, sold: true})
    end

    private
# finds the item required
    def find_item
        @item = Item.find(params[:id])
    end


end
