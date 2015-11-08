class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index
    @services = current_user.services
  end
end
