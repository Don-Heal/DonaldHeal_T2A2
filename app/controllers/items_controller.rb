class ItemsController < ApplicationController
  before_action :set_form_variable, only: [:new, :edit]

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.item.new(params.require(:item).permit(:name, :description, :price, :condition, :category))
    if item.save
      redirect_to "items/index", notice: "Item was successfully created"
    else
      redirect_to "items", notice: "Item was not created"
    end
  end

  private

  def set_form_variable
    @categories = Category.all
    @condition = Item.conditions.keys
  end

end
