class ItemsController < ApplicationController
  before_action :form_dependencies, only: [:new, :edit]
  before_action :find_item, only: [:show, :edit, :update, :destroy]
  before_action :auth_params, only: [:create, :update]


# show all Items that the database contains
  def index
    @items = Item.all
  end

# makes a new Item to be sent to create to post to database
  def new
    @item = Item.new
  end

# create and save a new item to database only allowing the params that the form used to be accepted to make it more secure
  def create
    @items = current_user.items.new(auth_params)
      if @items.save
        redirect_to "/items/index", notice: "Your item has been created successfully."
      else
        redirect_to "/items/new", alert: "Something went wrong with your item please try again."
      end
  end

# shows specific Item on screen by using the params to find correct item
  def show
  end

  def edit
  end

  def update
    @item.update(auth_params)
      if @item.save
        redirect_to "/items/index", notice: "Your item has been created successfully."
      else
        redirect_to "/items/index", alert: "Something went wrong with your item please try again."
      end
  end

  private

# sets both variables for both conditions and catagory to be used in the partial form when creating or editing a new Item
  def form_dependencies
    @condition = Item.conditions.keys
    @categories = Category.all
  end

# set varible for finding a specific listing
  def find_item
    @item = Item.find(params[:id])
  end

#acccepted params for creating and updating for security.
  def auth_params
    (params.require(:item).permit(:name, :description, :condition, :category_id, :price))
  end

end
