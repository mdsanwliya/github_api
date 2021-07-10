class DashboardController < ApplicationController
  def show
    @response = []
    if current_user
      @response = GithubApiService.new(current_user).execute
    end
  end

  def current_user
    User.find_by(uid: session[:uid]) 
  end
end
