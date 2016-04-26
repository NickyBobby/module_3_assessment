class Api::V1::ItemsController < Api::V1::BaseController
  respond_to :json

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params['id'])
  end

  def destroy
    respond_with Item.find(params['id']).destroy
  end

  def create
    respond_with Item.create(name: params[:name],
                             description: params[:description],
                             image_url: params[:image_url])
    # respond_with Item.create(item_params)
    # couldn't get it to work with strong params | need to come back to this
  end

  private

    def item_params
      params.require(:item).permit(:name, :description, :image_url)
    end
end
