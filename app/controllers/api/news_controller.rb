class Api::NewsController < ApplicationController
  def index
    params = { 'apiKey': '60623ca4edb546d7945dd268c9e147e3', country: 'ph' }
    url = 'https://newsapi.org/v2/top-headlines'

    @response = RestClient.get url, params: params
    @articles = JSON.parse(@response)['articles']
  end
end