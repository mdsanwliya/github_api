class DashboardController < ApplicationController
  def show
    url = URI("https://api.github.com/users/#{current_user.name}/repos")
    res =  Net::HTTP.get_response(url)
    @response = JSON.parse(res.body)
  end

  def current_user
    User.find_by!(uid: session[:uid]) 
  end
end
