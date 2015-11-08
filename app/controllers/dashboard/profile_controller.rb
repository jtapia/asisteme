module Dashboard
  class ProfileController < ApplicationController
    before_filter :authenticate_user!
    before_filter :find_user


    def update
      @user.update_attributes(permitted_user_params)
      if @user.valid?
        @user.complete! if @user.pending?
        redirect_to dashboard_profile_path
      else
        render dashboard_edit_profile_path
      end

    end

    private

    def find_user
      @user = current_user
    end

    def permitted_user_params
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
end