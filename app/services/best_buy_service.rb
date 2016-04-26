class BestBuyService

  def find_products(term)
    search_term = parse_terms(term)
    parse(Faraday.get("https://api.bestbuy.com/v1/products(#{search_term})?format=json&pageSize=15&show=sku,name,customerReviewAverage,shortDescription,salePrice,image&apiKey=#{ENV['BEST_BUY_API']}"))
  end

  private

    def parse(response)
      JSON.parse(response.body)
    end

    def parse_terms(term)
      p_term = term.split(" ")
      group = ["search="]
      if p_term.count == 1
        group << p_term.first
      else
        p_term.each do |term|
          group << term
          group << "&search=" unless term == p_term.last
        end
      end
      group.join
    end
end
