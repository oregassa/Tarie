class ItemsController < ApplicationController
	before_action :setup_item, only: [:edit, :show, :update, :destroy]

   	def index
	  @items = Item.all
	end


	def new
	  @item = Item.new
	end


	def create
	  @item = Item.new(item_params)

	  if @item.save 
	  	flash[:success] = 'Item has been crated'
	  	redirect_to root_path
	  else
	  	render 'new'
	  end
	end


	def show
	  @item = Item.find(params[:id])
	end



	def edit
	  @item = Item.find(params[:id])
	end



	def update
	  @item = Item.find(params[:id])

      if @item.update(item_params)
	    flash[:danger] = 'Item has been updated'
	  	redirect_to item_path(@item)
	  else
	  	render 'edit'
	  end
	end



	def destroy
	  @item = Item.find(params[:id])

	  if @item.destroy 
	    flash[:danger] = 'Item has been removed'
	  	redirect_to root_path
	  else
	  	render 'edit'
	  end
	end



	private 

	def setup_item
      @item = Item.find(params[:id])
	end

	def item_params
  	  params.require(:item).permit(:title, :description)
	end
end
