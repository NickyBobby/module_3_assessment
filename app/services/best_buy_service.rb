class BestBuyService

  def find_products(term)
    result = parse(Faraday.get("https://api.bestbuy.com/v1/products(search=#{term})?format=json&pageSize=15&show=sku,name,customerReviewAverage,shortDescription,salePrice,image&apiKey=#{ENV['BEST_BUY_API']}"))
    binding.pry
  end

  private

    def parse(response)
      binding.pry
      JSON.parse(response)
    end
end
