class BestBuyService

  def find_products(term)
    parse(Faraday.get("https://api.bestbuy.com/v1/products(search=#{term})?format=json&pageSize=15&show=sku,name,customerReviewAverage,shortDescription,salePrice,image&apiKey=#{ENV['BEST_BUY_API']}"))
  end

  private

    def parse(response)
      JSON.parse(response.body)
    end
end
