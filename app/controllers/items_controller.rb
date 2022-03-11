class ItemsController < ApplicationController
  before_action :form_dependencies, only: [:new, :edit]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @items = current_user.items.new(params.require(:item).permit(:name, :description, :condition, :category_id, :price))
    if @items.save
      redirect_to "/items/index", notice: "Your item has been created successfully."
    else
      redirect_to "/items/new", alert: "Something went wrong with your item please try again."
    end
  end

  def show
    @items = Item.find(params[:id])
  end

  private

  def form_dependencies
    @condition = Item.conditions.keys
    @categories = Category.all
  end

end
