class RandomUsersController < ApplicationController

  def index
      @random_user = RandomUserService.fetch_random_user
      render 'random_users/index'
  end
end