class ItemsController < ApplicationController
  before_action :form_dependencies, only: [:new, :edit]

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @items = current_user.items.new(params.require(:item).permit(:name, :description, :condition, :category_id, :price))
    if @items.save
      redirect_to "/items/index", notice: "Item was successfully created"
    else
      redirect_to "/items/new", alert: "Item was not created"
    end
  end

  private

  def form_dependencies
    @condition = Item.conditions.keys
    @categories = Category.all
  end

end
