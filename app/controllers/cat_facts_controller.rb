class CatFactsController < ApplicationController
  before_action :authenticate_user!, only: [:fetch_catfact]
  def index
    @catfacts = params[:owned] == "true" ? Catfact.owned_by_user(current_user) : Catfact.all
  end

  def fetch_catfact
    fact = CatFactService.generate_cat_fact

    if fact.present?
      current_user.catfacts.create(fact: fact)
      redirect_to cat_facts_path, notice: "Cat fact saved successfully!"
    else
      redirect_to cat_facts_path, alert: "Failed to fetch cat fact. Please try again later."
    end
  end
end