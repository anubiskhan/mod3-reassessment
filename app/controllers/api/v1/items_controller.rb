class Api::V1::ItemsController < ApiController
  def index
    @items = Item.all
    render json: @items
  end

  def show
    @item = Item.find(params[:id])
    render json: @item
  end

  def create
    item = Item.create(name: params[:name], description: params[:description], image_url: params[:image_url])
    render json: item,
    status: 201
  end

  def destroy
    item = Item.find(params[:id])
    item.delete
    render json: {
      status: 204
    }.to_json
  end
end
