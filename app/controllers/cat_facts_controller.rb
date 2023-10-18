class CatFactsController < ApplicationController

  def index
    @catfacts = params[:owned] == "true" ? Catfact.owned_by_user(current_user) : Catfact.all
  end
  def fetch_catfact
    response = RestClient.get 'https://catfact.ninja/fact'
    fact = JSON.parse(response.body)['fact']
    current_user.catfacts.create(fact: fact)
    redirect_to cat_facts_path
  end
end