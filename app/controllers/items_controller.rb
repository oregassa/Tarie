class ItemsController < ApplicationController
	before_action :setup_item, only: [:edit, :show, :update, :destroy]
    before_action :authenticate_user!, except: [:index]


   	def index
   	  if user_signed_in?
        @items = Item.where(:user_id => current_user.id).order('created_at DESC')
	  end
    end


	def new
	  @item = current_user.items.build
	end


	def create
	  @item = current_user.items.build(item_params)

	  if @item.save 
	  	flash[:success] = 'Item has been crated'
	  	redirect_to root_path
	  else
	  	render 'new'
	  end
	end


	def show
	end



	def edit
	end



	def update
      if @item.update(item_params)
	    flash[:danger] = 'Item has been updated'
	  	redirect_to item_path(@item)
	  else
	  	render 'edit'
	  end
	end



	def destroy
	  if @item.destroy 
	    flash[:danger] = 'Item has been removed'
	  	redirect_to root_path
	  else
	  	render 'edit'
	  end
	end

	def complete
	  @item = Item.find(params[:id])
	  @item.update_attribute(:completed_at, Time.now)
	  # Take the item, when call the complete
	  # method, it'll update the completed_at value, which
	  # will have a nil value until it's completed and
	  # it'll update it of the current time.
	  redirect_to root_path
	  # To define what (complete) is go in the item method.
	  # Then make a route fo it
	end
    

	private 

	def setup_item
      @item = Item.find(params[:id])
	end

	def item_params
  	  params.require(:item).permit(:title, :description)
	end
end
