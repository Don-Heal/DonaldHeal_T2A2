class BoughtsController < ApplicationController
before_action :find_item, only: [:update, :purchase]

    def purchase
        
    end

    def updated
        @item
    end

    private

    def find_item
        @item = Item.find(params[:id])
    end
end
