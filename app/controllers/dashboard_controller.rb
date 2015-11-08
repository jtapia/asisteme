class DashboardController < ApplicationController
  before_filter :authenticate_user!

  before_filter :find_current_user, only: [:profile, :update_info]

  before_filter :force_user_to_complete_profile, except: [:profile, :update_info]

  def index
    @services = current_user.services
  end

  def profile ; end

  def update_info
    @user.update_attributes(update_info_params)

    if @user.valid?
      @user.complete! if @user.pending?
      redirect_to action: :profile
    else
      render 'profile'
    end

  end

  private

    def force_user_to_complete_profile
      redirect_to action: :profile if current_user.pending?
    end

    def find_current_user
      @user = current_user
    end

    def update_info_params
      params.require(:user)
            .permit(:email,
                    :first_name,
                    :last_name,
                    :phone,
                    :bio,
                    :form,
                    :avatar)
    end

end
