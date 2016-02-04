class ItemsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @q = Item.ransack(params[:q])
    @items = @q.result(distinct: true).decorate

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
    @item.user_id = current_user.id

    if @item.save
      redirect_to item_path(@item.id), notice: "Item Created Successfully"
    else
      render :new
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to items_path
  end


  private

  def item_params
  	params.require(:item).permit(:title, :description)
  end


end