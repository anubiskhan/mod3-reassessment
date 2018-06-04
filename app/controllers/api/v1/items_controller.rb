class Api::V1::ItemsController < ApiController
  def index
    @items = Item.all
    render json: {
      status: 200,
      items: @items.each do |item|
        {
          id: item.id,
          name: item.name,
          description: item.description,
          image_url: item.image_url
        }
      end
    }.to_json
  end
end
