class DashboardController < ApplicationController

  before_filter :force_user_to_complete_profile, except: [:profile, :update_info]

  def index
    @services = current_user.services
  end

  private


end
