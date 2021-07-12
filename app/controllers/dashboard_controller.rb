class DashboardController < ApplicationController
  before_action :current_user, only: %i[show repositories]

  def show
    @repos = GithubApiService.new(@user).execute(dashboard_params.to_h)
    respond_to do |format|
      format.js
      format.html 
    end
  end

  def current_user
    @user = User.find_by!(uid: session[:uid])
    rescue ActiveRecord::RecordNotFound => errors
      render notice: {errors: errors}
  end

  def dashboard_params
    params.permit(:date, :language)
  end
end
