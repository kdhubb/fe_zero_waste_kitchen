class NutritionService
  def ingredients_weight(search)
    get_url("?query=#{search}")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://api.api-ninjas.com/v1/nutrition') do |faraday|
      faraday.headers['X-Api-Key'] = ENV['NUTRITION_API_KEY']
    end
  end
end
