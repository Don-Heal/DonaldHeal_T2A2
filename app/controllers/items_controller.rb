class ItemsController < ApplicationController
  before_action :form_dependencies, only: [:new, :edit, :create]
  before_action :find_item, only: [:show, :edit, :update, :delete, :auth_user, :buy]
  before_action :auth_params, only: [:create, :update]
  before_action :auth_user, only: [:delete, :edit]

# show all Items that the database contains
  def index
    @items = Item.where(sold: false)
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

  def user_items
    @items = Item.where(user_id: current_user.id, sold: false)
  end

  def delete
    @item.destroy
    redirect_to "/items/index", notice: "Your item has been deleted."
  end

  def update
    @item.update(auth_params)
      if @item.save
        redirect_to "/items/index", notice: "Your item has been created successfully."
      else
        redirect_to "/items/index", alert: "Something went wrong with your item please try again."
      end
  end

  def buy
    @item.update({user_id: current_user.id, sold: true})
      if @item.save
        redirect_to "/items/index", notice: "You bought an item."
      else
        redirect_to "/items/index", alert: "Something went wrong please try again."
      end
  end

  def order_history
    @items = Item.where(user_id: current_user.id, sold: true)
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

# acccepted params for creating and updating for security.
  def auth_params
    (params.require(:item).permit(:name, :description, :condition, :category_id, :price, :picture))
  end

# prevent editing and deleting through params for unautherised users
  def auth_user
    if @item.user_id != current_user.id
      redirect_to "/items/index"
    end
  end

end
