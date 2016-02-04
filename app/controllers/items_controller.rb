class ItemsController < ApplicationController
  before_action :authenticate_user!
  def index
    @q = Item.ransack(params[:q])
    @items = @q.result(distinct: true).decorate

  end

  def show
  	@item = Item.find(params[:id])
    # Item.increment_counter(:view_counter, @item.id)
    # CounterOnItemView.perform_async(@item.id)
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

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to items_path
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update 
    @item = Item.find(params[:id])
    @item.state_event = params[:button]

    if @item.update(item_params)
      flash[:success] = 'The item was updated'
      redirect_to items_path
    else
      flash[:error] = 'The item could not be updated'
      render :edit
    end
  end

  private

  def item_params
  	params.require(:item).permit(:title, :description, :state, :view_counter)
  end


end