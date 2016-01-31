class ItemsController < ApplicationController

  def index
    @q = Item.ransack(params[:q])
    @items = @q.result(distinct: true)
  end

  def show
  	@item = Item.find(params[:id])
    # Item.increment_counter(:view_counter, @item.id) 
    CounterOnItemView.perform_async(@item.id)
  end

  def new
  	@item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to item_path(@item.id), notice: "Item Created Successfully"
    else
      render :new
    end
  end



  private

  def item_params
  	params.require(:item).permit(:title, :description)
  end


end