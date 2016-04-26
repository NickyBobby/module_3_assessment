class SearchController < ApplicationController
  def index
    @products = service.find_products(params['Search'])['products']
  end

  private

    def service
      @service ||= BestBuyService.new
    end
end
